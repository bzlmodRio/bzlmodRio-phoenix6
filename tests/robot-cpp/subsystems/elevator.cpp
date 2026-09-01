#include "robot-cpp/subsystems/elevator.hpp"

#include <wpi/math/controller/PIDController.hpp>
#include <wpi/smartdashboard/SmartDashboard.hpp>
#include <wpi/system/RobotController.hpp>

#include "robot-cpp/subsystems/ports.hpp"

namespace {
constexpr double kP = 5.0;
constexpr double kI = 0.0;
constexpr double kD = 0.0;
constexpr wpi::units::volt_t kGravityOffset{0.85};

constexpr double kElevatorGearing = 10.0;
constexpr wpi::units::meter_t kElevatorDrumRadius = 2_in;
constexpr wpi::units::kilogram_t kCarriageMass = 4.0_kg;

constexpr wpi::units::meter_t kMinElevatorHeight = 0_in;
constexpr wpi::units::meter_t kMaxElevatorHeight = 50_in;

wpi::math::DCMotor kElevatorGearbox = wpi::math::DCMotor::Vex775Pro(4);

wpi::units::meter_t TurnsToMeters(wpi::units::turn_t rotations) {
  return rotations * kElevatorDrumRadius / 1_tr;
}
wpi::units::turn_t MetersToTurns(wpi::units::meter_t meters) {
  return meters / (kElevatorDrumRadius / 1_tr);
}
}  // namespace

Elevator::Elevator()
    : m_motor{kElevatorMotorPort, ctre::phoenix6::CANBus{}},
      m_positionControl{0_tr},
      m_position(m_motor.GetPosition()),
      m_motorSim(m_motor.GetSimState()),
      m_elevatorSim(kElevatorGearbox, kElevatorGearing, kCarriageMass,
                    kElevatorDrumRadius, kMinElevatorHeight, kMaxElevatorHeight,
                    true, wpi::units::meter_t{0}) {
  ctre::phoenix6::configs::TalonFXConfiguration configs{};
  configs.Slot0.kP = kP;
  configs.Slot0.kI = kI;
  configs.Slot0.kD = kD;
  m_motor.GetConfigurator().Apply(configs);
}

void Elevator::Log() {
  wpi::SmartDashboard::PutNumber("Elevator Height (m)",
                                 GetElevatorHeight().to<double>());
}

wpi::units::meter_t Elevator::GetElevatorHeight() {
  return TurnsToMeters(m_position.GetValue());
}

void Elevator::SetVoltage(double output) {
  m_motor.SetVoltage(kGravityOffset + wpi::units::volt_t(output));
}

void Elevator::GoToHeight(wpi::units::meter_t height) {
  m_positionControl.Position = MetersToTurns(height);
  m_motor.SetControl(m_positionControl);
}

bool Elevator::IsAtHeight() {
  wpi::units::meter_t error =
      TurnsToMeters(m_positionControl.Position) - GetElevatorHeight();
  return error < 2_in;
}

void Elevator::Periodic() { Log(); }

void Elevator::SimulationPeriodic() {
  m_elevatorSim.SetInput(Eigen::Vector<double, 1>(
      m_motor.GetMotorVoltage().GetValue().to<double>()));
  m_elevatorSim.Update(20_ms);
  m_motorSim.SetRawRotorPosition(MetersToTurns(m_elevatorSim.GetPosition()));
}

void Elevator::Stop() { m_motor.SetVoltage(0_V); }
