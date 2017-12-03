/**
  * This sketch demonstrates how to use the BeatDetect object in FREQ_ENERGY mode.<br />
  * You can use <code>isKick</code>, <code>isSnare</code>, </code>isHat</code>, <code>isRange</code>, 
  * and <code>isOnset(int)</code> to track whatever kind of beats you are looking to track, they will report 
  * true or false based on the state of the analysis. To "tick" the analysis you must call <code>detect</code> 
  * with successive buffers of audio. You can do this inside of <code>draw</code>, but you are likely to miss some 
  * audio buffers if you do this. The sketch implements an <code>AudioListener</code> called <code>BeatListener</code> 
  * so that it can call <code>detect</code> on every buffer of audio processed by the system without repeating a buffer 
  * or missing one.
  * <p>
  * This sketch plays an entire song so it may be a little slow to load.
  */
 
// importing libraries
import processing.serial.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import cc.arduino.*;
import static javax.swing.JOptionPane.*;

//declaring variables
Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
Arduino arduino;

int ledPin =  12;    // LED pin connected to digital pin 12
int ledPin2 = 11;    // LED pin connected to digital pin 11
int ledPin3 =  10;    // LED pin connected to digital pin 10

float kickSize, snareSize, hatSize; //drum variables for visual graphic
void setup() {
  size(512, 200, P3D); //parameters for visual graphic
  minim = new Minim(this); //minim library
  
  //from : https://forum.processing.org/two/discussion/7140/how-to-let-the-user-select-com-serial-port-within-a-sketch
  //manually select the proper COM/serial port within sketch
  //adapted to be seen in list view/show more ports
  String COMx, COMlist = "";
  try {
    int i = Serial.list().length;
    if (i != 0) {
      if (i >= 2) {
        // need to check which port the inst uses (SN)
        // for now we'll just let the user decide (SN)
        for (int j = 0; j < i;) {
          COMlist += char(j+'a') + " = " + Serial.list()[j];
          if (++j < i) COMlist += "\n"; //each device on its own line
        }
        COMx = showInputDialog("Which COM port is correct? (a,b,..):\n"+COMlist);
        if (COMx == null) exit();
        else if (COMx.isEmpty()) exit(); //else added to remove warning
        else i = int(COMx.toLowerCase().charAt(0) - 'a') + 1; // ""
      }
      String portName = Serial.list()[i-1];
      println("Using this port: ", portName); //edited port selection message
      arduino = new Arduino(this, portName, 57600); //switch from serial communiction to firmata
    }
    else {
      showMessageDialog(frame,"Device is not connected to the PC");
      exit();
    }
  }
  catch (Exception e)
  { //Print the type of error
    showMessageDialog(frame,"COM port is not available (may\nbe in use by another program)");
    println("Error:", e);
    exit();
  }
  
  
  print(arduino); //send code to arduino
  song = minim.loadFile("goodlife.mp3", 2048); //load mp3 file
  song.play(); //play mp3 file
  // a beat detection object that is FREQ_ENERGY mode that
  // expects buffers the length of song's buffer size
  // and samples captured at songs's sample rate (SN)
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  // set the sensitivity to 300 milliseconds
  // After a beat has been detected, the algorithm will wait for 300 milliseconds 
  // before allowing another beat to be reported. You can use this to dampen the 
  // algorithm if it is giving too many false-positives. The default value is 10, 
  // which is essentially no damping. If you try to set the sensitivity to a negative value, 
  // an error will be reported and it will be set to 10 instead. (SN)
  beat.setSensitivity(300);  
  kickSize = snareSize = hatSize = 500;
  // make a new beat listener, so that we won't miss any buffers for the analysis (SN)
  bl = new BeatListener(beat, song);  
  textFont(createFont("Helvetica", 16));
  textAlign(CENTER);
  
  //arduino pin outputs
  arduino.pinMode(ledPin, Arduino.OUTPUT);    
  arduino.pinMode(ledPin2, Arduino.OUTPUT);  
  arduino.pinMode(ledPin3, Arduino.OUTPUT);  
}

void draw() { //gives visual representation of what is happening with LED
  background(0); //black
  fill(255); //white
  if(beat.isKick()) {
      arduino.digitalWrite(ledPin, Arduino.HIGH);   // set the LED on (SN)
      kickSize = 32; //text size
  }
  if(beat.isSnare()) {
      arduino.digitalWrite(ledPin2, Arduino.HIGH);   // set the LED on (SN)
      snareSize = 32;
  }
  if(beat.isHat()) {
      arduino.digitalWrite(ledPin3, Arduino.HIGH);   // set the LED on (SN)
      hatSize = 32;
  }
  arduino.digitalWrite(ledPin, Arduino.LOW);    // set the LED off (SN)
  arduino.digitalWrite(ledPin2, Arduino.LOW);    // set the LED off (SN)
  arduino.digitalWrite(ledPin3, Arduino.LOW);    // set the LED off (SN)
  
  //text dimensions
  textSize(kickSize);
  text("KICK", width/4, height/2);
  textSize(snareSize);
  text("SNARE", width/2, height/2);
  textSize(hatSize);
  text("HAT", 3*width/4, height/2);
  kickSize = constrain(kickSize * 0.95, 16, 32);
  snareSize = constrain(snareSize * 0.95, 16, 32);
  hatSize = constrain(hatSize * 0.95, 16, 32);
}

void stop() { //stop funtion ends the program at the end of the song
  // always close Minim audio classes when you are finished with them (SN)
  song.close();
  // always stop Minim before exiting (SN)
  minim.stop();
  // this closes the sketch (SN)
  super.stop();
}