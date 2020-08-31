class Sphere{
  PVector origin;
  float r;
  
  Sphere(PVector origin, float r){
    this.origin = origin;
    this.r = r;
  }
  
  void show(){
    for(float x=-r; x<r; x+=pSize){
      for(float y=-r; y<r; y+=pSize){
        float theta = 0;//-PI<=theta<=PI
        float phi = 0;//-HALF_PI<=phi<=HALF_PI
        float yn = y/r;//y normalized
        float xm = sqrt(1-yn*yn)*r;//x max
        float xn = x/xm;//x normalized
        if(-1<=xn && xn<=1){
          theta = asin(xn)*2;//it's same as map(asin(xn), -HALF_PI, HALF_PI, -PI, PI)
          phi = asin(yn);
          int i = (int)map((theta+thetaOff)%TWO_PI, 0, TWO_PI, 0, img.width-1);
          int j = (int)map((phi+phiOff)%PI, 0, PI, 0, img.height-1);
          fill(img.pixels[i+j*img.width]);
          rect(origin.x+x, origin.y+y, pSize+1, pSize+1);//pSize+1...
        }
      }
    }
  }
}
