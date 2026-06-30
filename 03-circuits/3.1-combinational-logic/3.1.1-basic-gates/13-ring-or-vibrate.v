// Goal: Design a circuit to control a cellphone's ringer and vibration motor:
// 1. When an incoming call occurs (input ring), activate either the ringer (output ringer = 1) or the motor (output motor = 1).
// 2. Do not activate both outputs simultaneously.
// 3. If the phone is in vibrate mode (input vibrate_mode = 1), turn on the motor.
// 4. Otherwise, turn on the ringer.

module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
	assign ringer = ring & ~vibrate_mode;
    assign motor = ring & vibrate_mode;
endmodule