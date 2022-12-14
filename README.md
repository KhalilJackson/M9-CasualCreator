# M9-CasualCreator
The goal of this project is to make an interactive casual creator. My casual creator is titled Fetch-n-Sketch.

I personally wanted a project that allows people to draw. Since I was a child, I always gravitated towards drawing because it gave me the freedom and flexibility to try whatever my mind wanted to try at the moment with no judgement or sense of right or wrong. I have always liked the freedom have having a set amount of tools (usually pen and paper) and being able to make a countless number of unique products behind it. My favorite music artist is Nas, and one of the things I always appreciated about his music is the recurring theme that his music, and Hip-Hop as an artform, always goes back to the rapper and the microphone; my appreciation for that relationship between artist and instrument is why I have an appreciation for drawing.

The idea is to give the user a finite set of tools that operate differently in diffierent circumstances, so I made it where you begin with a standard sketchpad that can call, or fetch, one of the other three sketch pads that operate differently. The users are put in control of navigating these various sketchpads, which gives them new experiences to try out while putting them in charge of creating their own unique drawings; the ability to pause a sketch also allows for them to save their work and compare things and overlap windows without the fear of adding lines in the process.

The idea for this project is to create a multi-window sketch pad where the multiple windows have different characteristics. The first window is a standard sketchpad that draws when you click on it. The second is a sketpad that drawns mirroed lines on the diagonal. The third is an inverted sketchpad where vertical mouse movements make horizontal lines and vice-versa. The fourth window creates a diagonal zig-zag pattern.

Clicking on the main tab allows you to open one of the other three tabs by clicking 2, 3, or 4 for the respective windows. Pressing the up arrow on any window will pause drawing on any of them, and pressing be on any of the windows will change the line to a bolded version.

The Processing line function is used to draw the lines, and the weight function is used to thicken the line when they are bolded. The PApplet class is extended by the Casual_Creator class to use runsketch to created the multiple windows. Determining whether the window should pause or the line should be bolded is done by looking for keyCode for the up arrow and b, repsectively.

The basis for this project came from a multi-window example found in Processing resources; it was adapted from a PixelFlow example from Thomas Diewald by Andres Colubri.

# Challenges
The first and most difficult challenge with this project is the fact that I only had a little under a week to finish the whole things, and that week is finals week where my finals exam is due on the same day; we start with such a broad ended project where I believe I spend asignificant chunk of my time trying to figure out what I want to do. The next challenge was understanding how Papplet works and how I could use that functionality to create working sketchpads. The other was fine tuning the code to add the features that I wanted to add.

# Room for improvement 
The background color of the child windows is different than the main window. 
The title of the windows could be more specific to the actual function of the window.

# A few bugs
The bold function works, but once you bold a line, you cannot unbold it. 
The windows can move around the screen, but if you change their size, you will get a runtime error.
