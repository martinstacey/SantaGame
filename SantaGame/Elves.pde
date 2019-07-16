class Elves {
  float x, y, sc, ro, rot; //initial location, initial scale, initial rotation
  float fb, lr, lapse, frame, jump, vel; //move frameameont-back, rotate left-right, lapse, frameamecount, jump, velocity
  color red, green, skin, white, grey, black; // Colors

  Elves(float tempx, float tempy, float tempsc, float tempro, float templapse, float tempvel) {
    x=tempx;
    y=tempy;
    sc=tempsc;
    ro=tempro;
    vel=tempvel;
    lapse=templapse;
    red = color(random(200, 255), random(100), random(100));
    green = color(random(50), random(200, 255), random(50));
    skin= color(255, 214, 166);
    white= color(245);
    grey= color(125);
    black = color(0);
  }

  void display() {

    //INITIAL POSITION
    pushMatrix();
    rotateX(-PI/2);
    scale(sc);
    translate(x, -25, y);
    rotateY(ro);

    //MOVEMENT
    frame=(frameCount)%(100*lapse); 
    if (frame>0 && frame<(24*lapse)) fb+=vel;
    if (frame>(25*lapse) && frame<(48*lapse)) lr+=vel;
    if (frame>(50*lapse) && frame<(72*lapse)) fb-=vel;
    if (frame>(75*lapse) && frame<(95*lapse)) lr-=vel;   
    if (frame==(25*lapse)||frame==(50*lapse)||frame==(75*lapse)||frame==(99*lapse)) rot+=PI/2;
    if ((frame>(10*lapse) && frame<(12*lapse))||(frame>(38*lapse) && frame<(40*lapse))||(frame>(68*lapse) && frame<(70*lapse))||(frame>(90*lapse) && frame<(92*lapse))) jump-=vel;     
    if ((frame>(12*lapse) && frame<(14*lapse))||(frame>(40*lapse) && frame<(42*lapse))||(frame>(70*lapse) && frame<(72*lapse))||(frame>(92*lapse) && frame<(94*lapse)))  jump+=vel;

    translate(lr, jump, fb);
    rotateY(rot);

    //CONSTRUCTION
    //BODY
    fill(red);
    box(50, 50, 50);

    //HEAD
    fill(skin);
    pushMatrix();
    translate(0, -50, 0);
    box(50, 50, 50);
    popMatrix();

    //FACIAL FEATURES
    pushMatrix();
    fill(black);
    translate(0, 0, 26);
    rect(-15, -40, 35, 3);
    fill(black);
    rect(-15, -65, 3, 10);
    rect(15, -65, 3, 10);
    popMatrix();

    //EARS
    pushMatrix();
    fill(skin);
    translate(25, -65, 0);
    beginShape();
    vertex(0, 0, 0);
    vertex(0, 20, 0);
    vertex(15, -5, 0);
    vertex(0, 0, 0);
    endShape();
    translate(-50, 0, 0);
    beginShape();
    vertex(0, 0, 0);
    vertex(0, 20, 0);
    vertex(-15, -5, 0);
    vertex(0, 0, 0);
    endShape();
    popMatrix();

    //HAIR
    fill(black);
    pushMatrix();
    translate(0, -77, 0);
    box(50, 5, 50);
    popMatrix();

    //HAT
    fill(red);
    pushMatrix();
    translate(25, -80, 25);
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
    noStroke();
    fill(white);
    translate(-25, -25, -25);
    sphere(5);
    stroke(1);
    popMatrix();

    popMatrix();
  }
}