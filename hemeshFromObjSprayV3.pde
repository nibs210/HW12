import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;


HE_Mesh mesh;
WB_AABBTree tree;
WB_Render render;
HEM_MultiSlice modifier;
WB_Ray randomRay;
boolean growing;

float r;
float y = 0.0;
float easing = 0.05; // Numbers 0.0 to 1.0


void setup() 
{
  size(1400, 1000, P3D);
  mesh = new HEC_FromOBJFile(sketchPath("tesla.obj")).create();
  //smooth(8);
  
   growing=true;
  render = new WB_Render( this );
}

void draw() 
{
  background(0);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  noStroke();
  translate(width/2, height/3 + 100, 10);
  rotateY(HALF_PI/3);
  scale(4.4);
   r += 0.004;
   
   float targetX = r;
  y += (targetX - y) * easing;
  
  
  rotateY(y*TWO_PI);
  //rotateY((millis()*width)*TWO_PI);
  //rotateX(mouseY*1.0f/height*TWO_PI);
   rotateX(500*1.0f/height*TWO_PI);

  render.drawFaces(mesh);
  noFill();

  stroke(100);
  strokeWeight(.1);
  //render.drawFaceNormals(mesh,0.1);
  fill(255);
  noStroke();
  render.drawFaces(mesh);
  noFill();
  stroke(0, 50);
  render.drawEdges(mesh);
  //fill(255, 0, 0);
  //stroke(255, 0, 0);
  
  tree = new WB_AABBTree(mesh, 2);
  
  if (growing) for (int i=0;i<250;i++)grow();
  if (frameCount==300) {
    mesh.subdivide(new HES_CatmullClark());
    growing=false;
  }
  
  // saveFrame("tesla-######.png");
}

void grow() {
  int spread = 10;
  randomRay=new WB_Ray(new WB_Point(0, 0, -150), new WB_Vector(random(-spread, spread), random(-spread, spread), random(-spread, spread)));
  HE_FaceIntersection fint=HET_MeshOp.getFurthestIntersection( tree, randomRay);


  if (fint!=null) {
    WB_Point point=fint.point;
    point.addMulSelf(50, randomRay.getDirection());
    HEM_TriSplit.splitFaceTri(mesh, fint.face, point);
    tree=new WB_AABBTree(mesh, 2);
  }
}

void mousePressed()
{
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  int d = day();    // Values from 1 - 31
  int mn = month();  // Values from 1 - 12
  int y = year();   // 2003, 2004, 2005, etc.
  String when = h+"-"+m+"-"+s+"_"+d+"-"+mn+"-"+y;
  HET_Export.saveToOBJ(mesh, sketchPath(), when);
}
