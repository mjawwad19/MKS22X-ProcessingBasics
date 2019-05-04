int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 0;
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int level, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    //YOU WRITE THIS METHOD!
    if (level == 0) {
      fill(255); //first triangle is white.. we will cut from this
      triangle(v1x,v1y,v2x,v2y,v3x,v3y);
      return;
    }
    //else fill(50); not necessary
    level--;
    gasket(level, v1x,v1y, mP(v1x,v2x), mP(v1y,v2y), mP(v1x,v3x), mP(v1y,v3y)); // left
    gasket(level, v2x, v2y, mP(v2x, v1x), mP(v2y, v1y), mP(v2x, v3x), mP(v2y, v3y)); //right
    gasket(level, v3x, v3y, mP(v3x, v1x), mP(v3y, v1y), mP(v3x, v2x), mP(v3y, v2y)); //top
}
    
float mP(float a, float b) {
  return (a+b)/2.0;
}

void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levels",20,20);

  gasket(levels,0, height-10, width, height-10, width/2, 10);

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
}
