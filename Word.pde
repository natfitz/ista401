/*
Movement and bouncing based off Richard Spellman's Terminal Velocity
*/
public class Word {
 
  
  PVector start; // the position of the word object
  PVector vel; // velocity of the word object
  PVector acc = new PVector(0, 0.05); // acceleration applied to the word object
  String word; // the character represented by the word object
  color c; // color to print the text
  int age; // age of the word object
  String pos; 
  // Constructor
 
  public Word(PVector _xy, color _c, String _w, String _pos){
    start = _xy; // set initial position
    c = _c; // set color
    word = _w; // set word
    pos = _pos;
    vel = new PVector(0, 0.1); // set initial velocity... down.
  }
 
  // render(): draws the character to the screen. called by draw()
  void render(){
  //  start = new PVector(x,y);
    fill(c); // text color
    text(word, start.x, start.y); // print character represented by the Char object at it's current position value.
  }
   
  // move(): increments the position of the Char object. called by draw()
  void move(){
    if(age > 120){ // wait a while before falling
      start.add(vel); // increment position using current velocity
      vel.add(acc); // apply acceleration to velocity
    }
  }
   
  // age(): increments the age variable of the Char object. called by draw(). used to determine when to start the
  // character falling, and when to remove it from the ArrayList...
  void age(){
    age++; // increment the age variable by one
  }
   
  // bounce(): inverts the direction of the velocity vector and reduces it's magnitude when the position of the character
  // reaches the bottom of the screen
  void bounce(){
    if(start.y > height){ // if the position of the character reaches the bottom of the screen,
      vel.y = vel.y * -0.9; // invert the direction and reduce the magnitude of the Char object's velocity vector by 30%
    }
  }
} 
  
 

