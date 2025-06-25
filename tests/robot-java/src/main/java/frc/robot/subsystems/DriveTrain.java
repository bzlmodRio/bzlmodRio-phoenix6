// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot.subsystems;

import com.ctre.phoenix6.StatusSignal;
import com.ctre.phoenix6.controls.Follower;
import com.ctre.phoenix6.hardware.Pigeon2;
import com.ctre.phoenix6.hardware.TalonFX;
import com.ctre.phoenix6.sim.Pigeon2SimState;
import com.ctre.phoenix6.sim.TalonFXSimState;
import edu.wpi.first.math.kinematics.DifferentialDriveOdometry;
import edu.wpi.first.units.measure.Angle;
import edu.wpi.first.units.measure.AngularVelocity;
import edu.wpi.first.wpilibj.RobotBase;
import edu.wpi.first.wpilibj.RobotController;
import edu.wpi.first.wpilibj.drive.DifferentialDrive;
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

  private final Pigeon2 m_gyro;

  private final DifferentialDriveOdometry m_odometry;
  private final Field2d m_field;

  // Signals
  private final StatusSignal<Angle> m_leftPosition;
  private final StatusSignal<AngularVelocity> m_leftVelocity;
  private final StatusSignal<Angle> m_rightPosition;
  private final StatusSignal<AngularVelocity> m_rightVelocity;

  // Sim
  private TalonFXSimState m_leftSim;
  private TalonFXSimState m_rightSim;
  private Pigeon2SimState m_gyroSim;
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

    m_drive = new DifferentialDrive(m_leftLeader::set, m_rightLeader::set);

    m_gyro = new Pigeon2(1);

    m_odometry = new DifferentialDriveOdometry(m_gyro.getRotation2d(), 0, 0);
    m_field = new Field2d();

    SmartDashboard.putData("Field", m_field);

    if (RobotBase.isSimulation()) {
      m_leftSim = m_leftLeader.getSimState();
      m_rightSim = m_rightLeader.getSimState();
      m_gyroSim = m_gyro.getSimState();

      m_drivetrainSimulator =
          DifferentialDrivetrainSim.createKitbotSim(
              DifferentialDrivetrainSim.KitbotMotor.kDualCIMPerSide,
              DifferentialDrivetrainSim.KitbotGearing.k12p75,
              DifferentialDrivetrainSim.KitbotWheelSize.kSixInch,
              null);
    }
  }

  public void log() {
    SmartDashboard.putNumber("Left Distance", m_leftPosition.getValueAsDouble());
    SmartDashboard.putNumber("Right Distance", m_rightPosition.getValueAsDouble());
    SmartDashboard.putNumber("Left Speed", m_leftVelocity.getValueAsDouble());
    SmartDashboard.putNumber("Right Speed", m_rightVelocity.getValueAsDouble());
    SmartDashboard.putNumber("Gyro", m_gyro.getRotation2d().getDegrees());
  }

  public void arcadeDrive(double throttle, double rotation) {
    m_drive.arcadeDrive(throttle, rotation);
  }

  public double getHeading() {
    return m_gyro.getRotation2d().getDegrees();
  }

  /** Reset the robots sensors to the zero states. */
  public void reset() {
    m_gyro.reset();
  }

  public double getAverageDistance() {
    return (m_leftPosition.getValueAsDouble() + m_rightPosition.getValueAsDouble()) / 2;
  }

  void updateOdometry() {
    m_odometry.update(
        m_gyro.getRotation2d(),
        m_leftPosition.getValueAsDouble(),
        m_rightPosition.getValueAsDouble());
    m_field.setRobotPose(m_odometry.getPose());
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

    m_leftSim.setRawRotorPosition(m_drivetrainSimulator.getLeftPosition());
    m_leftSim.setRotorVelocity(m_drivetrainSimulator.getLeftVelocity());
    m_rightSim.setRawRotorPosition(m_drivetrainSimulator.getRightPosition());
    m_rightSim.setRotorVelocity(m_drivetrainSimulator.getRightVelocity());
    m_gyroSim.setRawYaw(-m_drivetrainSimulator.getHeading().getDegrees());
  }

  public void stop() {
    m_leftLeader.set(0);
    m_rightLeader.set(0);
  }
}
