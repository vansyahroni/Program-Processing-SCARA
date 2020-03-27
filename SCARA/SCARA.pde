import processing.serial.Serial; // serial library
import controlP5.*; // controlP5 library
Serial serial;
ControlP5  cp5;

int serial_conect = 0;
int commListMax;
int[] data = null;

Textlabel txtlblWhichcom; 
ListBox commListbox;
ListBox portlist;

//--------------------- BACKGROUND ---------------------\\
PImage bg; //background
PImage cmode, cmode1, cmode2, mmode, mmode1, mmode2, mmode3, ikmode, ikmode2, ikmode3, pidmode; //control
PImage dis_m1s1, dis_m2s2, dis_m3s1, dis_m3s2, dis_m4; //display


void setup()
{
  SETimg();

  size(1280, 720, OPENGL);      //ukuran window
  cp5 = new ControlP5(this);    //controlp5



  setup_UART();
}


void draw()

{
  background(bg); 
  SendToArduino();
}
