//VARIABLES USED
float xydist = 4000;
color red =color(220, 0, 0);
color green= color(70, 130, 30);
color white= color(245);
color black = color(0);

void xy() {
  //XY COORDINATES
  strokeWeight(4);
  stroke(green);
  line(-xydist/2, 0, xydist/2, 0);     //X 
  stroke(red);
  line(0, -xydist/2, 0, xydist/2);     //Y

  //SECONDARY LINES
  strokeWeight(1);
  stroke(white);
  strokeWeight(0.5);

  for (int i=-200; i<200; i++) {
    line(-xydist/2, i*10, xydist/2, i*10);      //X Lines
    line(i*10, -xydist/2, i*10, xydist/2);      //Y Lines
  }
}