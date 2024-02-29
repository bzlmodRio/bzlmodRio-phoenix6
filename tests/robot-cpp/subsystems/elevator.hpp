#pragma once

#include <ctre/phoenix6/TalonFX.hpp>
#include <frc/simulation/ElevatorSim.h>
#include <frc2/command/PIDSubsystem.h>
#include <units/length.h>

class Elevator : public frc2::PIDSubsystem {
public:
  Elevator();

  void Stop();

  double GetMeasurement() override;

  void UseOutput(double output, double setpoint) override;

  void Periodic() override;

  void SimulationPeriodic() override;

  units::meter_t GetElevatorHeight();

private:
  void Log();

  ctre::phoenix6::hardware::TalonFX m_motor;
  double m_setpoint{0};
  
  // Signals
  ctre::phoenix6::StatusSignal<units::angle::turn_t>& m_position;

  // Sim
  ctre::phoenix6::sim::TalonFXSimState& m_motorSim;
  frc::sim::ElevatorSim m_elevatorSim;
};
