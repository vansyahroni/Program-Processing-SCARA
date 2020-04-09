import processing.serial.Serial; // serial library
import controlP5.*; // controlP5 library
import processing.video.*;

Serial serial;
ControlP5  cp5;


//--------------------- COLOR ---------------------\\
color c_krem, c_hijau_dasar, c_hijau_sedang ,c_hijau_terang ,c_merah;


color c_putih=(#FFFFFF); //putih
color c_hitam=(#332C2B);//hitam
color c_RED=(#E62129);
color c_GREEN=(#009B4C);
color c_BLUE=(#2F318B);
color c_YELLOW=(#FFF000);
color c_BLACK=c_hitam;

int CO=720;//from corel

//--------------------- COMLIST UART ---------------------\\

int serial_conect = 0;
int commListMax;
int[] data = null;

Textlabel txtlblWhichcom; 
ListBox commListbox;
ListBox portlist;

//to tab UART//

//--------------------- CONTROL GUI ---------------------\\
int ReadID=0;  //id controlp5 

//SUB-MODE//
int MainMode=0;//Main Mode
int SubMode=0;
int SubMode1=0;
int SubMode2=0;
int SubMode3=0;
int SubMode4=0;

//--------------------- MODE SINGLE COLOR  ---------------------\\
RadioButton RadioButton;

int _m1s1_rgb; //variabel radiobutton
int m1s1_rgb=0;

int m1s1_action=0;//variabel button (yes / no)

color m1s1_c_target[]=new color[6];//color it chosen
color _m1s1_c_target=c_hijau_dasar;
String m1s1_s_target[]=new String [7];

//--------------------- MODE MULTI COLOR  ---------------------\\

color _m1s2_c_target;//color it chosen
color m1s2_c_target1[]=new color[5];
color m1s2_c_target2[]=new color[5];
String m1s2_s_target[]= new String [6];
String _m1s2_s_target="";

int m1s2_c_off[]=new int[5]; //off when click a one color

int m1s2_action=0;  //start and change button
int m1s2_counter=0; //count the color it chosen
int m1s2_off=0; //off when 5 color it chosen

//--------------------- MODE MANUAL SLIDER ---------------------\\

int m2s1_shoulder=90; 
int m2s1_elbow=90; 
int m2s1_wirst=180;

//--------------------- MODE MANUAL TEXT ---------------------\\
int m2s2_shoulder=90;
int m2s2_elbow=90;
int m2s2_wirst=180;
int _m2s2_shoulder, _m2s2_elbow, _m2s2_wirst;

//--------------------- MODE MANUAL REMOTE---------------------\\
int remote_keyboard;

//--------------------- MODE INVERSE TEXT ---------------------\\

int m3s3_posX=0;
int m3s3_posY=90;
int _m3s3_posX, _m3s3_posY;


//--------------------- MODE PID ---------------------\\
int m4_start=0;
String m4_joint[]=new String[3];

//--------------------- MAIN DATA ---------------------\\
int value_shoulder, value_elbow, value_wirst;
int value_posX, value_posY;
int value_setpoint;
float value_KP, value_KI, value_KD;

//--------------------- CAMERA ---------------------\\
Capture cam;

//--------------------- GRAPH / OBJ ---------------------\\
Chart myChart;
int graph_or_obj=0;

float RotX, RotY;
int viewOBJ=0;
float _RotX, _RotY;
int translate1=0;
int translate2=0;

//--------------------- GANTI COLOR ---------------------\\
int change_background=1;
void setup()
{  SETcolor();
  size(1280, 720, OPENGL); 
SETstring();
  SETimg();
  SETfont();
  SETcamera();
  SETobj();
  SETcontrol();
  setup_UART();
}


void draw()

{ 
  cameraGO();
  controlGO();
  SendToArduino();
}

//--------------------- MODE SINGLE MODE ---------------------\\
void keyPressed() {
  switch(key) {
    case('0'): 

    RadioButton.deactivateAll(); 
    break;
    case('1'): 

    RadioButton.activate(0); 
    break;
    case('2'): 

    RadioButton.activate(1); 
    ; 
    break;
    case('3'): 

    RadioButton.activate(2); 
    break;
    case('4'): 

    RadioButton.activate(3); 
    break;
    case('5'): 

    RadioButton.activate(4); 
    break;
  }
}
//---------------------MANUAL TEXT---------------------\\

public void m2s2_shoulder(String m2s2_shoulder_s) {

  _m2s2_shoulder= int(m2s2_shoulder_s);
}
public void m2s2_elbow(String m2s2_elbow_s) {

  _m2s2_elbow= int(m2s2_elbow_s);
}

public void m2s2_wirst(String m2s2_wirst_s) {

  _m2s2_wirst= int(m2s2_wirst_s);
}

//--------------------- INVERSE TEXT ---------------------\\

public void m3s3_posX(String m3s3_posX_s) {

  _m3s3_posX= int(m3s3_posX_s);
}

public void m3s3_posY(String m3s3_posY_s) {

  _m3s3_posY= int(m3s3_posY_s);
}

//--------------------- PID TEXT ---------------------\\
public void text_setpoint(String _text_setpoint) {

  value_setpoint= int(_text_setpoint);
}
public void text_KP(String _text_KP) {

  value_KP= float(_text_KP);
}
public void text_KI(String _text_KI) {

  value_KI= float(_text_KI);
}

public void text_KD(String _text_KD) {

  value_KD= float(_text_KD);
}

//--------------------- PID TEXT ---------------------\\
void mouseDragged() {

  RotX -= (mouseX - pmouseX) *0.01;
  RotY -= (mouseY - pmouseY) *0.01;
}

void mouseClicked(){
  if(mouseX>=843 && mouseX<=914 && mouseY<=CO-682){
  change_background+=1;
  }
  if(change_background==3){
    change_background=1;
  }
  println(change_background);
}
