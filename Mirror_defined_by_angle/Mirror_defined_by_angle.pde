//get refrected light determined by(2theta and 2phi)
int pSize = 2;//5 pixel size
PImage img;
float zoff = 0;
float noiseS = 300;//1000 noise size;

void setup(){
  size(500, 500);
  //fullScreen();
  img = loadImage("sky pd.png");
  img.loadPixels();
  //noiseDetail(3);
}

void draw(){
  noStroke();
  for(float x=0; x<width; x+=pSize){
    for(float y=0; y<height; y+=pSize){
      float theta;
      float phi;
      theta = noise(x/noiseS, y/noiseS, zoff)*PI-HALF_PI;
      phi = noise(x/noiseS, y/noiseS, 1+zoff)*PI-HALF_PI;
      //float angle = noise(x/100, y/100, zoff)*TWO_PI*8;
      //theta = cos(angle)*0.5;
      //phi = sin(angle)*0.5;
      int i = (int)map((theta+PI)%TWO_PI, 0, TWO_PI, 0, img.width-1);
      int j = (int)map((phi+HALF_PI)%PI, 0, PI, 0, img.height-1);
      fill(img.pixels[i+j*img.width]);
      rect(x, y, pSize, pSize);
    }
  }
  zoff += 0.01;
}
