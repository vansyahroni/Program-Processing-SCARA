//--------------------- BACKGROUND ---------------------\\
PImage bg; //background
PImage cmode, cmode1, cmode2, mmode, mmode1, mmode2, mmode3, ikmode, ikmode2, ikmode3, pidmode; //control
PImage dis_m1s1, dis_m2s2, dis_m3s1, dis_m3s2, dis_m4; //display

//--------------------- FONT ---------------------\\
PFont f2, f4, f6, f8, f10, f12, f13, f14, f15, f16, f17, f18, f19, f20, f25, f30, f40, f50;

//--------------------- COLOR ---------------------\\
color c1, c2, c3,c4,c5;


void SETimg() {

  bg=loadImage("bg.png"); 
  
  cmode=loadImage("cmode.png");
  cmode1=loadImage("cmode1.png");
  cmode2=loadImage("cmode2.png");
  mmode=loadImage("mmode.png");
  mmode1=loadImage("mmode1.png");
  mmode2=loadImage("mmode2.png");
  mmode3=loadImage("mmode3.png");
  ikmode=loadImage("ikmode.png");
  ikmode2=loadImage("ikmode2.png");
  ikmode3=loadImage("ikmode3.png");
  pidmode=loadImage("pidmode.png");
  
  dis_m1s1=loadImage("dis_m1s1.png");
  dis_m2s2=loadImage("dis_m2s2.png");
  dis_m3s1=loadImage("dis_m3s1.png");
  dis_m3s2=loadImage("dis_m3s2.png");
  dis_m4=loadImage("dis_m4.png");
  
}

void SETfont() {
  f2 = createFont("arial", 2, false);
  f4 = createFont("arial", 4, false);
  f6 = createFont("arial", 6, false);
  f8 = createFont("arial", 8, false);
  f10 = createFont("arial", 10, false);
  f12 = createFont("arial", 12, false);
  f13 = createFont("arial", 13, false);
  f14 = createFont("arial", 14, false);
  f15 = createFont("arial", 15, false);
  f16 = createFont("arial", 16, false);
  f17 = createFont("arial", 17, false);
  f18 = createFont("arial", 18, false);
  f19 = createFont("arial", 19, false);
  f20 = createFont("arial", 20, false);
  f25 = createFont("arial", 25, false);
  f30= createFont("arial", 30, false);
  f40 = createFont("arial", 40, false);
  f50 = createFont("arial", 50, false);
}

void SETcolor()
{
 c1=(#F0F6DC); //krem backgorund
 c2=(#53666A); //hijau tua
 c3=(#80A2A3); //hijau sedang
 c4=(#BDDBDB); //hijau muda
 c5=(#F75C57); //merah

}

void SETcamera(){
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, 640,480,30);
    cam.start();     
  }
}
