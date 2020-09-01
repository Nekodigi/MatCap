//based on these site https://en.wikipedia.org/wiki/Snell%27s_law
//https://en.wikipedia.org/wiki/Snell%27s_window
//!It's original method. Can't guarantee accuracy.

float na = 1.44;//Refractive index of water
float nb = 1.0;//Refractive index of air
float dstWS = 200;//1000 distance to water surface(px)
float thetaOff = PI;
float phiOff = HALF_PI;

int pSize = 1;//5 pixel size
PImage img;
float zoff = 0;
float noiseS = 300;//1000 noise size;
float noiseP = 0.1;

void setup(){
  size(500, 500);
  //fullScreen();
  img = loadImage("sky pd.png");
  img.loadPixels();
}

void draw(){
  background(255);
  noStroke();
  for(float x=0; x<width; x+=pSize){
    for(float y=0; y<height; y+=pSize){
      float theta;
      float phi;
      float dix = x-width/2;//x difference from center
      float diy = y-height/2;//y difference from center
      float sinThetaA = dix/sqrt(dstWS*dstWS + dix*dix);//divided by distance to center on xz plane
      float sinPhiA =  diy/sqrt(dstWS*dstWS + diy*diy);
      float sinTA = sqrt(dix*dix + diy*diy)/sqrt(dstWS*dstWS + diy*diy + dix*dix);//for testing valid angle
      //float sinThetaB = na/nb*sinThetaA;
      //float sinPhiB = na/nb*sinPhiA; 
      float sinTB = na/nb*sinTA;
      //if(sinTB >= -1 && sinTB <= 1){
        float pro = asin(sinTB)/asin(sinTA);//angle 
        //if(-1 <= sinPhiB && sinPhiB <= 1){
        //theta = noise(x/noiseS, y/noiseS, zoff)*PI-HALF_PI;
        //phi = noise(x/noiseS, y/noiseS, 1+zoff)*PI-HALF_PI;
        theta = asin(sinThetaA)*pro;
        phi = asin(sinPhiA)*pro;
        //float angle = noise(x/100, y/100, zoff)*TWO_PI*8;
        //theta += cos(angle)*noiseP;
        //phi += sin(angle)*noiseP;
        if(-HALF_PI<=theta && theta<=HALF_PI && -HALF_PI<=phi && phi<=HALF_PI){
          int i = (int)map((theta+thetaOff)%TWO_PI, 0, TWO_PI, 0, img.width-1);
          int j = (int)map((phi+phiOff)%PI, 0, PI, 0, img.height-1);
          fill(img.pixels[i+j*img.width]);
          rect(x, y, pSize, pSize);
        }
      //}
    }
  }
  zoff += 0.01;
  thetaOff += 0.02;
}
