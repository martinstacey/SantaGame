class Trees {
  //VARIABLES USED
  float x, y, ro, b, h; //initial location, initial rotation, base dimension, height, 
  color rgreen, lgreen, brown; //2 color trees vatiations and 1 trunk color

  //CONSTRUCTOR
  Trees(float tempx, float tempy, float tempb, float temph, float tempro, color tempc1, color tempc2) {
    x=tempx;
    y=tempy;
    ro=tempro;
    b=tempb;
    h=temph;
    rgreen=tempc1;
    lgreen = tempc2;
    brown = color(139, 69, 19); // trunk Color
  }

  void display() { 
    //DISPLAY 
    //INITIAL LOCATION AND ROTATION
    pushMatrix();
    rotateX(-PI/2);
    translate(x, 0, y);
    rotateY(ro);

    //TREE TRUNK
    fill(brown);
    stroke(black);
    translate(0, -10, 0);
    box(b/3, 20, b/3);
    translate(0, -10, 0);

    //RECTANGULAR PYRAMID CONSTRUCTION
    fill(rgreen);  
    beginShape();  //Base
    vertex(b/2, 0, b/2);
    vertex(-b/2, 0, b/2);
    vertex(-b/2, 0, -b/2);
    vertex(b/2, 0, -b/2);
    vertex(b/2, 0, b/2);
    endShape();

    beginShape(); //Front Side
    vertex(b/2, 0, b/2);
    vertex(-b/2, 0, b/2);
    vertex(0, -h, 0);
    vertex(b/2, 0, b/2);
    endShape();

    beginShape(); //Right Side
    vertex(b/2, 0, b/2);
    vertex(b/2, 0, -b/2);
    vertex(0, -h, 0);
    endShape();

    beginShape(); //Left Side
    vertex(-b/2, 0, -b/2);
    vertex(b/2, 0, -b/2);
    vertex(0, -h, 0);
    endShape();

    beginShape(); //Back Side
    vertex(-b/2, 0, b/2);
    vertex(-b/2, 0, -b/2);
    vertex(0, -h, 0);
    endShape();

    //DETAIL TRIANGLES
    fill(lgreen);
    beginShape(); //Details in Front Side
    vertex(b/4+1, -h/2, b/4+1);
    vertex(-b/4-1, -h/2, b/4+1);
    vertex(b/2+1, 0, +b/2+1);
    endShape();

    beginShape(); 
    vertex(b/4+1, -h/2, b/4+1);
    vertex(-b/4-1, -h/2, b/4+1);
    vertex(b/8+1, -h+h/4, b/8+1);
    endShape();

    beginShape();  //Details in Right Side
    vertex(b/4+1, -h/2, b/4+1);
    vertex(b/4+1, -h/2, -b/4-1);
    vertex(b/2+1, 0, b/2+1);
    endShape();

    beginShape(); 
    vertex(b/4+1, -h/2, b/4+1);
    vertex(b/4+1, -h/2, -b/4-1);
    vertex(b/8+1, -h+h/4, b/8+1);
    endShape();  
    line(b/2+1, 0, +b/2+1, b/8+1, -h+h/4, b/8+1);

    beginShape();  //Details in Left Side
    vertex(-b/4-1, -h/2, -b/4-1);
    vertex(-b/4-1, -h/2, b/4+1);
    vertex(-b/2-1, 0, -b/2-1);
    endShape();

    beginShape(); 
    vertex(-b/4-1, -h/2, -b/4-1);
    vertex(-b/4-1, -h/2, b/4+1);
    vertex(-b/8-1, -h+h/4, -b/8-1);
    endShape();

    beginShape(); //Details in Right Side
    vertex(-b/4-1, -h/2, -b/4-1);
    vertex(b/4+1, -h/2, -b/4-1);
    vertex(-b/2-1, 0, -b/2-1);
    endShape();

    beginShape(); 
    vertex(-b/4-1, -h/2, -b/4-1);
    vertex(b/4+1, -h/2, -b/4-1);
    vertex(-b/8-1, -h+h/4, -b/8-1);
    endShape(); 
    line(-b/2-1, 0, -b/2-1, -b/8-1, -h+h/4, -b/8-1);

    popMatrix();
  }
}