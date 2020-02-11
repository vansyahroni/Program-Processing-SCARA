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

boolean START = false;
boolean MODE = false;
boolean ik = true;
boolean P1 = false;
boolean P2 = false;

int KoordinatX, KoordinatY;
int KoordinatX_, KoordinatY_;
 
 
float fs, fe, fw;

int ps=380;
int pe=280;
float beta, gamma;
int Ibeta, Igamma;
int cb1, cb2;
float cb3;
int mosxe, mosye, mosex, mosey;

String textValue = "";
float KP;

int _KoordinatX,_KoordinatY;
int mosx, mosy;

  int s=5;
void setup()
{

  size(1374, 750, OPENGL);      //ukuran window
  image_();
  
  cp5 = new ControlP5(this);
  ik1 = new InverseKinematic(ps, pe);  

  font9 = createFont("Arial Bold", 9, false);
  font10 = createFont("Arial Bold", 10, false);
  font12 = createFont("Arial Bold", 12, false);
  font14 = createFont("Arial Bold", 12, false);
  font18 = createFont("Arial Bold", 18, false);
  font20 = createFont("Arial Bold", 20, false);
  font25 = createFont("Arial Bold", 25, false);
  font30 = createFont("Arial Bold", 30, false);
  font35 = createFont("Arial Bold", 35, false);

  GUI_setup();
  setup_UART();
  sobj();
}

void mouseClicked() {
  r= sqrt(pow(mouseX-680, 2)+pow(mouseY-545, 2));

          if (r<600/2 && r > 351/2 && mouseY <545) {
  mosxe=mouseX;
  mosye=mouseY;}
}

void draw()
{
  background(bg);

//print(mouseX); print("\t"); println(mouseY);
          

fk();
  obj();
  
  



//  fill(#4a69bd);
//  rect(7, 550, 305, 134, s, s, s, s); //Persegi slider
//  rect(width-7-305, 550, 305, 134, s, s, s, s); //Persegi slider


//  pushMatrix();
//  textFont(font14);
//  fill(0);
//  translate(0, 0, 10);
//  text("Shoulder: " + beta, 170, 630);
//  text("Elbow: " + gamma, 170, 650);
//  popMatrix();


 images();

  
  
     
  Send_To_Arduino();
}

public void setkp(String theText) {

  KP= float(theText)*100;
  
}

public void KoordinatX(String Xkoor) {

  _KoordinatX= int(Xkoor);
}
public void KoordinatY(String Ykoor) {

  _KoordinatY= int(Ykoor);
}

