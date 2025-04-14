void setup(){
  size(1000, 800);
  background(255);
}

int clr1 = 100;

float x = 100;
float y = 100;
float w = 50;

void draw(){
  background(255);
  
  fill(clr1);
  //Left Wall
  rect (0, 0, 50, height);
  
  //Right Wall
  rect (width - 50, 0, 50, height);
  
  //Ceiling
  rect (0, 0, width, 50);
  
  //Floor
  rect (0, height - 50, width, 50);

  //Temp. player
  rect (x, y, 50, 50);
}


void keyPressed(){
  if (key == CODED) {
    
    if (keyCode == RIGHT) {
      if (x < width - 100){
        x += 10;
      }
      
    } else if (keyCode == UP) {
      if (y > 50){
        y -= 10;
      }
     
    } else if (keyCode == LEFT) { 
      if (x > 50){
      x -= 10; 
      }
      
    } else if (keyCode == DOWN){
      if (y < height - 100){
        y += 10;
      }
    }
  }
}
