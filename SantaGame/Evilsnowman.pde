class Evilsnowman {
//VARIABLES 
  float x, y, sc, ro, rot; //initial location, initial scale, initial rotation 
  float fb, lr, lapse, frame, jump, vel; //move frameont-back, rotate left-right, lapse, framecount, jump, velocity
  color red, green, skin, white, grey, black, brown; // Colors

//CONSTRUCTOR
  Evilsnowman (float tempx, float tempy, float tempsc, float tempro, float templapse, float tempvel) {
    x=tempx;
    y=tempy;
    sc=tempsc;
    ro=tempro;
    vel=tempvel;
    lapse=templapse;
    red = color(random(200, 255), random(100), random(100));
    white= color(245);
    black = color(0);              
    brown = color(139, 69, 19); 
  }

  void display() {

    //INITIAL POSITION
    pushMatrix();
    rotateX(-PI/2);
    scale(sc);
    translate(x, -25, y);
    rotateY(ro);

    // MOVEMENT
    frame=(frameCount)%(100*lapse); 
    if (frame>0 && frame<(24*lapse)) fb+=vel;
    if (frame>(25*lapse) && frame<(48*lapse)) lr+=vel;
    if (frame>(50*lapse) && frame<(72*lapse)) fb-=vel;
    if (frame>(75*lapse) && frame<(95*lapse)) lr-=vel;   
    if (frame==(25*lapse)||frame==(50*lapse)||frame==(75*lapse)||frame==(99*lapse)) rot+=PI/2;
    if ((frame>(0*lapse) && frame<(5*lapse))||(frame>(10*lapse) && frame<(15*lapse))||(frame>(20*lapse) && frame<(25*lapse))||(frame>(30*lapse) && frame<(35*lapse))) jump-=vel;     
    if ((frame>(5*lapse) && frame<(10*lapse))||(frame>(15*lapse) && frame<(20*lapse))||(frame>(25*lapse) && frame<(30*lapse))||(frame>(35*lapse) && frame<(40*lapse)))  jump+=vel;

    translate(lr, jump, fb);
    rotateY(rot);

    //CONSTRUCTION
    //BODY
    fill(white);
    box(30, 30, 30);
    strokeWeight(4);
    stroke(brown);
    pushMatrix();
    rotateX(-frameCount*0.1);
    line(-15, 0, -30, -15);
    line(15, 0, 30, -15);
    popMatrix();
    strokeWeight(1);
    
    //HEAD
    stroke(black);
    translate(0, -25, 0);
    box(20, 20, 20);
    
    //CRAZY EYES
    fill(red);
    pushMatrix();
    translate(0, 0, 11);
    ellipse(-4, 0, 5, 5);
    ellipse(4, 0, 5, 5);
    strokeWeight(2);
    line(-7, -5, 0, -2, -(frameCount%16+16)/8, 0);
    line(7, -5, 0, 2, -(frameCount%16+16)/8, 0);
    strokeWeight(1);
    fill(black);
    
    //MOUTH
    rect(-7, 5, 14, 2);
    popMatrix();

    popMatrix();
  }
}