// MultipleWindows, by Andres Colubri
// Adapted from a PixelFlow example by Thomas Diewald
// Demonstration of a multiple window sketch with OpenGL 
// (P2D or P3D) renderers, including resource sharing
// across windows. 



// Getting the same background color
// Getting rid of the Child Applet window name
// Fixing the bold statement

// You can move the windows but cannot change their size; will hit a runtime error
// Can press B to use bolded lines


Casual_Creator childA;
Casual_Creator childB;
Casual_Creator childC;

PShape pointer;

void setup() {
  size(400, 300, P2D);
  background(102);
  
  // Change location of parent window after creating child window.
  windowMove(100, 0);
}


void draw() {
  //background(32);

  //fill(160);
  //textAlign(CENTER, CENTER);
  //text("MAIN window", width/2, height/2);


  // Pauses drawing for parent window if up key is pressed
  if (keyCode != UP) {
    
    stroke(255);
    
    if (mousePressed == true) {
      
      if (keyCode != 66) {
        line(mouseX, mouseY, pmouseX, pmouseY);
      } else {
        strokeWeight(3);
        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
  
  }
}

public void keyPressed() {
  if (childA == null) {
    childA = new Casual_Creator(2, 500, 0, 400, 300);
    //childA.bckColor = color(227, 173, 37);
  } else if (childB == null) {
    childB = new Casual_Creator(3, 500, 353, 400, 300);
    //childB.bckColor = color(137, 227, 37);
  } else if (childC == null) {
    childC = new Casual_Creator(4, 100, 353, 400, 300);
    //childC.bckColor = color(51, 157, 209);
  }
}

// ChildApplet
class Casual_Creator extends PApplet {
  int id, vx, vy, vw, vh;
  int bckColor;

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
    //println("Creating window "+ id);
  }

  void setup() {
    windowMove(vx, vy);
    windowResizable(true);
  }

  void draw() {
    //background(bckColor);
    //textAlign(CENTER, CENTER);
    //text("CHILD window "+ id, width/2, height/2);

    // Pauses drawing if up key is pressed for any child window
    if (keyCode != UP) {
      
      //cursor(CROSS);
      
      stroke(255);
    
      if (mousePressed == true) {
        
        // Northwest
        if (id == 2) {
          if (keyCode == 66) {
            strokeWeight(3);
            line(mouseX, mouseY, pmouseX, pmouseY);
            line(mouseY, mouseX, pmouseY, pmouseX);
          } else {
            strokeWeight(3);
            line(mouseX, mouseY, pmouseX, pmouseY);
            line(mouseY, mouseX, pmouseY, pmouseX);            
          }
        }        
        
        // Inverted
        if (id == 3) {
          if (keyCode == 66) {
            strokeWeight(3);
            line(mouseY, mouseX, pmouseY, pmouseX);
          } else {
            line(mouseY, mouseX, pmouseY, pmouseX);
          }
        }    
        
        // 
        if (id == 4) {
          //line(mouseX, mouseY, pmouseY, pmouseX);
          
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
