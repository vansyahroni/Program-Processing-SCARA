import processing.serial.Serial; // serial library
import controlP5.*; // controlP5 library

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
color target_color[]=new color[5];
color target_single_color_fix;
String _target_single_color[]=new String [7];
int _rgb;

//set pid
int _stop_pid=0;
String joint_pid[]=new String[3];

//--------------------- main data ---------------------\\
int value_shoulder, value_elbow, value_wirst;
int value_posX, value_posY;
int value_setpoint;
float value_KP, value_KI, value_KD;

void setup()
{
  SETimg();
  SETfont();
  SETcolor();
  
  size(1280, 720, OPENGL);      //ukuran window
  cp5 = new ControlP5(this);    //controlp5
  
  SETcontrol();
  setup_UART();
  
}


void draw()

{
  background(bg); 
  contorlTab();
  SETdisplay();
  SendToArduino();
  
}
