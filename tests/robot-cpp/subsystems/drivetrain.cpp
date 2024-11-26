#include "robot-cpp/subsystems/drivetrain.hpp"

#include <frc/Joystick.h>
#include <frc/RobotController.h>
#include <frc/smartdashboard/SmartDashboard.h>
#include <units/length.h>

#include <numbers>

#include "frc/simulation/SimDeviceSim.h"
#include "robot-cpp/subsystems/ports.hpp"

namespace {
constexpr units::inch_t kWheelRadiusInches = 3_in;
constexpr auto kWheelCircumference = kWheelRadiusInches * 2 * 3.14159 / 1_tr;

units::meter_t TurnsToMeters(units::turn_t rotations) {
  return rotations * kWheelCircumference;
}
units::meters_per_second_t TPSToMPS(units::turns_per_second_t rotations) {
  return rotations * kWheelCircumference;
}
units::turn_t MetersToTurns(units::meter_t meters) {
  return meters / kWheelCircumference;
}
units::turns_per_second_t MPSToTPS(units::meters_per_second_t meters) {
  return meters / kWheelCircumference;
}
}  // namespace

DriveTrain::DriveTrain()
    : m_leftMotorA{kDrivetrainMotorLeftAPort},
      m_leftMotorB{kDrivetrainMotorLeftBPort},
      m_rightMotorA{kDrivetrainMotorRightAPort},
      m_rightMotorB{kDrivetrainMotorRightBPort},
      m_gyro{kPigeonPort},
      m_robotDrive{[this](double output) { m_leftMotorA.Set(output); },
                   [this](double output) { m_leftMotorB.Set(output); }},
      m_odometry{frc::Rotation2d(), 0_m, 0_m},

      m_leftPosition(m_leftMotorA.GetPosition()),
      m_leftVelocity(m_leftMotorA.GetVelocity()),
      m_rightPosition(m_rightMotorA.GetPosition()),
      m_rightVelocity(m_rightMotorA.GetVelocity()),
      m_leftMotorSim(m_leftMotorA.GetSimState()),
      m_rightMotorSim(m_rightMotorA.GetSimState()),
      m_imuSim(m_gyro.GetSimState()),
      m_drivetrainSimulator(
          frc::sim::DifferentialDrivetrainSim::CreateKitbotSim(
              frc::sim::DifferentialDrivetrainSim::KitbotMotor::DualCIMPerSide,
              12.0, 6_in)) {
  frc::SmartDashboard::PutData("Field", &m_field);

  m_leftMotorB.SetControl(
      ctre::phoenix6::controls::Follower{m_leftMotorA.GetDeviceID(), false});
  m_rightMotorB.SetControl(
      ctre::phoenix6::controls::Follower{m_rightMotorA.GetDeviceID(), false});

  SetName("DriveTrain");
}

void DriveTrain::Log() {
  frc::SmartDashboard::PutNumber("Left Distance",
                                 GetLeftEncoderDistance().to<double>());
  frc::SmartDashboard::PutNumber("Right Distance",
                                 GetRightEncoderDistance().to<double>());
  frc::SmartDashboard::PutNumber("Left Speed",
                                 GetLeftEncoderVelocity().to<double>());
  frc::SmartDashboard::PutNumber("Right Speed",
                                 GetRightEncoderVelocity().to<double>());
  frc::SmartDashboard::PutNumber("Gyro", GetHeadingDegrees());
}

void DriveTrain::ArcadeDrive(double throttle, double rotation) {
  m_robotDrive.ArcadeDrive(throttle, rotation);
}

double DriveTrain::GetHeadingDegrees() {
  return GetRotation().Degrees().to<double>();
}

frc::Rotation2d DriveTrain::GetRotation() { return m_gyro.GetRotation2d(); }

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
  m_drivetrainSimulator.SetInputs(units::volt_t{m_leftMotorA.Get()} *
                                      frc::RobotController::GetInputVoltage(),
                                  units::volt_t{-m_rightMotorA.Get()} *
                                      frc::RobotController::GetInputVoltage());
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

units::meter_t DriveTrain::GetLeftEncoderDistance() {
  return TurnsToMeters(m_leftPosition.GetValue());
}

units::meter_t DriveTrain::GetRightEncoderDistance() {
  return TurnsToMeters(m_rightPosition.GetValue());
}

units::meters_per_second_t DriveTrain::GetLeftEncoderVelocity() {
  return TPSToMPS(m_leftVelocity.GetValue());
}

units::meters_per_second_t DriveTrain::GetRightEncoderVelocity() {
  return TPSToMPS(m_rightVelocity.GetValue());
}
