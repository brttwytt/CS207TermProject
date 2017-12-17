/*
 Mood Lamp - oscillates between colors
 */
 
// each pin corresponds to an LED color:
int led0 = 10;
int led1 = 11;
int led2 = 12;

//declare internal variables
int brightness = 200;
int red = 0;
int blue = 0;
int green = 0;

// this routine runs each time you hit the reset button
void setup() {                
  // declare the relevant pins to be output
  pinMode(led0, OUTPUT);    
  pinMode(led1, OUTPUT);    
  pinMode(led2, OUTPUT);     
}

// this routine loops indefinitely
void loop() {
    for (float x=0;x < PI; x = x + 0.000004){
      red = brightness * abs(sin(x*(180/PI)));           // calculate red brightness
      green = brightness * abs(sin((x+PI/3)*(180/PI)));    // calculate green brightness
      blue = brightness * abs(sin((x+(2*PI)/3)*(180/PI)));// calculate the blue brightness
      analogWrite(led0, red);   // send the value to the LED
      analogWrite(led1, green);   // send the value to the LED 
      analogWrite(led2, blue);   // send the value to the LED
    }

}
