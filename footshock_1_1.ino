#include <Wire.h>

//Goal: detect the licking, then feedback to photo-activation of ChR2
int Laser_Ch = 13; //Digital output for LED/laser
int state = 0;

void setup()
{
  pinMode(Laser_Ch,OUTPUT);
  Serial.begin(9600);
  Wire.begin();
}

void loop()
{
  if (Serial.available()>0)
  {
    state = Serial.read();
    if (state==48)    //'0'
    {
      digitalWrite(Laser_Ch,LOW);
    }
    else if (state==49)    //'1'
    {
      digitalWrite(Laser_Ch,HIGH);
      delay(30);
      digitalWrite(Laser_Ch,LOW);
      delay(20);
    }
  }
}
