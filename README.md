# Building an Audio-Responsive Mood Lamp

This repository describes how to reproduce an audio-resposive mood lamp. The lamp responds to music by lighting up red, green, and blue based on whether it detects kick, snare, or hi-hat drums in a piece of music.

This project is designed to enhance the mood of the room it is in and the song it is responding to. It is a relatively simple project to recreate, and allows room for further development.

The project is designed to evoke emotions like happiness, ease, and nostalgia. It should be considered a fun project, especially from a design standpoint.

Here are two images of the project, one of the finished product and one of the hardware design:

![alt text][pic1]

[pic1]: https://github.com/brttwytt/CS207TermProject/blob/master/img/light.jpg "Logo Title Text 2"

![alt text][pic2]

[pic2]: https://github.com/brttwytt/CS207TermProject/blob/master/img/hardware.jpg "Logo Title Text 2"


## Repository Contents

This repository features the following contents:

* **/img** - This is where the image files for this readme are found
* **/libraries** - Arduino and Minim libraries for Processing are found here
* **/src** - This is where the required Arduino and Processing software is found, as well as an example .mp3
* **/.DS_Store** - The file was automatically added by Github
* **/LICENSE** - The license file
* **/README.md** - The readme file you are reading


## Requirements and Materials
In order to recreate this project, users must have Processing and Arduino software downloaded to their computer. These programs can be found here:

https://processing.org/
https://www.arduino.cc/

Users must also have the Arduino and Minim libraries installed with their Processing software. These libraries are available through Processing itself, but can also be downloaded via the libraries folder in this repository.

As far as physical materials go, the following is required:

1x Arduino Uno and USB cable

1x RGB LED

4x 330ohm resistors

1x small breadboard

4x jumper wires

1x small glass jar or bottle

1x white candle

Hard drying clear glue

Grey modelling clay


## Build Instructions

Hardware:

The hardware build for this project is very simple. The legs of the RGB LED are spread just enough along the “a” row of the breadboard in order to make room for resistors to be placed closely around them. The negative prong (longest leg) of the LED is connected to the negative row on the left side of the breadboard in order to ground it. Three jumper wires connect the red, green, and blue prongs (via resistors) to Arduino pins 10, 11, and 12. A fourth jumper wire connects the ground rail to GND on the Arduino.

Here is a schematic for the project and a breadboard diagram:

![alt text][pic3]

[pic3]: https://github.com/brttwytt/CS207TermProject/blob/master/img/schematic.png "Logo Title Text 2"

![alt text][pic4]

[pic4]: https://github.com/brttwytt/CS207TermProject/blob/master/img/breadboard.png "Logo Title Text 2"

Design:

In order to achieve the white marble finish on the inside of the lampshade, melt a white candle in the microwave for several minutes or until it is completely melted. Then transfer the melted wax into the lampshade and swirl it around until it hardens, and coats the inside evenly. Wait for a few hours for the wax to solidify and cool down.

![alt text][pic5]

[pic5]: https://github.com/brttwytt/CS207TermProject/blob/master/img/materials.jpg "Logo Title Text 2"

I designed my lamp to look like a smiley face, but new users can use clay to design their lamp however they would like. However, it is important to coat the clay designs with clear glue in order to harden them so they do not fall off the lampshade. I used a paintbrush to apply the glue, but this is not required.

Once the lampshade is finished, it should be able to slide on top of the RGB LED. The lamp build is now complete.


## Usage

In order to make the lamp work, the following must be done:

1. Upload the StandardFirmata Arduino code to the Arduino Uno. This code is found in the Arduino examples, but is also provided in the /src folder in this repository. Make sure the Arduino Uno is connected to the computer via USB cable.

2. Next, make sure MoodLamp.pde, BeatListener.pde, and the desired audio file are downloaded and saved in the same folder. Kanye West's "Good Life" is used as an example in this repository. In order to use a different song, another audio file must be inserted into the program folder, and line 81 on MoodLamp.pde must be changed from "goodlife.mp3" to the desired filename.

3. Run MoodLamp.pde in Processing.

4. When the Input menu pops up, select the desired port to run the program through. Each possible port has a corresponding letter, and the desired letter is entered into a field. For example, the author’s Arduino Uno is called “/dev/cu.usbmodem1411” and is filed under port “e”.  The user will then press OK, and the program will run.

5. Watch as your mood lamp lights up with every kick, snare, and hi-hat.


## Credits

Brett Wyatt - hardware and lamp design, programming, documentation

Hyrulian - source code (https://www.instructables.com/id/How-to-Make-LEDs-Flash-to-Music-with-an-Arduino/)

javz - source code (https://forum.processing.org/two/discussion/7140/how-to-let-the-user-select-com-serial-port-within-a-sketch)

Andre Infante - hardware design (http://www.makeuseof.com/tag/build-companion-cube-mood-lamp/)

Alex Clarke - programming assistance

Trevor Tomesh - resistor lending
