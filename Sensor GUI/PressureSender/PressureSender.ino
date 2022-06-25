/* 
   Written Noah Robitshek All Rights Reserved  
   No piece of this code can be reused without the expressed written permission from Noah Robitshek
   File name: PressureSender
   Description: This file will collect and print serial data from the pressure sensor   
*/ 
int dataPin = 5;

void setup() {
  pinMode(dataPin,INPUT);
  Serial.begin(9600);
}

void loop() {
  Serial.println(analogRead(dataPin));
  delay(100);
}
