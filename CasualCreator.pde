/*  
M9: Another Kind of CC (Casual Creator) Assignments
Computational Creativity Final Project Part II
December 13, 2022
Written by Khalil Jackson


The idea for this project is to create a multi-window 
sketch pad where the multiple windows have different 
characteristics. 

The first window is a standard sketchpad that draws when you
click on it. The second is a sketpad that drawns mirroed lines
on the diagonal. The third is an inverted sketchpad where 
vertical mouse movements make horizontal lines and vice-versa.
The fourth window creates a diagonal zig-zag pattern.

Clicking on the main tab allows you to open one of the other
three tabs by clicking 2, 3, or 4 for the respective windows.
Pressing the up arrow on any window will pause drawing on 
any of them, and pressing be on any of the windows will change
the line to a bolded version.

The Processing line function is used to draw the lines, and 
the weight function is used to thicken the line when they 
are bolded. The PApplet class is extended by the Casual_Creator
class to use runsketch to created the multiple windows. 
Determining whether the window should pause or the line should
be bolded is done by looking for keyCode for the up arrow and 
b, repsectively.

The basis for this project came from a multi-window example
found in Processing resources; it was adapted from a PixelFlow
example from Thomas Diewald by Andres Colubri.

Room for improvement. The background color of the child windows
is different than the main window. The title of the windows
could be more specific to the actual function of the window.
The bold function works, but once you bold a line, you cannot
unbold it. The windows can move around the screen, but if you
change their size, you will get a runtime error.

*/  

Casual_Creator childA;
Casual_Creator childB;
Casual_Creator childC;

void setup() {
  size(400, 300, P2D);
  background(102);
  
  windowMove(100, 0);
}

void draw() {

  // Pauses drawing when up arrow is pressed
  if (keyCode != UP) {
    
    stroke(255);
    
    // Draws continous line if mouse is pressed
    if (mousePressed == true) {
           
      // Bolds line if B is pressed
      if (keyCode == 66) {
        strokeWeight(3);
        line(mouseX, mouseY, pmouseX, pmouseY);
      } else {
        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
  }
}

public void keyPressed() {
  
  // Calls the second window when 2 is pressed
  if ((childA == null) && (key == 50)) {
    childA = new Casual_Creator(2, 500, 0, 400, 300);
    //childA.bckColor = color(227, 173, 37);
  } 
  
  // Calls the third window when 3 is pressed
  else if ((childB == null) && (key == 51)) {
    childB = new Casual_Creator(3, 500, 353, 400, 300);
    //childB.bckColor = color(137, 227, 37);
  } 
  
  // Calls the fourth window when 4 is pressed
  else if ((childC == null) && (key == 52)) {
    childC = new Casual_Creator(4, 100, 353, 400, 300);
    //childC.bckColor = color(51, 157, 209);
  }
}

class Casual_Creator extends PApplet {
  int id, vx, vy, vw, vh;
  int bckColor;

  // Initializes casual creator class instance
  Casual_Creator(int id, int vx, int vy, int vw, int vh) {
    super();
    this.id = id;
    this.vx = vx;
    this.vy = vy;
    this.vw = vw;
    this.vh = vh;

    PApplet.runSketch(new String[] { this.getClass().getName() }, this);
  }

  void settings() {
    size(vw, vh, P2D);
    smooth(0);
  }

  void setup() {
    windowMove(vx, vy);
    windowResizable(true);
  }

  void draw() {

    // Pauses drawing when up arrow is pressed
    if (keyCode != UP) {
      
      stroke(255);
    
      // Draws continous line if mouse is pressed
      if (mousePressed == true) {
        
        // Create diagonally mirrored lines for second window
        if (id == 2) {
          
          // Bold the lines if B is pressed
          if (keyCode == 66) {
            strokeWeight(3);
            line(mouseX, mouseY, pmouseX, pmouseY);
            line(mouseY, mouseX, pmouseY, pmouseX);
          } else {
            line(mouseX, mouseY, pmouseX, pmouseY);
            line(mouseY, mouseX, pmouseY, pmouseX);            
          }
        }        
        
        // Invert X and Y mouse movement in third window
        if (id == 3) {
          
          // Bold the line if B is pressed
          if (keyCode == 66) {
            strokeWeight(3);
            line(mouseY, mouseX, pmouseY, pmouseX);
          } else {
            line(mouseY, mouseX, pmouseY, pmouseX);
          }
        }    
        
        // Create slanted zig-zag pattern for last window
        if (id == 4) {
          
          // Bold the line if B is pressed
          if (keyCode == 66) {
            strokeWeight(3);
            line(mouseY, mouseX, pmouseX, pmouseY);
          } else {
            line(mouseY, mouseX, pmouseX, pmouseY);
          }
        }
      }
    }
  }
}
