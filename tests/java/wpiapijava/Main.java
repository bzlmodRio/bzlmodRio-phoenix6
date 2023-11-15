package wpiapijava;

import com.ctre.phoenix6.controls.VoltageOut;
import com.ctre.phoenix6.hardware.Pigeon2;
import com.ctre.phoenix6.hardware.TalonFX;

public final class Main {
  private Main() {}

  public static void main(String[] args) {
    VoltageOut request = new VoltageOut(0);

    TalonFX talon = new TalonFX(1);
    Pigeon2 pigeon = new Pigeon2(2);
    talon.setControl(request.withOutput(12.0));
    System.out.println(pigeon.getAngle());
  }
}
