import processing.serial.Serial; // serial library
import controlP5.*; // controlP5 library
import processing.video.*;

Serial serial;
ControlP5  cp5;

//--------------------- comlist uart ---------------------\\
int serial_conect = 0;
int commListMax;
int[] data = null;

Textlabel txtlblWhichcom; 
ListBox commListbox;
ListBox portlist;

//--------------------- control gui ---------------------\\
int ReadID=0;
int CO=720;//from corel

//SUB-MODE//
int MainMode=0;//Main Mode
int SubMode=0;
int SubMode1=0;
int SubMode2=0;
int SubMode3=0;
int SubMode4=0;

//radiobutton for mode 1
RadioButton RadioButton;

//value slider 
int slider_shoulder, slider_elbow, slider_wirst;

//Text Mode Manual
int text_shoulder=90;
int text_elbow=90;
int text_wirst=180;

int text_posX=0;
int text_posY=90;

int value_shoulder_text, value_elbow_text, value_wirst_text;
int value_posX_text, value_posY_text;

//Manual keyboard/remote
int remote_keyboard;

//single color
int yes_no_M1S1=0;
int _chose_color=0;
int chose_color_go=0;
int color_counter=0;
int _color_counter[]= new int[5];
int hide_rgb=0;

//Single Color
color target_color[]=new color[6];
color target_single_color_fix;
String _target_single_color[]=new String [7];
int _rgb;
int rgb=0;
//set pid
int start_pid=0;
String joint_pid[]=new String[3];

//multi color

String MultiColor[]= new String [6];
String _MultiColor="";
String MultiColorAction="";
color ColorMultiColor[]=new color[5];
color ColorMultiColor2[]=new color[5];
color _ColorMultiColor;
int multicolorhide1=0;
int multicolorhide2=0;
int multicolorhide3=0;
int multicolorhide4=0;
int multicolorhide5=0;

//--------------------- main data ---------------------\\
int value_shoulder, value_elbow, value_wirst;
int value_posX, value_posY;
int value_setpoint;
float value_KP, value_KI, value_KD;

//Mode
String TextMode[]=new String[5];

//camera
Capture cam;

void setup()
{
   
  SETimg();
  SETfont();
  SETcolor();
  SETcamera();
  size(1280, 720, OPENGL);      //ukuran window
  cp5 = new ControlP5(this);    //controlp5
  string_setup();
  SETcontrol();
  setup_UART();
  
}


void draw()

{
  background(bg); 
  contorlTab();
SETcam();
  SendToArduino();
  
}


//RADIO BUTTON RGB
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

public void text_shoulder(String _text_shoulder) {

  value_shoulder_text= int(_text_shoulder);
}
public void text_elbow(String _text_elbow) {

  value_elbow_text= int(_text_elbow);
}

public void text_wirst(String _text_wirst) {

  value_wirst_text= int(_text_wirst);
}

public void text_posX(String _text_posX) {

  value_posX_text= int(_text_posX);
}

public void text_posY(String _text_posY) {

  value_posY_text= int(_text_posY);
}


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
