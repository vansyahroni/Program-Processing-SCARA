import processing.serial.Serial; // serial library
import controlP5.*; // controlP5 library
Serial serial;
ControlP5  cp5;

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



void setup()
{
  size(1280, 720, OPENGL);      //ukuran window
 cp5 = new ControlP5(this);
  setup_UART();

}


void draw()

{
  background(255); 
  
  Send_To_Arduino();

}
