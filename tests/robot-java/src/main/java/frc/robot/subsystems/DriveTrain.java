// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot.subsystems;

import com.ctre.phoenix6.StatusSignal;
import com.ctre.phoenix6.controls.Follower;
import com.ctre.phoenix6.hardware.TalonFX;
import com.ctre.phoenix6.sim.TalonFXSimState;
import edu.wpi.first.math.kinematics.DifferentialDriveOdometry;
import edu.wpi.first.wpilibj.ADXRS450_Gyro;
import edu.wpi.first.wpilibj.RobotBase;
import edu.wpi.first.wpilibj.RobotController;
import edu.wpi.first.wpilibj.drive.DifferentialDrive;
import edu.wpi.first.wpilibj.simulation.ADXRS450_GyroSim;
import edu.wpi.first.wpilibj.simulation.DifferentialDrivetrainSim;
import edu.wpi.first.wpilibj.smartdashboard.Field2d;
import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;
import edu.wpi.first.wpilibj2.command.SubsystemBase;

public class DriveTrain extends SubsystemBase {
  private final TalonFX m_leftLeader;
  private final TalonFX m_leftFollower; // NOPMD(SingularField)
  private final TalonFX m_rightLeader;
  private final TalonFX m_rightFollower; // NOPMD(SingularField)

  private final DifferentialDrive m_drive;

  private final ADXRS450_Gyro m_gyro;

  private final DifferentialDriveOdometry m_odometry;
  private final Field2d m_field;

  // Signals
  private final StatusSignal<Double> m_leftPosition;
  private final StatusSignal<Double> m_leftVelocity;
  private final StatusSignal<Double> m_rightPosition;
  private final StatusSignal<Double> m_rightVelocity;

  // Sim
  private TalonFXSimState m_leftSim;
  private TalonFXSimState m_rightSim;
  private ADXRS450_GyroSim m_gyroSim;
  private DifferentialDrivetrainSim m_drivetrainSimulator;

  public DriveTrain() {
    m_leftLeader = new TalonFX(PortMap.kDrivetrainMotorLeftAPort);
    m_leftFollower = new TalonFX(PortMap.kDrivetrainMotorLeftBPort);
    m_rightLeader = new TalonFX(PortMap.kDrivetrainMotorRightAPort);
    m_rightFollower = new TalonFX(PortMap.kDrivetrainMotorRightBPort);

    m_leftFollower.setControl(new Follower(m_leftLeader.getDeviceID(), false));
    m_rightFollower.setControl(new Follower(m_rightLeader.getDeviceID(), false));

    m_leftPosition = m_leftLeader.getPosition();
    m_leftVelocity = m_leftLeader.getVelocity();
    m_rightPosition = m_rightLeader.getPosition();
    m_rightVelocity = m_rightLeader.getVelocity();

    m_drive = new DifferentialDrive(m_leftLeader, m_rightLeader);

    m_gyro = new ADXRS450_Gyro();

    m_odometry = new DifferentialDriveOdometry(m_gyro.getRotation2d(), 0, 0);
    m_field = new Field2d();

    SmartDashboard.putData("Field", m_field);

    if (RobotBase.isSimulation()) {
      m_leftSim = m_leftLeader.getSimState();
      m_rightSim = m_rightLeader.getSimState();
      m_gyroSim = new ADXRS450_GyroSim(m_gyro);

      m_drivetrainSimulator =
          DifferentialDrivetrainSim.createKitbotSim(
              DifferentialDrivetrainSim.KitbotMotor.kDualCIMPerSide,
              DifferentialDrivetrainSim.KitbotGearing.k12p75,
              DifferentialDrivetrainSim.KitbotWheelSize.kSixInch,
              null);
    }
  }

  public void log() {
    SmartDashboard.putNumber("Left Distance", m_leftPosition.getValue());
    SmartDashboard.putNumber("Right Distance", m_rightPosition.getValue());
    SmartDashboard.putNumber("Left Speed", m_leftVelocity.getValue());
    SmartDashboard.putNumber("Right Speed", m_rightVelocity.getValue());
    SmartDashboard.putNumber("Gyro", m_gyro.getAngle());
  }

  public void arcadeDrive(double throttle, double rotation) {
    m_drive.arcadeDrive(throttle, rotation);
  }

  public double getHeading() {
    return m_gyro.getAngle();
  }

  /** Reset the robots sensors to the zero states. */
  public void reset() {
    m_gyro.reset();
  }

  public double getAverageDistance() {
    return (m_leftPosition.getValue() + m_rightPosition.getValue()) / 2;
  }

  void updateOdometry() {
    m_odometry.update(
        m_gyro.getRotation2d(), m_leftPosition.getValue(), m_rightPosition.getValue());
    m_field.setRobotPose(m_odometry.getPoseMeters());
  }

  @Override
  public void periodic() {
    updateOdometry();
    log();
  }

  @Override
  public void simulationPeriodic() {
    m_drivetrainSimulator.setInputs(
        m_leftLeader.get() * RobotController.getInputVoltage(),
        m_rightLeader.get() * RobotController.getInputVoltage());
    m_drivetrainSimulator.update(0.02);

    m_leftSim.setRawRotorPosition(m_drivetrainSimulator.getLeftPositionMeters());
    m_leftSim.setRotorVelocity(m_drivetrainSimulator.getLeftVelocityMetersPerSecond());
    m_rightSim.setRawRotorPosition(m_drivetrainSimulator.getRightPositionMeters());
    m_rightSim.setRotorVelocity(m_drivetrainSimulator.getRightVelocityMetersPerSecond());
    m_gyroSim.setAngle(-m_drivetrainSimulator.getHeading().getDegrees());
  }

  public void stop() {
    m_leftLeader.set(0);
    m_rightLeader.set(0);
  }
}
