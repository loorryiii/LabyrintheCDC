/**
 PScratch by R2mix
 For documentation : https://github.com/r2mix/pscratch
 */

import R2mix.PScratch.*;
import processing.sound.*;

Stage stage;
Sounds sounds;
Player player;
end_boss End_boss;

void setup() {
  size(800, 700);
  pixelDensity(1);
  stage = new Stage(this, "scenes");
  sounds = new Sounds(stage, "sounds");
  player = new Player();
  player.start();
  End_boss = new end_boss();
  End_boss.start();
}
void draw () {
  stage.backdrops();
  player.draw();
  End_boss.draw();
}
void mousePressed() {             // called when the mouse is pressed
  stage.pick();                  // Print the value of the color on the mouse position, the mouse cordonates, the size of the screen, the frameRate
}
void keyPressed() {              // called when a key is pressed
  stage.keyIsDown();             // check if all keys are pressed or not
}
void keyReleased() {             // called when a key is released
  stage.keyIsUp();               // check if all keys are released or not
}
