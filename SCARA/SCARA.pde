import processing.serial.Serial; // serial library
import controlP5.*; // controlP5 library
Serial serial;
ControlP5  cp5;
InverseKinematic ik1;

int CO=720; //corel

PFont font[]=new PFont[50];

Chart current_chart, respon_chart;
color yellow_ = color(200, 200, 20), green_ = color(46, 209, 2), red_ = color(120, 30, 30), blue_ = color (0, 102, 200);
color white_ = color(255, 255, 255), black_ = color(0, 0, 0), pink_ = color(255, 0, 255);

//UART Variable
int serial_conect = 0;
int commListMax;
int[] data = null;

Textlabel txtlblWhichcom; 
ListBox commListbox;
ListBox portlist;

// coded by Eberhard Rensch
// Truncates a long port name for better (readable) display in the GUI
String shortifyPortName(String portName, int maxlen)  
{
  String shortName = portName;
  if (shortName.startsWith("/dev/")) shortName = shortName.substring(5);  
  if (shortName.startsWith("tty.")) shortName = shortName.substring(4); // get rid off leading tty. part of device name
  if (portName.length()>maxlen) shortName = shortName.substring(0, (maxlen-1)/2) + "~" +shortName.substring(shortName.length()-(maxlen-(maxlen-1)/2));
  if (shortName.startsWith("cu.")) shortName = "";// only collect the corresponding tty. devices
  return shortName;
}


////// CONTROL////////
int ReadID; //read id for the controlp5
int i=0; //id

//image
PImage bg, cmode, cmode1, cmode2, mmode, mmode1, mmode2, mmode3, ikmode, ikmode2, ikmode3, pidmode;
PImage dis_m1s1, dis_m2s2, dis_m3s1, dis_m3s2, dis_m4;
//radiobutton  rgb
RadioButton RadioButton;

//SUB-MODE//
int MainMode=0;//Main Mode

int SubMode1=0;
int SubMode2=0;
int SubMode3=0;
int SubMode4=0;

//value slider 
int slider_shoulder, slider_elbow, slider_wirst;

//Text Mode Manual
int text_shoulder=90;
int text_elbow=90;
int text_wirst=180;
int value_shoulder_text, value_elbow_text, value_wirst_text;

//Remote for Mode Manual
int remote_keyboard;

//Value for the Text Mode
int value_shoulder, value_elbow, value_wirst;
int value_posX, value_posY;

int value_setpoint;
float value_KP, value_KI, value_KD;

//Color Detector
int _chose_color=0;
int chose_color_go=0;
int color_counter=0;
int _color_counter[]= new int[5];

int hide_rgb;
color color_chosen[]=new color[5];
int max_rgb;

PShape  rgb_ellipse []= new PShape[5];


void setup()
{
  size(1280, 720, OPENGL);      //ukuran window

  bg=loadImage("bg.png"); //backgorund

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

  cp5 = new ControlP5(this);
  //  ik1 = new InverseKinematic(ps, pe);  
  for (int a=0; a<50; a++) {
    font[a] = createFont("verdana", a, false);
  }

  GUI_setup();
  setup_UART();
  sobj();
}


void draw()

{
  background(bg); 
  contorlTab();
  _text();
  Send_To_Arduino();
  println(mouseX, mouseY);
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

  value_posX= int(_text_posX);
}

public void text_posY(String _text_posY) {

  value_posY= int(_text_posY);
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

