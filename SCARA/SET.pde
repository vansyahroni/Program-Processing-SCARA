//--------------------- BACKGROUND ---------------------\\
PImage bg, bg2; //background
PImage dis_m1s1, dis_m2s2, dis_m3s1, dis_m3s2, dis_m4; //display

//--------------------- FONT ---------------------\\
PFont f2, f4, f6, f8, f10, f12, f13, f14, f15, f16, f17, f18, f19, f20, f25, f30, f40, f50;
 
 //void SETcolor(){
 
 //  c_krem=(#F0F6DC); //krem backgorund
 //c_hijau_dasar=(#53666A); //hijau tua
 //c_hijau_sedang=(#80A2A3); //hijau sedang
 //c_hijau_terang=(#BDDBDB); //hijau muda
 //c_merah=(#F75C57); //merah
  
 //}
 
void SETstring() {
  m4_joint[0]="SHOULDER";
  m4_joint[1]="ELBOW";
  m4_joint[2]="WIRST";

  m1s1_s_target[0]="THE RED COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  m1s1_s_target[1]="THE GREEN COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  m1s1_s_target[2]="THE BLUE COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  m1s1_s_target[3]="THE YELLOW COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  m1s1_s_target[4]="THE BLACK COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  m1s1_s_target[5]="PLEASE CHOSE THE COLOR";
  m1s1_s_target[6]="PLEASE WAIT FOR 5 SECOND";
  
  m1s1_c_target[0]=c_merah;
  m1s1_c_target[1]=c_GREEN;
  m1s1_c_target[2]=c_BLUE;
  m1s1_c_target[3]=c_YELLOW;
  m1s1_c_target[4]=c_hitam;
  m1s1_c_target[5]=c_hijau_dasar;
  
  for (int a=0; a<=4; a++) {
    m1s2_c_target1[a]=c_hijau_dasar;
  }
  for (int a=0; a<=4; a++) {
    m1s2_c_target2[a]=c_hijau_terang;
  }

  m1s2_s_target[0]= "SET FIRST COLOR";
  m1s2_s_target[1]= "SET SECOND COLOR";
  m1s2_s_target[2]= "SET THIRD COLOR";
  m1s2_s_target[3]= "SET FOURTH COLOR";
  m1s2_s_target[4]= "SET LAST COLOR";
  m1s2_s_target[5]= "ok";



  for (int a=0; a<=4; a++) {
    m1s2_c_off[a]=0;
  }
}

void SETimg() {

  bg=loadImage("bg.png"); 
    bg2=loadImage("bg2.png"); 
  
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
