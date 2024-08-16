
// Social Interaction Chamber System
// Developed by the Pegard and Rodriguez-Romaguera labs at UNC-Chapel Hill.

// This Arduino sketch manages a Social Interaction Chamber by monitoring the status of Infrared (IR) beams to detect 
// the presence of experimental and stimulus mice across a window. The system utilizes an array of IR photodiodes
// and LEDs to track interactions and updates the status in real-time via the serial monitor and TTL outputs.

// Key functionalities:
//  - Calibration of IR photodiodes to establish baseline readings.
//  - Continuous monitoring of IR beam disruptions.
//  - Dynamic adjustment of baseline values to account for minor ambient light changes.
//  - Real-time reporting of beam status via serial communication.
//  - Control of output pins based on beam activity to indicate mouse location and movement.

const int PDPins[] = { 7, 8, 6, 5 };  // Pins for IR photodiodes (PDs), outside to inside
const int DPins[] = { 9, 10, 4, 3 };  // Pins for IR LEDs, outside to inside
float highvalues[4];                  // store baseline PD values
int signal[4];                        // status array for each Infrared beam
float propsignal[4];                  // proportional difference between the current and baseline reading of PDs
volatile int measurement = 0;         // current analog PD reading
volatile float drift = 0;             // difference between the current and baseline reading of PDs
const float sensitivity = 50.0;       // INCREASE UP TO 200 IF TOO SENSITIVE
void setup() {
  for (int j = 0; j < 4; j++) {  // configure the pin states
    pinMode(DPins[j], OUTPUT);
    pinMode(PDPins[j], INPUT);
    digitalWrite(DPins[j], HIGH);  // turn all LEDs on
  }
  delay(20);
  for (int j = 0; j < 4; j++) {
    highvalues[j] = 1.0 * analogRead(PDPins[j]);
  }
  for (int jj = 0; jj < 40; jj++) {
    for (int j = 0; j < 4; j++) {
      highvalues[j] = 0.9 * highvalues[j] + 0.1 * analogRead(PDPins[j]);  // calibration: initializes highvalues array by averaging the baseline across 40 readings
    }
  }
  Serial.begin(9600);  // Start serial communication
}
void loop() {
  for (int i = 0; i < 4; i++) {  // monitor PD readings
    measurement = analogRead(PDPins[i]);
    drift = abs(1.0 * measurement - highvalues[i]);
    if (drift < sensitivity) {
      highvalues[i] = 0.999 * highvalues[i] + 0.001 * measurement;  // adjust baseline to account for minor ambient light changes
    }
    propsignal[i] = 0.9 * propsignal[i] + 0.1 * drift;  // update proportional signal to consider current drift
  }
  for (int i = 0; i < 4; i++) {  // update beam break outputs by comparing the proportional signal to sensitivity threshold
    if (propsignal[i] > sensitivity && signal[i] == 0) {
      signal[i] = 1;
      updatestatus();
    }  // print current beam status
    if (propsignal[i] < sensitivity && signal[i] == 1) {
      signal[i] = 0;
      updatestatus();
    }
  }


  void updatestatus() {  // indicates mouse status based on beam activity, updates trigger output values and streams status on serial port

    for (int i = 0; i < 4; i++) {
      Serial.print(signal[i]);
      Serial.print(",");
    }
    if (signal[0] * signal[1] == 1) {
      digitalWrite(0, HIGH);  // stimulus mouse at window (both inside beams broken)
      Serial.print("I");
      Serial.print(",");
    } else {
      digitalWrite(0, LOW);  // stimulus mouse not at window (none or only one inside beam broken)
      Serial.print("-");
      Serial.print(",");
    }
    if (signal[2] * signal[3] == 1) {
      digitalWrite(1, HIGH);  // experimental mouse at window (both outside beams broken)
      Serial.print("O");
      Serial.print(",");
    } else {
      digitalWrite(1, LOW);  // experimental mouse not at window (none or only one outside beam broken)
      Serial.print("-");
      Serial.print(",");
    }
    if (signal[3] >= 1) {
      digitalWrite(2, HIGH);  // experimental mouse approaching window (one outside beam broken)
      Serial.println("N");
    } else {
      digitalWrite(2, LOW);  // experimental mouse not near or approaching window (no outside beams broken)
      Serial.println("-");
    }
  }
