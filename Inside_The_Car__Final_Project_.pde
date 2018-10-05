/**

Instruction
  - When You Click the Start Button It Makes a Starting Sound
  - When You Press W The Bird Moves Closer and Closer and Hits The Window
  - When You Click the White Square the GPS Turns On
  - When You Click Anywhere the Gear Counter Goes Up By One
  - If the Gear Counter Is Over a 100 A Text Appear in the White Box Below The GPS
  - If the Bird Hits The Glass A Text Appear In the White Box Below the GPS 
  
*/

// Import the Minim Library
import ddf.minim.*;
Minim minim;

// Audio Player for the Starting sound and the Glass breaking sound
AudioPlayer player;
AudioPlayer glass;

// Images
PImage carinside;  // Inside the Car Picture
PImage birds;  // The birds in the Background
PImage bird;  // The Big Bird
PImage glassbreak;  // The Broken Glass
PImage gps;  // The GPS

// Variable For The Location Of the Birds In The Background and how fast they move
int circleX = 0; // The Location of the Birds
int speed = 3;  // The Speed Of The Birds

// Variable for the Gear Count and How Many Pixels The Bird Moves Each Time You Press "W"
int press = 10;  // How Many Pixels The Bird Moves Each Time You Press "W"
int count = 10;  // The Gear Count

// The Start is false
boolean start = false;

// The GPS is false
boolean gps1 = false;

// The text for the gear count
String text1 = "Gear:";


void setup()
{
  // Load the Car Starting Sound and the Glass Breaking Sound 
  minim = new Minim(this);
  player = minim.loadFile("carstart.mp3");
  glass = minim.loadFile("brokenglass.mp3");

  // The Size of The Window
  size(1500, 1000);
  
  // Rectangles Are Centered
  rectMode(CENTER);
  
  // Load Images
  carinside = loadImage("carinside.jpg");  // Loads The Inside of the Car
  birds = loadImage("birds.png");  // Loads the Birds In the Background
  bird = loadImage("bird.png");  // Loads the Big Bird 
  glassbreak = loadImage("glassbreak.png");  // Loads the Broken Glass
  gps = loadImage("gps.jpg");  // Loads The GPS
}

void draw()
{
  // The Location of the Images and the Size of the Images
  image(carinside, 0, 0, width, height);  // Location and the Size of the Car Interior
  image(birds, circleX, 70, 500, 150);  // Location and the Size of the Birds In the Background  
  image(bird, 500, 70, 500+press, 150+press);  // Location and the Size of the Big Bird

  // The White Screen 
  fill(255);  // Color Of the Screen
  noStroke();  // No Border Around The Square  
  rect(810, 645, 280, 150);  // The Location and the Size of the Screen

  // The Start Button
  fill(189, 56, 56);  // The Color of the Button
  stroke(169, 169, 169);  // The Color of the Stroke/Border
  strokeWeight(10);  // The Size of the Stroke/Border
  rect(140, 590, 70, 70); // The Location and the Size of the Button
  fill(255);  // The Color Of the Text
  textSize(20);  // The Size of the Text
  text("Start", 120, 597);  // The Text and the Location of the Text

  // The Gear Counter
  fill(255);  // The Color of the Gear Counter
  textSize(20);  // The Size of the Gear Counter
  text(text1+count, 775, 935);  // The Gear Counter (Adds One To The Counter Each Time You Click

  // The White Box for the Text To Appear In
  stroke(0); // The Stroke/Border Color Of the Square
  strokeWeight(10);  // The Size Of the Stroke/Border
  rect(810, 795, 200, 50);  // The White Box For the Text
  
  // If the Start Boolean is True...
  if (start == true)
  {
    // Play the Starting Sound
    player.play();
  }
  
  // If the GPS1 Boolean is True....
  if (gps1 == true)
  {
    // The GPS Image Appear
    image(gps, 670, 570, 280, 150);
  }

  // If the Gear Counter is More Than 100...
  if (count >= 100)
  {
    // The Program Stops and A Text Appear in the White Box
    fill(255, 0, 0);  // Sets the Color of the Text to Red
    text("Too Fast!", 765, 802);  // The Text and the Location of the Text
    stop();  // This Stops The Program
  }
  
  // Adds Speed to the Birds In the Background
  circleX = circleX + speed;

  // If Press is 90....
  if (press == 90)
  {
    // The Glass Breaks, Makes the Glass Breaking Sound, The Text Appear in the White Box and Stops The Program
    glass.play();  // Play the Glass Breaking Sound
    image(glassbreak, 640, 80, 300, 300);  // The Broken Glass Appear
    fill(255, 0, 0);  // Makes the Text Red
    text("Bird Crashed!", 750, 802);  // The Text and the Location Of the Text
    stop();  // This Stops The Program
  }
}

void keyPressed()
{
  // If the w or W Key is Pressed....
  if (key == 'w' || key == 'W')
  {
    // Add 10 To the Y and X Of the Big Birds To Make It Bigger and Bigger
    press += 10;
  }
}

void mouseClicked()
{
  // Adds Up One to The Gear Counter
  count += 1;

  // If the Mouse is Clicked inside the Box.....
  if (mouseX > 105 && mouseX < 175 && mouseY > 555 && mouseY < 625)
  {
    // The Boolean Start is Going to Equal To True
    start = true;
  }

  // If the Mouse Is Clicked Inside The GPS Box....
  if (mouseX > 670 && mouseX < 960 && mouseY > 570 && mouseY < 720)
  {
    // The Boolean GPS1 is Going to Equal To True
    gps1 = true;
  }
}

/**
 
 * My four (or more) text, images, and/or shapes are:
 
 - Squares (3)
 - Images (5)
   - Inside Of The Car
   - Birds 1
   - Birds 2
   - Broken Glass
   - GPS
 -Text (4)
   - Start
   - Gear
   - Too Fast!
   - Bird Crashed!
 
 * My one (or more) self-taught animation is/are:
 
 -Sounds (2)
   - Engine Start
   - Glass Breaking
 
 * My four (or more) animations that were not learned from online tutorials are:
 
 - Move
   - Birds Moving in the background
 - Move when something is pressed
   - The Big Bird moving towards the car when W key is pressed
 - Appear and Disappear
   - The GPS appear when you click the white box
   - A Text appear if the bird hit the car or the gear is higher than 100 below the GPS 
 
 * When you press the ____ key, this happens:
 
 - When you press the W the bird moves closer and closer, when the bird hits the car the glass breaks
 
 * When you click the ____, this happens:
 
 - When you click the Start Button, its makes a starting up sound
 - When you click the White Screen the GPS appears
 - When you keep clicking, the Gear goes up by 1 every time you click
 
 */
