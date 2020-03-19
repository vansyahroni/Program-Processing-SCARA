import processing.serial.Serial; // serial library
import controlP5.*; // controlP5 library
Serial serial;
ControlP5  cp5;
InverseKinematic ik1;

int CO=720;
PFont fontUGM, font9, font10, font12, font14, font18, font20, font25, font30, font35;


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

//background
PImage bg;

//controlp5
int i=0; //setid

//radiobutton  rgb
RadioButton RadioButton;

//tab

int tab=0;
int _tab=0;
void setup()
{
  size(1280, 720, OPENGL);      //ukuran window
  
  bg=loadImage("bg.png"); //backgorund
  
  cp5 = new ControlP5(this);
//  ik1 = new InverseKinematic(ps, pe);  

  font9 = createFont("verdana", 9, false);
  font10 = createFont("verdana", 10, false);
  font12 = createFont("verdana", 12, false);
  font14 = createFont("verdana", 14, false);
  font18 = createFont("verdana", 18, false);
  font20 = createFont("verdana", 20, false);
  font25 = createFont("verdana", 25, false);
  font30 = createFont("verdana", 30, false);
  font35 = createFont("verdana", 35, false);

  GUI_setup();
  setup_UART();
  sobj();
}


void draw()

{
    background(255); 
      if (tab==1) //TAB MAIN 
  {
  cp5.getController("no").moveTo("default");
    cp5.getController("yes").moveTo("default");
      cp5.getController("color_mode").moveTo("default");
    cp5.getGroup("rgb").moveTo("default");
  }
    
    if (tab!=1) //TAB MAIN 
  {
    cp5.getController("color_mode").moveTo("Mode2");
  cp5.getController("no").moveTo("Mode2");
    cp5.getController("yes").moveTo("Mode2");
      
    cp5.getGroup("rgb").moveTo("Mode2");
  }
  if (tab==1 &&_tab==1) //TAB CHART
  {
cp5.getController("color_mode").moveTo("default");
  cp5.getController("no").moveTo("default");
    cp5.getController("yes").moveTo("default");
    cp5.getGroup("rgb").moveTo("default");
  }
  
   if (tab==1 &&_tab==2) //TAB CHART
  {
cp5.getController("color_mode").moveTo("default");
   cp5.getController("no").moveTo("Mode2");
    cp5.getController("yes").moveTo("Mode2");
    cp5.getGroup("rgb").moveTo("Mode2");
    
  }
  
   



    _text();
  Send_To_Arduino();
    

}

//RADIO BUTTON RGB
void keyPressed() {
  switch(key) {
    case('0'): RadioButton.deactivateAll(); break;
    case('1'): RadioButton.activate(0); break;
    case('2'): RadioButton.activate(1); break;
    case('3'): RadioButton.activate(2); break;
    case('4'): RadioButton.activate(3); break;
    case('5'): RadioButton.activate(4); break;
  }
  
}
int yes_no;
public void yes() {
   yes_no = 1;
   rgb=6;
}

public void no() {
  yes_no = 2;
    rgb=6;
}


