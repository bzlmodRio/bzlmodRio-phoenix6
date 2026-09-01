#include "robot-cpp/subsystems/shooter.hpp"

#include <wpi/math/system/Models.hpp>
#include <wpi/smartdashboard/SmartDashboard.hpp>
#include <wpi/system/RobotController.hpp>

#include "robot-cpp/subsystems/ports.hpp"

namespace {
constexpr double kP = 0.01;
constexpr double kI = 0.0;
constexpr double kD = 0.0;

constexpr wpi::math::DCMotor kGearbox = wpi::math::DCMotor::Vex775Pro(2);
constexpr double kGearing = 4;
constexpr wpi::units::kilogram_square_meter_t kInertia{0.008};

wpi::math::LinearSystem<1, 1, 1> kPlant{
    wpi::math::Models::FlywheelFromPhysicalConstants(kGearbox, kInertia,
                                                     kGearing)};
}  // namespace

Shooter::Shooter()
    : m_motor{kShooterMotorPort, ctre::phoenix6::CANBus{}},
      m_voltageVelocity{0_tps},
      m_velocity(m_motor.GetVelocity()),
      m_motorSim(m_motor.GetSimState()),
      m_flywheelSim(kPlant, kGearbox) {
  ctre::phoenix6::configs::TalonFXConfiguration configs{};
  configs.Slot0.kP = kP;
  configs.Slot0.kI = kI;
  configs.Slot0.kD = kD;
  m_motor.GetConfigurator().Apply(configs);
}

void Shooter::Stop() { m_motor.SetControl(m_dutyCycleControl.WithOutput(0)); }

void Shooter::SpinAtRpm(wpi::units::revolutions_per_minute_t rpm) {
  m_motor.SetControl(m_voltageVelocity.WithVelocity(rpm));
}
wpi::units::revolutions_per_minute_t Shooter::GetRpm() {
  return m_velocity.GetValue();
}

void Shooter::Periodic() { Log(); }

void Shooter::SimulationPeriodic() {
  m_flywheelSim.SetInput(
      Eigen::Vector<double, 1>(m_motor.GetDutyCycle().GetValue().to<double>() *
                               wpi::RobotController::GetInputVoltage()));

  m_flywheelSim.Update(20_ms);
  m_motorSim.SetRotorVelocity(m_flywheelSim.GetAngularVelocity());
}

void Shooter::Log() {
  wpi::SmartDashboard::PutNumber(
      "Shooter Speed", m_motor.GetDutyCycle().GetValue().to<double>());
  wpi::SmartDashboard::PutNumber("Shooter RPM", GetRpm().to<double>());
}
