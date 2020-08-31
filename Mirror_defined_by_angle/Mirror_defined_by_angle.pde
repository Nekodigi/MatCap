//get refrected light determined by(2theta and 2phi)
int pSize = 1;//pixel size
PImage img;
float zoff = 0;

void setup(){
  img = loadImage("sky pd.png");
  img.loadPixels();
  size(500, 500);
}

void draw(){
  noStroke();
  for(float x=0; x<width; x+=pSize){
    for(float y=0; y<height; y+=pSize){
      //float theta = noise(float(x)/500, zoff)*PI-HALF_PI;
      //float phi = noise(float(y)/500, zoff)*PI-HALF_PI;
      float theta = 0;//-PI<=theta<=PI
      float phi = 0;//-HALF_PI<=phi<=HALF_PI
      float yn = (y-height/2)/(height/2);//y normalized
      float xm = sqrt(1-yn*yn)*width/2;//x ma
      float xn = (x-width/2)/xm;//x normalized
      theta = asin(xn)*2;//it's same as map(asin, -HALF_PI, HALF_PI, -PI, PI)
      phi = asin(yn);
      int i = (int)map((theta+PI)%TWO_PI, 0, TWO_PI, 0, img.width-1);
      int j = (int)map((phi+HALF_PI)%PI, 0, PI, 0, img.height-1);
      fill(img.pixels[i+j*img.width]);
      rect(x, y, pSize, pSize);
    }
  }
  zoff += 0.01;
}
