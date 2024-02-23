private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2; 
private double maxRandom = 0.2;
public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(0,255,0);   
  line(320,480,320,380);   
  drawBranches(320,380,80,3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle + Math.random() * maxRandom;
  double angle2 = angle - branchAngle - Math.random() * maxRandom;
  int nx1 = (int)(Math.cos(angle1) * branchLength) + x;
  int ny1 = (int)(Math.sin(angle1) * branchLength) + y;
  int nx2 = (int)(Math.cos(angle2) * branchLength) + x;
  int ny2 = (int)(Math.sin(angle2) * branchLength) + y;
  line(x, y, nx1, ny1);
  line(x, y, nx2, ny2);
  if(branchLength > smallestBranch){
    drawBranches(nx1, ny1, branchLength * fractionLength, angle1);
    drawBranches(nx2, ny2, branchLength * fractionLength, angle2);
  }
}
void mousePressed(){
  redraw();
}
