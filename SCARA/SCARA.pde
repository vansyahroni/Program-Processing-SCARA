import processing.serial.Serial; // serial library
import controlP5.*; // controlP5 library
Serial serial;
ControlP5 cp5;
InverseKinematic ik1;

PFont font9, font10, font12, font14, font18, font20, font25, font30, font35;


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

//backgroung
PImage bg;

void setup()
{
  size(1280, 720, OPENGL);      //ukuran window
  
  bg=loadImage("bg.png"); //backgorund
  
  cp5 = new ControlP5(this);
//  ik1 = new InverseKinematic(ps, pe);  

  font9 = createFont("FontUGM", 9, false);
  font10 = createFont("FontUGM", 10, false);
  font12 = createFont("FontUGM", 12, false);
  font14 = createFont("FontUGM", 14, false);
  font18 = createFont("FontUGM", 18, false);
  font20 = createFont("FontUGM", 20, false);
  font25 = createFont("FontUGM", 25, false);
  font30 = createFont("FontUGM", 30, false);
  font35 = createFont("FontUGM", 35, false);

  GUI_setup();
  setup_UART();
  sobj();
}


void draw()

{
    background(bg); 
  Send_To_Arduino();
    

}



