#pragma once

#include <ctre/phoenix6/CANBus.hpp>
#include <ctre/phoenix6/Pigeon2.hpp>
#include <ctre/phoenix6/TalonFX.hpp>
#include <ctre/phoenix6/controls/DutyCycleOut.hpp>
#include <wpi/commands2/SubsystemBase.hpp>
#include <wpi/drive/DifferentialDrive.hpp>
#include <wpi/math/kinematics/DifferentialDriveOdometry.hpp>
#include <wpi/simulation/DifferentialDrivetrainSim.hpp>
#include <wpi/smartdashboard/Field2d.hpp>
#include <wpi/units/length.hpp>
#include <wpi/units/velocity.hpp>

class DriveTrain : public wpi::cmd::SubsystemBase {
 public:
  DriveTrain();

  void ArcadeDrive(double throttle, double rotation);

  double GetHeadingDegrees();
  wpi::math::Rotation2d GetRotation();

  void Reset();

  double GetAverageDistance();

  void UpdateOdometry();

  void Periodic() override;

  void SimulationPeriodic() override;

  wpi::units::meter_t GetLeftEncoderDistance();
  wpi::units::meter_t GetRightEncoderDistance();

  wpi::units::meters_per_second_t GetLeftEncoderVelocity();
  wpi::units::meters_per_second_t GetRightEncoderVelocity();

 private:
  void Log();

  ctre::phoenix6::hardware::TalonFX m_leftMotorA;
  ctre::phoenix6::hardware::TalonFX m_leftMotorB;

  ctre::phoenix6::hardware::TalonFX m_rightMotorA;
  ctre::phoenix6::hardware::TalonFX m_rightMotorB;

  ctre::phoenix6::hardware::Pigeon2 m_gyro;

  ctre::phoenix6::controls::DutyCycleOut m_leftOut{0};
  ctre::phoenix6::controls::DutyCycleOut m_rightOut{0};
  wpi::DifferentialDrive m_robotDrive;

  wpi::math::DifferentialDriveOdometry m_odometry;
  wpi::Field2d m_field;

  // Signals
  ctre::phoenix6::StatusSignal<wpi::units::angle::turn_t>& m_leftPosition;
  ctre::phoenix6::StatusSignal<
      wpi::units::angular_velocity::turns_per_second_t>& m_leftVelocity;
  ctre::phoenix6::StatusSignal<wpi::units::angle::turn_t>& m_rightPosition;
  ctre::phoenix6::StatusSignal<
      wpi::units::angular_velocity::turns_per_second_t>& m_rightVelocity;

  // Simulation
  ctre::phoenix6::sim::TalonFXSimState& m_leftMotorSim;
  ctre::phoenix6::sim::TalonFXSimState& m_rightMotorSim;
  ctre::phoenix6::sim::Pigeon2SimState& m_imuSim;
  wpi::sim::DifferentialDrivetrainSim m_drivetrainSimulator;
};
