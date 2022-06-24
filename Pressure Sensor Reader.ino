// Pins
int sensorPin = 5;

void setup() {
  pinMode(sensorPin,INPUT);
  Serial.begin(9600);

}

void loop() {
  Serial.println(analogRead(sensorPin));

}
