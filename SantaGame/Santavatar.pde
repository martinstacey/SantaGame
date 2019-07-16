class Santavatar {
  //VARIABLES USED
  float x, y; //position, front 
  color skin, white, red, grey, black; // colors used
 
//CONSTRUCTOR
  Santavatar(float tempx, float tempy) {
    x=tempx;
    y=tempy;
    skin= color(255, 214, 166);
    white= color(245);
    red =color(220, 0, 0);
    grey= color(125);
    black = color(0);
  }

  void display() {

    //BODY
    pushMatrix();
    rotateX(-PI/2);
    //rotateY(-PI/2);
    fill(red);
    translate(0, -25, 0);
    rotateZ(PI*2);
    rotateY(0);
    strokeWeight(1);
    stroke(black);
    box(50, 50, 50);

    //HEAD
    fill(skin);
    pushMatrix();
    translate(0, -50, 0);
    box(50, 50, 50);
    popMatrix();

    //FACIAL FEATURES
    pushMatrix();
    translate(0, 0, 0);
    rotateY(-PI/2);
    fill(white);
    translate(0, 0, 26);
    rect(-25, -50, 50, 50);
    fill(black);
    rect(-15, -65, 3, 10);
    rect(15, -65, 3, 10);
    popMatrix();

    //HAT
    fill(red);
    pushMatrix();
    translate(25, -75, 25);
    beginShape();
    vertex(0, 0, 0);
    vertex(-50, 0, 0);
    vertex(-25, -25, -25);
    vertex(0, 0, 0);
    endShape();
    beginShape();
    vertex(0, 0, 0);
    vertex(0, 0, -50);
    vertex(-25, -25, -25);
    endShape();
    beginShape();
    vertex(-50, 0, -50);
    vertex(0, 0, -50);
    vertex(-25, -25, -25);
    endShape();
    beginShape();
    vertex(-50, 0, 0);
    vertex(-50, 0, -50);
    vertex(-25, -25, -25);
    endShape();
    pushMatrix();
    noStroke();
    fill(white);
    translate(-25, -25, -25);
    sphere(5);
    stroke(1);
    popMatrix();
    popMatrix();
    popMatrix();
  }
}