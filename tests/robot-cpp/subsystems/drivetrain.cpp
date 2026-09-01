#include "robot-cpp/subsystems/drivetrain.hpp"

#include <wpi/driverstation/Joystick.hpp>
#include <wpi/system/RobotController.hpp>
#include <wpi/smartdashboard/SmartDashboard.hpp>
#include <wpi/units/length.hpp>

#include <numbers>

#include "wpi/simulation/SimDeviceSim.hpp"
#include "robot-cpp/subsystems/ports.hpp"

namespace {
constexpr wpi::units::inch_t kWheelRadiusInches = 3_in;
constexpr auto kWheelCircumference = kWheelRadiusInches * 2 * 3.14159 / 1_tr;

wpi::units::meter_t TurnsToMeters(wpi::units::turn_t rotations) {
  return rotations * kWheelCircumference;
}
wpi::units::meters_per_second_t TPSToMPS(wpi::units::turns_per_second_t rotations) {
  return rotations * kWheelCircumference;
}
wpi::units::turn_t MetersToTurns(wpi::units::meter_t meters) {
  return meters / kWheelCircumference;
}
wpi::units::turns_per_second_t MPSToTPS(wpi::units::meters_per_second_t meters) {
  return meters / kWheelCircumference;
}
}  // namespace

DriveTrain::DriveTrain()
    : m_leftMotorA{kDrivetrainMotorLeftAPort, ctre::phoenix6::CANBus{}},
      m_leftMotorB{kDrivetrainMotorLeftBPort, ctre::phoenix6::CANBus{}},
      m_rightMotorA{kDrivetrainMotorRightAPort, ctre::phoenix6::CANBus{}},
      m_rightMotorB{kDrivetrainMotorRightBPort, ctre::phoenix6::CANBus{}},
      m_gyro{kPigeonPort, ctre::phoenix6::CANBus{}},
      m_robotDrive{
          [this](double output) { m_leftMotorA.SetControl(m_leftOut.WithOutput(output)); },
          [this](double output) { m_rightMotorA.SetControl(m_rightOut.WithOutput(output)); }},
      m_odometry{wpi::math::Rotation2d(), 0_m, 0_m},

      m_leftPosition(m_leftMotorA.GetPosition()),
      m_leftVelocity(m_leftMotorA.GetVelocity()),
      m_rightPosition(m_rightMotorA.GetPosition()),
      m_rightVelocity(m_rightMotorA.GetVelocity()),
      m_leftMotorSim(m_leftMotorA.GetSimState()),
      m_rightMotorSim(m_rightMotorA.GetSimState()),
      m_imuSim(m_gyro.GetSimState()),
      m_drivetrainSimulator(
          wpi::sim::DifferentialDrivetrainSim::CreateKitbotSim(
              wpi::sim::DifferentialDrivetrainSim::KitbotMotor::DUAL_CIM_PER_SIDE,
              12.0, 6_in)) {
  wpi::SmartDashboard::PutData("Field", &m_field);

  m_leftMotorB.SetControl(ctre::phoenix6::controls::Follower{
      m_leftMotorA.GetDeviceID(), ctre::phoenix6::signals::MotorAlignmentValue::Aligned});
  m_rightMotorB.SetControl(ctre::phoenix6::controls::Follower{
      m_rightMotorA.GetDeviceID(), ctre::phoenix6::signals::MotorAlignmentValue::Aligned});

  SetName("DriveTrain");
}

void DriveTrain::Log() {
  wpi::SmartDashboard::PutNumber("Left Distance",
                                 GetLeftEncoderDistance().to<double>());
  wpi::SmartDashboard::PutNumber("Right Distance",
                                 GetRightEncoderDistance().to<double>());
  wpi::SmartDashboard::PutNumber("Left Speed",
                                 GetLeftEncoderVelocity().to<double>());
  wpi::SmartDashboard::PutNumber("Right Speed",
                                 GetRightEncoderVelocity().to<double>());
  wpi::SmartDashboard::PutNumber("Gyro", GetHeadingDegrees());
}

void DriveTrain::ArcadeDrive(double throttle, double rotation) {
  m_robotDrive.ArcadeDrive(throttle, rotation);
}

double DriveTrain::GetHeadingDegrees() {
  return GetRotation().Degrees().to<double>();
}

wpi::math::Rotation2d DriveTrain::GetRotation() { return m_gyro.GetRotation2d(); }

void DriveTrain::Reset() { m_gyro.Reset(); }

double DriveTrain::GetAverageDistance() {
  return (GetLeftEncoderDistance() + GetRightEncoderDistance()).to<double>() /
         2.0;
}

void DriveTrain::UpdateOdometry() {
  m_odometry.Update(GetRotation(), GetLeftEncoderDistance(),
                    GetRightEncoderDistance());
  m_field.SetRobotPose(m_odometry.GetPose());
}

void DriveTrain::Periodic() {
  UpdateOdometry();
  Log();
}

void DriveTrain::SimulationPeriodic() {
  // To update our simulation, we set motor voltage inputs, update the
  // simulation, and write the simulated positions and velocities to our
  // simulated encoder and gyro. We negate the right side so that positive
  // voltages make the right side move forward.
  m_drivetrainSimulator.SetInputs(
      wpi::units::volt_t{m_leftMotorA.GetDutyCycle().GetValue().to<double>()} *
          wpi::RobotController::GetInputVoltage(),
      wpi::units::volt_t{-m_rightMotorA.GetDutyCycle().GetValue().to<double>()} *
          wpi::RobotController::GetInputVoltage());
  m_drivetrainSimulator.Update(20_ms);

  m_leftMotorSim.SetRawRotorPosition(
      MetersToTurns(m_drivetrainSimulator.GetLeftPosition()));
  m_leftMotorSim.SetRotorVelocity(
      MPSToTPS(m_drivetrainSimulator.GetLeftVelocity()));
  m_rightMotorSim.SetRawRotorPosition(
      MetersToTurns(m_drivetrainSimulator.GetRightPosition()));
  m_rightMotorSim.SetRotorVelocity(
      MPSToTPS(m_drivetrainSimulator.GetRightVelocity()));
  m_imuSim.SetRawYaw(m_drivetrainSimulator.GetHeading().Degrees());
}

wpi::units::meter_t DriveTrain::GetLeftEncoderDistance() {
  return TurnsToMeters(m_leftPosition.GetValue());
}

wpi::units::meter_t DriveTrain::GetRightEncoderDistance() {
  return TurnsToMeters(m_rightPosition.GetValue());
}

wpi::units::meters_per_second_t DriveTrain::GetLeftEncoderVelocity() {
  return TPSToMPS(m_leftVelocity.GetValue());
}

wpi::units::meters_per_second_t DriveTrain::GetRightEncoderVelocity() {
  return TPSToMPS(m_rightVelocity.GetValue());
}
