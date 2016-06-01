#include <Wire.h>

//Goal: detect the licking, then feedback to photo-activation of ChR2
int Laser_Ch = 13; //Digital output for LED/laser
int Shock_Ch = 12;  //for electrical shock
int laserPattern[3] = {20,20,20}; //Hz/duration/pulsenum
int shockPattern[3]= {1,1000,1}; 
unsigned long tim1=0;
int state = 0;

void setup()
{
  pinMode(Laser_Ch,OUTPUT);
  pinMode(Shock_Ch, OUTPUT);
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
      digitalWrite(Shock_Ch,LOW);
      tim1 = 0;
    }
    else if (state==49)    //'1'
    {
      tim1=millis();
    }
  }
  
