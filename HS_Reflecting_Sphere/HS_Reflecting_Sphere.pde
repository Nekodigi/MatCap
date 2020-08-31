//high speed mirror
int pSize = 2;//3 pixel size
PImage img;
float thetaOff = PI;
float phiOff = HALF_PI;
ArrayList<Sphere> spheres = new ArrayList<Sphere>();

void setup(){
  img = loadImage("sky pd.png");
  img.loadPixels();
  size(500, 500);
  //fullScreen();
  for(int i=0; i<10; i++){
    spheres.add(new Sphere(new PVector(random(width), random(height)), height/10));
  }
}

void draw(){
  background(0);
  noStroke();
  for(Sphere sphere : spheres){
    sphere.show();
  }
  thetaOff += 0.02;
}
