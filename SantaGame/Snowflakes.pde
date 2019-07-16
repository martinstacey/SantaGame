class Snowflakes {
  //VARIABLES USED
  float x, y, z, s; //Position XYZ, Scale
  color snow; //Color of Snow

  //CONSTRUCTOR
  Snowflakes (float tempx, float tempy, float tempz, float temps, color tempc1) 
  {
    x=tempx;
    y=tempy;
    z=tempz;
    s=temps;
    snow=tempc1;
  }

  void display() 
  {
    //LOCATION
    pushMatrix();
    rotateX(-PI/2);
    translate(x, (-z+frameCount)%500, y);

    //DISPLAY
    noStroke();
    fill(snow);   
    sphere(s);
    popMatrix();
  }
}