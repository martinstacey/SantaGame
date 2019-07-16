class Presents {
  //VARIABLES USED
  float x, y, ro, b; //initial location, initial rotation,  dimension
  color cribbon, cbox; //2 color for box and ribbon

  //CONSTRUCTOR
  Presents(float tempx, float tempy, float tempro, float tempb, color tempc1, color tempc2) {
    x=tempx;
    y=tempy;
    ro=tempro;
    b=tempb;
    cribbon=tempc1;
    cbox = tempc2;
  }

  void display() { 
    //DISPLAY 
    //INITIAL LOCATION AND ROTATION
    pushMatrix();
    rotateX(-PI/2);
    translate(x, 0, y);
    rotateY(ro);

    //BOX
    fill(cbox);
    translate(0, -b/2, 0);
    box(b);

    //RIBBON
    fill(cribbon);  
    pushMatrix();
    translate(0, 0, b/2+1);
    rect(-b/6, b/2, b/3, -b);   //ribbon front
    rect(-b/2, b/6, b, -b/3);
    translate(0, 0, -b-2);
    rect(-b/6, b/2, b/3, -b);   //ribbon back
    rect(-b/2, b/6, b, -b/3);
    popMatrix();
    pushMatrix();
    translate(b/2+1, 0, 0);
    rotateY(PI/2);
    rect(-b/6, b/2, b/3, -b);   //ribbon right
    rect(-b/2, b/6, b, -b/3);
    translate(0, 0, -b-2);
    rect(-b/6, b/2, b/3, -b);    //ribbon left
    rect(-b/2, b/6, b, -b/3);
    popMatrix();
    pushMatrix();
    translate(0, -b/2-1, 0);
    rotateX(PI/2);
    rect(-b/6, b/2, b/3, -b);    //ribbon top
    rect(-b/2, b/6, b, -b/3);
    popMatrix();
    popMatrix();
  }
}