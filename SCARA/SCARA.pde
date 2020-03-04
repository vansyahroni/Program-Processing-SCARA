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


float fs, fe, fw, rs, re, rw, rp1, rp2;

int ps=380;
int pe=280;
float beta, gamma;
int Ibeta, Igamma;
int cb1, cb2;
float cb3;
int mosxe, mosye, mosex, mosey;

String textValue = "";
float KP;

int _KoordinatX, _KoordinatY;
int mosx, mosy;

int s=5;


//revision v1
int count_click = 0;
int[] clickX = new int[100];
int[] clickY = new int[100];

int X_rev = 50; 
int Y_rev = 120; 


int statustab=1;

int[] X_odometry = new int[5];
int[] Y_odometry = new int[5];
int[][] color_point = new int[6][3];
float[][] coordinat_input= new float[6][2];
void setup()
{
  for (int a=0; a<100; a++) {
    colorR[a] = random(255);
    colorG[a] = random(255);
    colorB[a] = random(255);
  }
  size(1374, 750, OPENGL);      //ukuran window
  image_();
   

  cp5 = new ControlP5(this);
  ik1 = new InverseKinematic(ps, pe);  

  font9 = createFont("Arial Bold", 9, false);
  font10 = createFont("Arial Bold", 10, false);
  font12 = createFont("Arial Bold", 12, false);
  font14 = createFont("Arial Bold", 14, false);
  font18 = createFont("Arial Bold", 18, false);
  font20 = createFont("Arial Bold", 20, false);
  font25 = createFont("Arial Bold", 25, false);
  font30 = createFont("Arial Bold", 30, false);
  font35 = createFont("Arial Bold", 35, false);

  GUI_setup();
  setup_UART();
  sobj();
}
float koorx=0;
float koory=90;
int cx, cy;
void mouseClicked() {
  r= sqrt(pow(mouseX-680, 2)+pow(mouseY-545, 2));

  if (r<600/2 && r > 351/2 && mouseY <545) {
    koorx=int(map(mouseX, 381, 979, -660, 660));
    koory=int(map(mouseY, 246, 546, 660, 0));
  }
 
       if ((mouseX<=X_rev+130+500-150+525) && (mouseX>=X_rev+130-150)) {
    if ((mouseY<=Y_rev+500) && (mouseY>=Y_rev)) {

      count_click+=1;
      clickX[count_click] = int((mouseX -430+150-525/2)/2.5);
      clickY[count_click] = int(-(mouseY -370-525/3)/2.5);
      cx=clickX[count_click];
      cy=clickY[count_click];
      
  }}}
int v22=0;

void draw()
{cp5.getController("RESET_KOORDINAT").moveTo("fiture");
cp5.getController("RUN").moveTo("fiture");

if (statustab==1) //TAB MAIN 
  {
    background(bg); 
    
  
  obj();
  images();
  fw();
  Send_To_Arduino();
    
    
  }
  if (statustab==2) //TAB CHART
  { 
    background(bg); //0-->Black
    
      fill(255);
      imageMode(CENTER);  
  image(judul, width/2, 45);
  
  draw_coordinat_target();
   draw_coordinat();

    fiture_();
    pushMatrix();
    translate(width/8,0,0);
//   obj1();
   popMatrix();
//      Send_To_Arduino();
  }


  //print(mouseX); print("\t"); println(mouseY);



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

void keyPressed() {
  if(keyCode==TAB) {
    cp5.getTab("fiture").bringToFront();
  }
}
