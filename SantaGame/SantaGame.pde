//SANTAS ADVENTURES, MARTIN STACEY
//DIRECTIONS:      C=Change Camera    A=Left   D=Rigth   W=Front   S=Back  M=Start Capturing Frame M= Stop Capturing Frame
//VARIABLES
Trees [] t = new Trees [35];
Presents [] p = new Presents [30];
Elves [] e = new Elves [8];
Evilsnowman [] es = new Evilsnowman [10];
Snowflakes [] sn = new Snowflakes [200]; 
Santavatar santa = new Santavatar(0, 0);
PMatrix3D avatar = new PMatrix3D();
boolean cam=true;
boolean movie;

void setup()
{
  println("DIRECTIONS:      C=Change Camera    A=Left   D=Rigth   W=Front   S=Back  M=Start Capturing Frame M= Stop Capturing Frame   ");
  //initial size
  size(500, 500, P3D);
  //Initial Santa Position
  avatar.translate(50, 50, 50);
  avatar.rotate(PI/6);
  //INSTANCIATION 
  //TREES
  for (int i=0; i<t.length; i++) t[i]=new Trees(random(-1000, 1000), random(-1000, 1000), random(30, 80), random(50, 250), random(PI), color(random(50, 100), random(80, 170), random(0, 50)), color(random(50, 100), random(80, 170), random(0, 50)));
  //PRESENTS
  for (int i=0; i<p.length; i++) p[i]=new Presents(random(-1000, 1000), random(-1000, 1000), random(PI), random(30, 50), color(random(255), random(255), random(255)), color(random(255), random(255), random(255)));  
  //ELVES
  for (int i=0; i<e.length; i++) e[i]=new Elves(random(-500, 500), random(-500, 500), random(0.35, 0.7), random(PI), new int[]{ 3, 5, 7, 11, 13, 17, 19}[int(random(7))], random(0.3, 4));
  //EVILSNOWMAN
  for (int i=0; i<es.length; i++) es[i]=new Evilsnowman(random(-500, 500), random(-500, 500), random(1, 1.4), random(PI), new int[]{ 3, 5, 7}[int(random(3))], random(0.3, 4));
  //SNOWFLAKES
  for (int i=0; i<sn.length; i++) sn[i]=new Snowflakes(random(-1000, 1000), random(-1000, 1000), random(500), random(1, 5), color(random(250, 255), 100));
}
void draw()
{  
  background(0);
  //DRAW CAMERA
  camera(500, 0, 200, 0, 0, 200, 0, 0, -1);
  //MATRIX CAMERA POSITION 
  PMatrix3D matrix = new PMatrix3D();
  matrix.translate(500, 0, 200);
  PMatrix3D inv =  new PMatrix3D(avatar);
  inv.invert();
  matrix.apply(inv);
  //CONDITION 1ST PERSON PERSPECTIVE
  if (cam) applyMatrix(matrix); 
  //CONDITION 3TH PERSON PERSPECTIVE
  if (!cam) 
  {
    pushMatrix();
    applyMatrix(avatar); 
    santa.display();
    popMatrix();
  }
  //DRAW ALL ENVIRONMENT
  xy();
  //TREES DISPLAY
  for (int i=0; i<t.length; i++) t[i].display();
  //PRESENTS
  for (int i=0; i<p.length; i++) p[i].display();
  //EVILSNOWMAN
  for (int i=0; i<e.length; i++) e[i].display();
  //ELVES
  for (int i=0; i<es.length; i++) es[i].display();
  //SNOWFLAKES
  for (int i=0; i<sn.length; i++) sn[i].display();
  //RECORD MOVIE
  if (movie) saveFrame("movie/movie"+frameCount+".png");
  if (keyPressed) if (key=='a') avatar.rotateZ(-0.05);
  if (keyPressed)  if (key=='d') avatar.rotateZ(0.05);
  if (keyPressed)  if (key=='w') avatar.translate(-10, 0, 0);
  if (keyPressed)   if (key=='s') avatar.translate(10, 0, 0);
}
void keyPressed()
{
  //if (key=='a') avatar.rotateZ(-0.05);
  //if (key=='d') avatar.rotateZ(0.05);
  //if (key=='w') avatar.translate(-10, 0, 0);
  //if (key=='s') avatar.translate(10, 0, 0);
  if (key == 'c') cam=!cam;
  if (key=='m') movie=!movie;
}
