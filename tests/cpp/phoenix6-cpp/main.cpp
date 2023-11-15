
#include <chrono>
#include <iostream>
#include <thread>

#include "ctre/phoenix6/Pigeon2.hpp"
#include "ctre/phoenix6/TalonFX.hpp"

int main() {
  std::cout << "Hello World" << std::endl;

  ctre::phoenix6::hardware::Pigeon2 pigeon{4};
  ctre::phoenix6::hardware::TalonFX talon{5};

  std::cout << "Running  some loops" << std::endl;
  for (int i = 0; i < 500; ++i) {
    std::this_thread::sleep_for(std::chrono::microseconds(20));
  }
  std::cout << "Done" << std::endl;

  return 0;
}
