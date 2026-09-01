// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot.subsystems;

import com.ctre.phoenix6.CANBus;
import com.ctre.phoenix6.StatusSignal;
import com.ctre.phoenix6.controls.DutyCycleOut;
import com.ctre.phoenix6.controls.VelocityVoltage;
import com.ctre.phoenix6.hardware.TalonFX;
import com.ctre.phoenix6.sim.TalonFXSimState;
import org.wpilib.command2.SubsystemBase;
import org.wpilib.framework.RobotBase;
import org.wpilib.math.numbers.N1;
import org.wpilib.math.system.DCMotor;
import org.wpilib.math.system.LinearSystem;
import org.wpilib.math.system.Models;
import org.wpilib.simulation.FlywheelSim;
import org.wpilib.smartdashboard.SmartDashboard;
import org.wpilib.system.RobotController;
import org.wpilib.units.measure.AngularVelocity;

/**
 * The claw subsystem is a simple system with a motor for opening and closing. If using stronger
 * motors, you should probably use a sensor so that the motors don't stall.
 */
public class Shooter extends SubsystemBase {
  private static final DCMotor kGearbox = DCMotor.getVex775Pro(2);
  private static final double kGearing = 4;
  private static final double kInertia = 0.008;

  private final TalonFX m_motor;

  private final VelocityVoltage m_voltageVelocity;
  private final DutyCycleOut m_dutyCycleControl;

  // Signals
  private final StatusSignal<AngularVelocity> m_velocity;

  // Sim
  private TalonFXSimState m_motorSim;
  private FlywheelSim m_flywheelSim;

  /** Create a new claw subsystem. */
  public Shooter() {
    m_motor = new TalonFX(PortMap.kShooterMotorPort, new CANBus());
    m_voltageVelocity = new VelocityVoltage(0);
    m_dutyCycleControl = new DutyCycleOut(0);
    m_velocity = m_motor.getVelocity();

    if (RobotBase.isSimulation()) {
      m_motorSim = m_motor.getSimState();

      LinearSystem<N1, N1, N1> plant =
          Models.flywheelFromPhysicalConstants(kGearbox, kGearing, kInertia);
      m_flywheelSim = new FlywheelSim(plant, kGearbox);
    }
  }

  public void log() {
    SmartDashboard.putNumber("Shooter Speed", m_motor.getDutyCycle().getValueAsDouble());
    SmartDashboard.putNumber("Shooter RPM", getRpm());
  }

  public void stop() {
    m_motor.setControl(m_dutyCycleControl.withOutput(0));
  }

  public void spinAtRpm(double rpm) {
    m_motor.setControl(m_voltageVelocity.withVelocity(rpm));
  }

  double getRpm() {
    return m_velocity.getValueAsDouble();
  }

  @Override
  public void periodic() {
    log();
  }

  @Override
  public void simulationPeriodic() {
    m_flywheelSim.setInput(
        m_motor.getDutyCycle().getValueAsDouble() * RobotController.getInputVoltage());

    m_flywheelSim.update(0.02);
    m_motorSim.setRawRotorPosition(m_flywheelSim.getAngularVelocity());
  }
}
