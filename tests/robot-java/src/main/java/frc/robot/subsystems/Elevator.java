package frc.robot.subsystems;

import com.ctre.phoenix6.StatusSignal;
import com.ctre.phoenix6.controls.PositionVoltage;
import com.ctre.phoenix6.hardware.TalonFX;
import com.ctre.phoenix6.sim.TalonFXSimState;
import edu.wpi.first.math.system.plant.DCMotor;
import edu.wpi.first.math.util.Units;
import edu.wpi.first.units.measure.Angle;
import edu.wpi.first.wpilibj.RobotBase;
import edu.wpi.first.wpilibj.RobotController;
import edu.wpi.first.wpilibj.simulation.ElevatorSim;
import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;
import edu.wpi.first.wpilibj2.command.SubsystemBase;

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

  // Signals
  private final StatusSignal<Angle> m_position;

  // Sim
  private TalonFXSimState m_motorSim;
  private ElevatorSim m_elevatorSim;

  /** Create a new elevator subsystem. */
  @SuppressWarnings("this-escape")
  public Elevator() {
    m_motor = new TalonFX(PortMap.kElevatorMotorPort);
    m_position = m_motor.getPosition();

    m_positionControl = new PositionVoltage(0);

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
    m_motor.set(output);
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
    m_elevatorSim.setInput(m_motor.get() * RobotController.getInputVoltage());
    m_elevatorSim.update(0.02);
    m_motorSim.setRawRotorPosition(m_elevatorSim.getPositionMeters());
  }

  public void stop() {
    m_motor.set(0);
  }
}
