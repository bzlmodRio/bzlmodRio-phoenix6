#pragma once

#include <wpi/commands2/Command.hpp>
#include <wpi/commands2/CommandHelper.hpp>

#include "robot-cpp/subsystems/shooter.hpp"

class ShooterRpmCommand
    : public wpi::cmd::CommandHelper<wpi::cmd::Command, ShooterRpmCommand> {
 public:
  ShooterRpmCommand(Shooter& shooter, wpi::units::revolutions_per_minute_t rpm);
  void Execute() override;
  bool IsFinished() override;
  void End(bool interrupted) override;

 private:
  Shooter& m_shooter;
  const wpi::units::revolutions_per_minute_t m_rpm;
};
