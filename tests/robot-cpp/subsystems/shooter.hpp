#pragma once

#include <wpi/math/controller/PIDController.hpp>
#include <wpi/simulation/FlywheelSim.hpp>
#include <wpi/commands2/Subsystem.hpp>

#include <ctre/phoenix6/CANBus.hpp>
#include <ctre/phoenix6/TalonFX.hpp>
#include <ctre/phoenix6/controls/DutyCycleOut.hpp>

class Shooter : public wpi::cmd::Subsystem {
 public:
  Shooter();

  void Periodic() override;
  void SimulationPeriodic() override;

  void Stop();

  void SpinAtRpm(wpi::units::revolutions_per_minute_t rpm);

  wpi::units::revolutions_per_minute_t GetRpm();

 private:
  void Log();

  ctre::phoenix6::hardware::TalonFX m_motor;

  // Control
  ctre::phoenix6::controls::VelocityVoltage m_voltageVelocity;
  ctre::phoenix6::controls::DutyCycleOut m_dutyCycleControl{0};

  // Signals
  ctre::phoenix6::StatusSignal<wpi::units::angular_velocity::turns_per_second_t>
      &m_velocity;

  // Sim
  ctre::phoenix6::sim::TalonFXSimState &m_motorSim;
  wpi::sim::FlywheelSim m_flywheelSim;
};
