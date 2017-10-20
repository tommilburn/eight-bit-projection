int depth, oldDepth;
color[][] colors;
int ticker;
boolean drawFlag;
int vDirection;
int hDirection;
int updateInterval;

void setup() {
  fullScreen();
  background(0);
  noStroke();
  frameRate(60);
  int maxDepth = 9;
  depth = maxDepth / 2;
  ticker = 0;
  
  colors = new color[maxDepth][maxDepth];
  updateColors();
  vDirection = 1;
  hDirection = 1;
  depth = 4;
  updateInterval = 5;
}

void draw() {  
  if(frameCount % abs(updateInterval) == 0 || drawFlag){
    clear();
    ticker++;
    rectangleFill(depth);
    drawFlag = false;
  }
}

void rectangleFill(int depth){
  int boxCount = int(pow(2, depth));
  
  float boxSide = max(float(width) / boxCount, float(height) / boxCount);
  //System.out.println(boxSide);
  int xColorIndex = 0;
  int yColorIndex = 0;
  //System.out.println(boxCount + " " + boxSide + " " + boxCount * boxSide);
  for(int i = 0; i < boxCount; i++){
    for(int j = 0; j < boxCount; j++){
      if(xColorIndex == depth) xColorIndex = 0;
      if(yColorIndex == depth) yColorIndex = 0;
      int hMovement = ticker * hDirection;
      int vMovement = ticker * vDirection;

      fill(colors[int(xColorIndex + hMovement) % depth][int(yColorIndex + vMovement) % depth]);
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
  System.out.println(keyCode);
  if(keyCode == 38){
    hDirection++;
  }
  else if(keyCode == 40){
    hDirection--;
  }
  else if(keyCode == 37){
    vDirection--;
  }
  else if(keyCode == 39){
    vDirection++;
  } else if(keyCode == 61){
    updateInterval++; 
  } else if(keyCode == 45){
    updateInterval--;
  }
  if(hDirection < 0) hDirection = 0;
  if(vDirection < 0) vDirection = 0;
  if(updateInterval < 1) updateInterval = 1;
  System.out.println("hdirection: " + hDirection + " vDirection: " + vDirection + " updateInterval: " + updateInterval);
  if(keyCode == 81){
    updateColors();
  }
  int k = (keyCode - 48);
  if(k > 0 && k < 10){
    hDirection = 1;
    vDirection = 1;
    depth = k;
    ticker++;
  } else {
    drawFlag = true;;
  }
}