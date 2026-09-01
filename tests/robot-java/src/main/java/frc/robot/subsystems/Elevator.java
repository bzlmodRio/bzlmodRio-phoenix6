package frc.robot.subsystems;

import com.ctre.phoenix6.CANBus;
import com.ctre.phoenix6.StatusSignal;
import com.ctre.phoenix6.controls.DutyCycleOut;
import com.ctre.phoenix6.controls.PositionVoltage;
import com.ctre.phoenix6.hardware.TalonFX;
import com.ctre.phoenix6.sim.TalonFXSimState;
import org.wpilib.command2.SubsystemBase;
import org.wpilib.framework.RobotBase;
import org.wpilib.math.system.DCMotor;
import org.wpilib.math.util.Units;
import org.wpilib.simulation.ElevatorSim;
import org.wpilib.smartdashboard.SmartDashboard;
import org.wpilib.system.RobotController;
import org.wpilib.units.measure.Angle;

public class Elevator extends SubsystemBase {
  private static final double kP = 4;
  private static final double kI = 0.0;
  private static final double kD = 0.0;

  private static final double kElevatorGearing = 10.0;
  private static final double kElevatorDrumRadius = Units.inchesToMeters(2);
  private static final double kCarriageMass = 4.0;

  private static final DCMotor kElevatorGearbox = DCMotor.getVex775Pro(4);
  private static final double kMinElevatorHeight = Units.inchesToMeters(0);
  private static final double kMaxElevatorHeight = Units.inchesToMeters(50);

  private final TalonFX m_motor;

  // Control
  private final PositionVoltage m_positionControl;
  private final DutyCycleOut m_dutyCycleControl;

  // Signals
  private final StatusSignal<Angle> m_position;

  // Sim
  private TalonFXSimState m_motorSim;
  private ElevatorSim m_elevatorSim;

  /** Create a new elevator subsystem. */
  @SuppressWarnings("this-escape")
  public Elevator() {
    m_motor = new TalonFX(PortMap.kElevatorMotorPort, new CANBus());
    m_position = m_motor.getPosition();

    m_positionControl = new PositionVoltage(0);
    m_dutyCycleControl = new DutyCycleOut(0);

    if (RobotBase.isSimulation()) {
      m_motorSim = m_motor.getSimState();
      m_elevatorSim =
          new ElevatorSim(
              kElevatorGearbox,
              kElevatorGearing,
              kCarriageMass,
              kElevatorDrumRadius,
              kMinElevatorHeight,
              kMaxElevatorHeight,
              true,
              0);
    }
  }

  public void log() {
    SmartDashboard.putNumber("Elevator Height", m_position.getValueAsDouble());
  }

  public void setVoltage(double output) {
    m_motor.setControl(m_dutyCycleControl.withOutput(output));
  }

  public void goToHeight(double height) {
    m_positionControl.Position = height;
    m_motor.setControl(m_positionControl);
  }

  public boolean isAtHeight() {
    double error = m_positionControl.Position - m_motor.getPosition().getValueAsDouble();
    return error < 0.5;
  }

  @Override
  public void periodic() {
    log();
  }

  @Override
  public void simulationPeriodic() {
    m_elevatorSim.setInput(
        m_motor.getDutyCycle().getValueAsDouble() * RobotController.getInputVoltage());
    m_elevatorSim.update(0.02);
    m_motorSim.setRawRotorPosition(m_elevatorSim.getPosition());
  }

  public void stop() {
    m_motor.setControl(m_dutyCycleControl.withOutput(0));
  }
}
