#pragma once

#include <frc/ADXRS450_Gyro.h>
#include <frc/drive/DifferentialDrive.h>
#include <frc/kinematics/DifferentialDriveOdometry.h>
#include <frc/simulation/ADXRS450_GyroSim.h>
#include <frc/simulation/DifferentialDrivetrainSim.h>
#include <frc/smartdashboard/Field2d.h>
#include <frc2/command/SubsystemBase.h>
#include <units/length.h>
#include <units/velocity.h>

#include <ctre/phoenix6/Pigeon2.hpp>
#include <ctre/phoenix6/TalonFX.hpp>

class DriveTrain : public frc2::SubsystemBase {
 public:
  DriveTrain();

  void ArcadeDrive(double throttle, double rotation);

  double GetHeadingDegrees();
  frc::Rotation2d GetRotation();

  void Reset();

  double GetAverageDistance();

  void UpdateOdometry();

  void Periodic() override;

  void SimulationPeriodic() override;

  units::meter_t GetLeftEncoderDistance();
  units::meter_t GetRightEncoderDistance();

  units::meters_per_second_t GetLeftEncoderVelocity();
  units::meters_per_second_t GetRightEncoderVelocity();

 private:
  void Log();

  ctre::phoenix6::hardware::TalonFX m_leftMotorA;
  ctre::phoenix6::hardware::TalonFX m_leftMotorB;

  ctre::phoenix6::hardware::TalonFX m_rightMotorA;
  ctre::phoenix6::hardware::TalonFX m_rightMotorB;

  ctre::phoenix6::hardware::Pigeon2 m_gyro;

  frc::DifferentialDrive m_robotDrive;

  frc::DifferentialDriveOdometry m_odometry;
  frc::Field2d m_field;

  // Signals
  ctre::phoenix6::StatusSignal<units::angle::turn_t>& m_leftPosition;
  ctre::phoenix6::StatusSignal<units::angular_velocity::turns_per_second_t>&
      m_leftVelocity;
  ctre::phoenix6::StatusSignal<units::angle::turn_t>& m_rightPosition;
  ctre::phoenix6::StatusSignal<units::angular_velocity::turns_per_second_t>&
      m_rightVelocity;

  // Simulation
  ctre::phoenix6::sim::TalonFXSimState& m_leftMotorSim;
  ctre::phoenix6::sim::TalonFXSimState& m_rightMotorSim;
  ctre::phoenix6::sim::Pigeon2SimState& m_imuSim;
  frc::sim::DifferentialDrivetrainSim m_drivetrainSimulator;
};
