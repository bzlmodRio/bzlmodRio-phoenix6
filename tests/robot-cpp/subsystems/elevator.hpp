#pragma once

#include <ctre/phoenix6/CANBus.hpp>
#include <ctre/phoenix6/TalonFX.hpp>
#include <wpi/commands2/Subsystem.hpp>
#include <wpi/simulation/ElevatorSim.hpp>
#include <wpi/units/length.hpp>

class Elevator : public wpi::cmd::Subsystem {
 public:
  Elevator();

  void Stop();

  void SetVoltage(double output);

  void GoToHeight(wpi::units::meter_t height);

  bool IsAtHeight();

  void Periodic() override;

  void SimulationPeriodic() override;

  wpi::units::meter_t GetElevatorHeight();

 private:
  void Log();

  ctre::phoenix6::hardware::TalonFX m_motor;
  double m_setpoint{0};

  // Controls
  ctre::phoenix6::controls::PositionVoltage m_positionControl;

  // Signals
  ctre::phoenix6::StatusSignal<wpi::units::angle::turn_t>& m_position;

  // Sim
  ctre::phoenix6::sim::TalonFXSimState& m_motorSim;
  wpi::sim::ElevatorSim m_elevatorSim;
};
