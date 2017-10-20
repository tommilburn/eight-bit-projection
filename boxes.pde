float aspect;
int depth, oldDepth;
color[][] colors;
boolean drawFlag;

void setup() {
  size(1024, 1024);
  aspect = width / height;
  background(0);
  noStroke();
  fill(102);
  frameRate(30);
  depth = 10;
  drawFlag = false;
  oldDepth = depth;
  colors = new color[depth][depth];
  updateColors();
}

void draw() {  
   if(frameCount % 240 == 0){
    // updateColors();
   }

  if(drawFlag){
    rectangleFill(depth, 0, 0, width, height, colors);
    drawFlag = false;
  } else if(frameCount % 5 == 0){
    rectangleFill(depth, 0, 0, width, height, colors);
  }

}

void rectangleFill(int currDepth, int x, int y, float w, float h, color[][] colors){
  if(currDepth == 1){
    //System.out.println(x + " " + y + " " + h + " " + w);
    fill(colors[int(currDepth + frameCount + (x / w)) % depth][int(currDepth + frameCount + (y / h)) % depth]);
    rect(x, y, w, h);
  } else {
    rectangleFill(currDepth - 1, x, y, w / 2, h / 2, colors);
    rectangleFill(currDepth - 1, int(x + (w / 2)), y, w / 2, h / 2, colors);
    rectangleFill(currDepth - 1, x, int(y + (w / 2)), w / 2, h / 2, colors);
    rectangleFill(currDepth - 1, int(x + (w / 2)), int(y + (w / 2)), w / 2, h / 2, colors);
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
  drawFlag = true;
  if(keyNum > 0 && keyNum < 10){
    depth = keyNum;
    //System.out.println(depth);
  } else {
    updateColors();
  }
}