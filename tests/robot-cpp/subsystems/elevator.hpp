#pragma once

#include <frc/simulation/ElevatorSim.h>
#include <frc2/command/Subsystem.h>
#include <units/length.h>

#include <ctre/phoenix6/TalonFX.hpp>

class Elevator : public frc2::Subsystem {
 public:
  Elevator();

  void Stop();

  void SetVoltage(double output);

  void GoToHeight(units::meter_t height);

  bool IsAtHeight();

  void Periodic() override;

  void SimulationPeriodic() override;

  units::meter_t GetElevatorHeight();

 private:
  void Log();

  ctre::phoenix6::hardware::TalonFX m_motor;
  double m_setpoint{0};

  // Controls
  ctre::phoenix6::controls::PositionVoltage m_positionControl;

  // Signals
  ctre::phoenix6::StatusSignal<units::angle::turn_t>& m_position;

  // Sim
  ctre::phoenix6::sim::TalonFXSimState& m_motorSim;
  frc::sim::ElevatorSim m_elevatorSim;
};
