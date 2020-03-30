PShape base, shoulder, elbow, sodokan, wirst, Pneumatic, capit, capit2;
int y, x, z, x1, x2, x3, z2, v1, v2, v3, v4, v5, v6, xa, xb, xc, xbs, va1, va2, va3;
int ifs, ife, ifw, ip1, ip2;
float mfs, mfe, mfw;



int gs, ge, gw;
int as, ae, aw, ap1, ap2;

void SETobj() {

  base=loadShape("base.obj");
  shoulder=loadShape("shoulder.obj");
  Pneumatic=loadShape("Pneumatic.obj");
  elbow=loadShape("elbow.obj");
  sodokan=loadShape("sodokan.obj");
  wirst=loadShape("wirst.obj");
  capit=loadShape("capit.obj");
  capit2=loadShape("capit2.obj");
}
 float o1, o2, o3, o4, o5;
void objGO() {
 
  
  
//  o1=map(fs, 0, 180, -90, 90);
//  o2=map(fe, 0, 180, -90, 90);
//  o3=map(fw, 0, 180, -180, 180);
//  o4=map(v4, 0, 1, 0, 4);
//  o5=map(v5, 0, 1, 110, 170);
//obj1();
obj2();
}

  void obj1(){
  pushMatrix();
  translate(width/2-75, height/2);
  pushMatrix();
  scale(8);
  translate(2, 0, 0);
  rotateX(radians(360)); 
  rotateY(radians(90)); //jangan diubah
  rotateZ(radians(90)); 
  shape(base);


  pushMatrix();
  translate(15, 24, 7);
  rotateY(radians(o1)); 
  translate(-7, 4, 0);
  //rotateX(radians(x));
  //  rotateY(radians(v1)); 
  shape(shoulder);

  pushMatrix();
  translate(-7, 0.7, 0);
  rotateY(radians(o2));
  rotateY(radians(0));
  //rotateX(radians(xc)); 
  translate(-5, 0, 0);

  rotateY(radians(180));
  shape(elbow);



  pushMatrix();
  translate(4, 3, 0);
  rotateX(radians(0)); 
  rotateY(radians(0)); //jangan diubah
  rotateZ(radians(0)); 
  shape(Pneumatic);


  pushMatrix();
  translate(0, o4, 0);
  rotateX(radians(0)); 
  rotateY(radians(0)); //jangan diubah
  rotateZ(radians(0)); 
  shape(sodokan);


  pushMatrix();
  scale(0.05);
  translate(10, -245, 0);
  rotateX(radians(270)); 
  rotateY(radians(0)); //jangan diubah
  rotateZ(radians(o3)); 
  shape(wirst);


  pushMatrix();
  scale(25);
  translate(0, 0, -2);
  rotateX(radians(0)); 
  rotateY(radians(90-o5)); //jangan diubah
  rotateZ(radians(0)); 
  shape(capit);
  popMatrix();

  pushMatrix();
  scale(25);
  translate(0, 0.4, -2);
  rotateZ(radians(180)); 
  rotateY(radians(450-o5)); //jangan diubah
  shape(capit2);

  
  

  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  }
  void obj2(){

  pushMatrix();
  translate(860, 589, -227);
  rotateX(radians(90)); 
  rotateY(radians(0)); //jangan diubah
  rotateZ(radians(-90)); 

  pushMatrix();
  scale(12);
  translate(-20, 25, 0);
  rotateX(radians(360)); 
  rotateY(radians(90)); //jangan diubah
  rotateZ(radians(90)); 
  shape(base);

  //
  pushMatrix();
  translate(15, 24, 7);
  rotateY(radians(o1)); 
  translate(-7, 4, 0);
  //rotateX(radians(x));
  //  rotateY(radians(v1)); 
  shape(shoulder);

  pushMatrix();
  translate(-7, 0.7, 0);
  rotateY(radians(o2));
  rotateY(radians(0));
  //rotateX(radians(xc)); 
  translate(-5, 0, 0);

  rotateY(radians(180));
  shape(elbow);


  pushMatrix();
  translate(4, 3, 0);
  rotateX(radians(0)); 
  rotateY(radians(0)); //jangan diubah
  rotateZ(radians(0)); 
  shape(Pneumatic);


  pushMatrix();
  translate(0, o4, 0); 
  rotateX(radians(0)); 
  rotateY(radians(0)); //jangan diubah
  rotateZ(radians(0)); 
  shape(sodokan);

  pushMatrix();
  scale(0.05);
  translate(10, -245, 0);
  rotateX(radians(270)); 
  rotateY(radians(0)); //jangan diubah
  rotateZ(radians(o3)); 
  shape(wirst);

  pushMatrix();
  scale(25);
  translate(0, 0, -2);
  rotateX(radians(0)); 
  rotateY(radians(90-o5)); //jangan diubah
  rotateZ(radians(0)); 
  shape(capit);
  popMatrix();

  pushMatrix();
  scale(25);
  translate(0, 0.4, -2);
  rotateZ(radians(180)); 
  rotateY(radians(450-o5)); //jangan diubah
  shape(capit2);

  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
}
