int depth, oldDepth;
color[][] colors;
int ticker;

void setup() {
  size(1000, 1000);
  background(0);
  noStroke();
  frameRate(30);
  
  depth = 8;
  oldDepth = depth;
  ticker = 0;
  colors = new color[depth][depth];
  updateColors();
}

void draw() {  
  if(frameCount % 5 == 0){
    clear();
    ticker++;
    rectangleFill(depth);
  }
}

void rectangleFill(int depth){
  int boxCount = int(pow(2, depth));
  
  float boxSide = max(float(width) / boxCount, float(height) / boxCount);
  System.out.println(boxSide);
  int xColorIndex = 0;
  int yColorIndex = 0;
  System.out.println(boxCount + " " + boxSide + " " + boxCount * boxSide);
  for(int i = 0; i < boxCount; i++){
    for(int j = 0; j < boxCount; j++){
      if(xColorIndex == depth) xColorIndex = 0;
      if(yColorIndex == depth) yColorIndex = 0;
      
      
      
      
      fill(colors[int(xColorIndex + ticker) % depth][int(yColorIndex + ticker) % depth]);
      rect(boxSide * i, boxSide * j, boxSide, boxSide);
      xColorIndex++;
    }
    yColorIndex++;
  }
}

void updateColors(){
   for(int i = 0; i < colors.length; i++){
     for(int j = 0; j < colors[0].length; j++){
       colors[i][j] = color(100 + random(155), 100 + random(155), 100 + random(155));
     }
   } 
}

void keyPressed(){
  int keyNum = (key - 48);
  if(keyNum > 0 && keyNum < 9){
    depth = keyNum;
    ticker++;
  } else {
    updateColors();
  }
}