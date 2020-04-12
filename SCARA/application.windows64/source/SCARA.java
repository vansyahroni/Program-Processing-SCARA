import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.Serial; 
import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SCARA extends PApplet {

 // serial library
 // controlP5 library

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
int target_color[]=new int[6];
int target_single_color_fix;
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
int ColorMultiColor[]=new int[5];
int ColorMultiColor2[]=new int[5];
int _ColorMultiColor;
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
public void setup()
{
   
  SETimg();
  SETfont();
  SETcolor();
  
        //ukuran window
  cp5 = new ControlP5(this);    //controlp5
  string_setup();
  SETcontrol();
  setup_UART();
  
}


public void draw()

{
  background(bg); 
  contorlTab();

  SendToArduino();
  
}


//RADIO BUTTON RGB
public void keyPressed() {
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

  value_shoulder_text= PApplet.parseInt(_text_shoulder);
}
public void text_elbow(String _text_elbow) {

  value_elbow_text= PApplet.parseInt(_text_elbow);
}

public void text_wirst(String _text_wirst) {

  value_wirst_text= PApplet.parseInt(_text_wirst);
}

public void text_posX(String _text_posX) {

  value_posX_text= PApplet.parseInt(_text_posX);
}

public void text_posY(String _text_posY) {

  value_posY_text= PApplet.parseInt(_text_posY);
}


public void text_setpoint(String _text_setpoint) {

  value_setpoint= PApplet.parseInt(_text_setpoint);
}
public void text_KP(String _text_KP) {

  value_KP= PApplet.parseFloat(_text_KP);
}
public void text_KI(String _text_KI) {

  value_KI= PApplet.parseFloat(_text_KI);
}

public void text_KD(String _text_KD) {

  value_KD= PApplet.parseFloat(_text_KD);
}
public void SETcontrol()
{
  
  //--------------------- main control ---------------------\\

  /*untuk pindah mode utama
   1. Mode Color Detector
   2. Mode Manual
   3. Mode Invers
   4. Mode Set PID
   */

  cp5.addButton("main_mode")  //MAIN MODE
    .setId(1)
    .setPosition(20, CO-480)
    .setSize(40, 40)
    .setColorBackground(c5)
    .setColorActive(c5) 
    .setColorForeground(c4) 
    .setLabelVisible(false) 
    .update()
    ;
  //--------------------- mode 1 ---------------------\\

  cp5.addButton("color_mode") //CONTROL SUB MODE
    .setId(11)
    .setPosition(40, CO-396)
    .setSize(43, 43)
    .setColorBackground(0xffF75C57)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xff80A2A3) 
    .setLabelVisible(false) 
    .hide()

    ;

  ////// CHOSE COLOR //////

  RadioButton= cp5.addRadioButton("M1S1_rgb") 
    .setPosition(58, CO-266)
    .setSize(28, 27)
    .setColorActive(0xff53666A)
    .setColorBackground(c3) 
    .setColorForeground(c3) 
    .setItemsPerRow(5)
    .setSpacingColumn(22)
    .addItem("red", 1)
    .addItem("green", 2)
    .addItem("blue", 3)
    .addItem("yellow", 4)
    .addItem("black", 5)
    .hideLabels() 
    .hide()
    ;


  cp5.addButton("M1S1_yes")
    .setPosition(95, CO-138)
    .setSize(35, 36)
    .setId(112)
    .setColorBackground(c3)
    .setColorActive(c5) 
    .setColorForeground(c3) 
    .setLabelVisible(false) 
 .hide()
    ;

  cp5.addButton("M1S1_no")
    .setPosition(195, CO-138)
    .setSize(35, 36)
    .setId(113)
    .setColorBackground(c3)
    .setColorActive(c5) 
    .setColorForeground(c3) 
    .setLabelVisible(false) 
     .hide()
    ;

  ////// CHOSE COLOR  2 //////

  cp5.addButton("chose_red")
    .setPosition(56, CO-263)
    .setSize(31, 22)
    .setId(121)
    .setColorBackground(c5)
    .setColorActive(c5) 
    .setColorForeground(c5) 
    .setLabelVisible(false) 
     .hide()
    ;

  cp5.addButton("chose_green")
    .setPosition(106, CO-263)
    .setSize(31, 22)
    .setId(122)
    .setColorBackground(0xff009B4C)
    .setColorActive(0xff009B4C) 
    .setColorForeground(0xff009B4C) 
    .setLabelVisible(false) 
     .hide()
    ;

  cp5.addButton("chose_blue")
    .setPosition(156, CO-263)
    .setSize(31, 22)
    .setId(123)
    .setColorBackground(0xff2F318B)
    .setColorActive(0xff2F318B) 
    .setColorForeground(0xff2F318B) 
    .setLabelVisible(false) 
     .hide()
    ;

  cp5.addButton("chose_yellow")
    .setPosition(206, CO-263)
    .setSize(31, 22)
    .setId(124)
    .setColorBackground(0xffFFF000)
    .setColorActive(0xffFFF000) 
    .setColorForeground(0xffFFF000) 
    .setLabelVisible(false) 
     .hide()
    ;

  cp5.addButton("chose_black")
    .setPosition(256, CO-263)
    .setSize(27, 22)
    .setId(125)
    .setColorBackground(0xff332C2B)
    .setColorActive(0xff332C2B) 
    .setColorForeground(0xff332C2B) 
    .setLabelVisible(false) 
     .hide()
    ;

  cp5.addButton("chose_color_start")
    .setPosition(95, CO-138)
    .setSize(35, 36)
    .setId(126)
    .setColorBackground(c3)
    .setColorActive(c5) 
    .setColorForeground(c3) 
    .setLabelVisible(false) 
     .hide()
    ;
  cp5.addButton("chose_color_change")
    .setPosition(195, CO-138)
    .setSize(35, 36)
    .setId(127)
    .setColorBackground(c3)
    .setColorActive(c5) 
    .setColorForeground(c3) 
    .setLabelVisible(false) 
     .hide()
    ;              


  //////////////////////// MDOE 2 ///////////////////////////

  cp5.addButton("manual_mode") //CONTROL SUB MODE
    .setId(12)
    .setPosition(40, CO-396)
    .setSize(43, 43)
    .setColorBackground(0xffF75C57)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xff80A2A3) 
    .setLabelVisible(false) 
    .update()
    ;

  ////// SLIDER //////

  cp5.addSlider("slider_shoulder")
    .setPosition(41, CO-307)
    .setRange(0, 180)
    .setSize(243, 27)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setColorValue(color(0, 0, 0))
    .setValue(90)
    .setLabelVisible(false) 
    ;

  cp5.addSlider("slider_elbow")
    .setPosition(41, CO-249)
    .setRange(0, 180)
    .setSize(243, 27)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setColorValue(color(0, 0, 0))
    .setValue(90)
    .setLabelVisible(false) 
    ;

  cp5.addSlider("slider_wirst")
    .setPosition(41, CO-190)
    .setRange(0, 180)
    .setSize(243, 27)
     .setLabelVisible(false) 
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setColorValue(color(0, 0, 0))
    .setValue(90)
   
    ;

  cp5.addToggle("up_down")
    .setPosition(55, CO-133)
    .setSize(94, 27)
    .setValue(true)
    .setId(214)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setMode(ControlP5.SWITCH)
    .setLabelVisible(false) 
    ;

  cp5.addToggle("gripper")
    .setPosition(177, CO-133)
    .setSize(94, 27)
    .setValue(true)
    .setId(215)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setMode(ControlP5.SWITCH)
    .setLabelVisible(false) 
    ;

  ////// TEXT //////

  cp5.addTextfield("text_shoulder")
  
    .setPosition(163, CO-307)
    .setSize(61, 27)
    .setFont(f20)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setLabelVisible(false) 
    .setFocus(true)
    .setColor(255)
     .setAutoClear(true)
     .setCaptionLabel("") 
    ;

  cp5.addTextfield("text_elbow")
    .setPosition(163, CO-249)
    .setSize(61, 27)
    .setFont(f20)
    .setLabelVisible(false) 
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setFocus(true)
    .setAutoClear(true)
    .setColor(255)
      .setCaptionLabel("") 
    ;

  cp5.addTextfield("text_wirst")
 
    .setPosition(163, CO-190)
    .setSize(61, 27)
.setLabelVisible(false) 
    .setFont(f20)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setFocus(true)
   .setAutoClear(true)
    .setColor(255)
      .setCaptionLabel("") 
    ;

  ////// REMOTE //////

  cp5.addButton("remote")
    .setPosition(55, CO-307)
    .setSize(94, 27)
    .setLabel("changeBackground")
    .setId(231)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xff80A2A3) 
    .setLabelVisible(false) 
    ;

  cp5.addButton("keyboard")
    .setPosition(177, CO-307)
    .setSize(94, 27)
    .setId(232)
    .setLabel("changeBackground")
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xff80A2A3) 
    .setLabelVisible(false) 
    ;

  cp5.addButton("M2SM3OK")
    .setPosition(116, CO-133)
    .setSize(94, 27)
    .setId(233)
    .setLabel("changeBackground")
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xff80A2A3) 
    .setLabelVisible(false) 
    ;

  //////////////////////// MDOE 3 ///////////////////////////

  cp5.addButton("ik_mode") //CONTROL SUB MODE
    .setId(13)
    .setPosition(40, CO-396)
    .setSize(43, 43)
    .setColorBackground(0xffF75C57)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xff80A2A3) 
    .setLabelVisible(false) 
    ;


  cp5.addTextfield("text_posX")
    .setPosition(163, CO-307)
    .setSize(61, 27)
    .setFont(f20)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setFocus(true)
    .setColor(255)
      .setCaptionLabel("") 
    ;

  cp5.addTextfield("text_posY")
    .setPosition(163, CO-249)
    .setSize(61, 27)
    .setFont(f20)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setFocus(true)
      .setCaptionLabel("") 
    .setColor(255)
    ;

  cp5.addButton("start_trajectory") //CONTROL SUB MODE
    .setId(321)
    .setPosition(55, CO-133)
    .setSize(94, 27)
    .setColorBackground(0xffF75C57)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xff80A2A3) 
    .setLabelVisible(false) 
    ;

  cp5.addButton("reset_trajectory") //CONTROL SUB MODE
    .setId(322)
    .setPosition(170, CO-133)
    .setSize(94, 27)
    .setColorBackground(0xffF75C57)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xff80A2A3) 
    .setLabelVisible(false) 
    ;


  cp5.addButton("jointPID")
    .setPosition(155, CO-341)
    .setSize(36, 19)
    .setId(411)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setLabelVisible(false) 
    ;  

  cp5.addTextfield("text_setpoint")
    .setPosition(155, CO-296)
    .setSize(36, 19)
    .setFont(f20)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setFocus(true)
    .setColor(255)
      .setCaptionLabel("") 
    ;

  cp5.addTextfield("text_KP")
    .setPosition(155, CO-254)
    .setSize(36, 19)
    .setFont(f20)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setFocus(true)
    .setColor(255)
      .setCaptionLabel("") 
    ;

  cp5.addTextfield("text_KI")
    .setPosition(155, CO-209)
    .setSize(36, 19)
    .setFont(f20)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setFocus(true)
    .setColor(255)
      .setCaptionLabel("") 
    ;

  cp5.addTextfield("text_KD")
    .setPosition(155, CO-164)
    .setSize(36, 19)
    .setFont(f20)
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xffF75C57) 
    .setFocus(true)
    .setColor(255)
      .setCaptionLabel("") 
    ;


  cp5.addButton("start_pid")
    .setPosition(98, CO-106)
    .setSize(27, 27)
    .setId(421)
    .setLabel("changeBackground")
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xff80A2A3) 
    .setLabelVisible(false) 
    ;


  cp5.addButton("stop_pid")
    .setPosition(149, CO-106)
    .setSize(27, 27)
    .setId(422)
    .setLabel("changeBackground")
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xff80A2A3) 
    .setLabelVisible(false) 
    ;


  cp5.addButton("reset_pid")
    .setPosition(201, CO-106)
    .setSize(27, 27)
    .setId(423)
    .setLabel("changeBackground")
    .setColorBackground(0xff80A2A3)
    .setColorActive(0xffF75C57) 
    .setColorForeground(0xff80A2A3) 
    .setLabelVisible(false) 
    ;
    
     MainMode=0;
   
   
}
public void string_setup() {


  joint_pid[0]="SHOULDER";
  joint_pid[1]="ELBOW";
  joint_pid[2]="WIRST";

  _target_single_color[0]="THE RED COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  _target_single_color[1]="THE GREEN COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  _target_single_color[2]="THE BLUE COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  _target_single_color[3]="THE YELLOW COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  _target_single_color[4]="THE BLACK COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  _target_single_color[5]="PLEASE CHOSE THE COLOR";
  _target_single_color[6]="PLEASE WAIT FOR 5 SECOND";

  for (int a=0; a<=4; a++) {
    ColorMultiColor[a]=0xff53666A;
  }
  for (int a=0; a<=4; a++) {
    ColorMultiColor2[a]=0xffBDDBDB;
  }

  MultiColor[0]= "SET FIRST COLOR";
  MultiColor[1]= "SET SECOND COLOR";
  MultiColor[2]= "SET THIRD COLOR";
  MultiColor[3]= "SET FOURTH COLOR";
  MultiColor[4]= "SET LAST COLOR";
  MultiColor[5]= "ok";

  target_color[0]=0xffF75C57;
  target_color[1]=0xff009B4C;
  target_color[2]=0xff2F318B;
  target_color[3]=0xffFFF000;
  target_color[4]=0xff332C2B;
  target_color[5]=0xff53666A;
}



public void contorlTab() {
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  textFont(f16);
  noStroke();
  fill(0);

  ////////////////////////// COLOR DETECTOR /////////////////////////


  if (MainMode==1 )
  { 
    fill(0);
    text("MODE COLOR DETECTOR", 187, CO-390);

    if (SubMode1==0) {
      text("SELECT MODE", 188, CO-369);
    }

    if (SubMode1==1 | SubMode1==2) {
      cp5.getController("manual_mode").hide();

      pushMatrix();
      translate(0, 0, 1);
      fill(0xffF75C57);
      ellipse(72, CO-252, 40, 40);
      fill(0xff009B4C);
      ellipse(122, CO-252, 40, 40);
      fill(0xff2F318B);
      ellipse(172, CO-252, 40, 40);
      fill(0xffFFF000);
      ellipse(222, CO-252, 40, 40);
      fill(0xff332C2B);
      ellipse(272, CO-252, 40, 40);
      fill(0);
      popMatrix();
    }

    hideMode2A();
    hideMode2B();
    hideMode2C();
    hideMode3A();
    hideMode3B();
    hideMode3C();
    hideMode4();
    if (yes_no_M1S1==1 | chose_color_go==1) {  
      cp5.getController("color_mode").hide();
    } else {
      cp5.getController("color_mode").show();
    }


    if (SubMode1==1) //SINGLE COLOR
    {   
      text("SINGLE COLOR", 188, CO-369);    

      text("YES", 113, 634);
      text("NO", 213, 634);
      text("SET COLOR", 175, CO-313);  

      image(dis_m1s1, 1115, CO-307);
      cp5.getController("color_mode").show();
      cp5.getController("M1S1_no").show();
      cp5.getController("M1S1_yes").show();
      hideMode1B();

      if (yes_no_M1S1==1) {
        cp5.getGroup("M1S1_rgb").hide();
      } else 
      cp5.getGroup("M1S1_rgb").show();

      textFont(f15);


      _rgb=rgb;
      if (rgb>=6) {
        _rgb=5;
      }

      if (rgb>0) {

        for (int a=0; a<=rgb; a++) {

          if (rgb==a  ) { 
            yes_no_M1S1=0;
            text(_target_single_color[a-1], 175, CO-188);
          }
        }
      }
      if (yes_no_M1S1==1 ) {//yes

        text("PLEASE WAIT FOR 5 SECOND", 175, CO-188);
      }



      if (yes_no_M1S1==2) {//no
        text("PLEASE CHOSE THE COLOR", 175, CO-188);
      }



      for (int b=1; b<=_rgb; b++) {
        if (_rgb==b) {
          target_single_color_fix=target_color[b-1];
        }
      }
      if (yes_no_M1S1==2) {
        _rgb=5;
        target_single_color_fix=0xff53666A;
      }



      //DISPLAY//

      fill(target_single_color_fix);            //color targer
      textFont(f18);
      ellipse(1180, CO-473, 20, 20);          //target
      fill(255);                       
      textFont(f16);
      text("5", 1180, CO-429);              //Jumlah target
      textAlign(LEFT, CENTER);
      text("1.", 1087, CO-356);//nomor setiap target
      text("(10,20)", 1103, CO-355);//urutan target
      textAlign(CENTER, CENTER);
      text("(10,20)", 1121, CO-222);//next target

      fill(target_single_color_fix);
      ellipse(1001, CO-165, 20, 20);   //SISA 
      ellipse(1023, CO-165, 20, 20);   //SISA 

      ellipse(1141, CO-165, 20, 20);   //TERAMBIL 
      ellipse(1163, CO-165, 20, 20);   //TERAMBIL 
      fill(255);   
      text("01:34:29", 1122, 624);//Time
    }

    if (SubMode1==2) //MULTI COLOR
    { 
      text("MULTI COLOR", 188, CO-369); 
      text("START", 113, CO-88);
      text("CHANGE", 213, CO-88);


      text("SELECTED COLOR", 175, CO-205);

      image(dis_m1s1, 1115, CO-307);
      cp5.getController("color_mode").show();
      hideMode1A();


      cp5.getController("chose_color_start").show();
      cp5.getController("chose_color_change").show();

      if (multicolorhide1==1) {
        cp5.getController("chose_red").hide();
      }
      if (multicolorhide2==1) {
        cp5.getController("chose_green").hide();
      }
      if (multicolorhide3==1) {
        cp5.getController("chose_blue").hide();
      }
      if (multicolorhide4==1) {
        cp5.getController("chose_yellow").hide();
      }
      if (multicolorhide5==1) {
        cp5.getController("chose_black").hide();
      }

      if (hide_rgb==1 |  chose_color_go==1) {
        cp5.getController("chose_red").hide();

        cp5.getController("chose_green").hide();
        cp5.getController("chose_blue").hide();
        cp5.getController("chose_yellow").hide();
        cp5.getController("chose_black").hide();
      }

      if (hide_rgb==1 |  chose_color_go==1 | multicolorhide1==0 | multicolorhide2==0 | multicolorhide3==0 | multicolorhide4==0 | multicolorhide5==0)
      {
        cp5.getController("chose_red").show();
        cp5.getController("chose_green").show();
        cp5.getController("chose_blue").show();
        cp5.getController("chose_yellow").show();
        cp5.getController("chose_black").show();
      }


      for (int a=0; a<=color_counter; a++) {

        if (color_counter==a) { 
          text(MultiColor[a], 175, CO-313);
        }
      }

      if (chose_color_go==1 )text("PLEASE WAIT FOR 5 SECOND", 175, CO-313);  
      if (chose_color_go==2)text("PLEASE CHOSE THE COLOR", 175, CO-313);  

      //DISPLAY//

      fill(ColorMultiColor[0]);                       //color targer
      ellipse(1114, CO-473, 20, 20);          //target 1
      fill(ColorMultiColor[1]);
      ellipse(1144, CO-473, 20, 20);          //target 2
      fill(ColorMultiColor[2]);
      ellipse(1174, CO-473, 20, 20);          //target 2
      fill(ColorMultiColor[3]);
      ellipse(1204, CO-473, 20, 20);          //target 2
      fill(ColorMultiColor[4]);
      ellipse(1234, CO-473, 20, 20);          //target 2

      fill(ColorMultiColor2[0]);                       //color targer
      ellipse(75, CO-165, 40, 40);          //target 1
      fill(ColorMultiColor2[1]);
      ellipse(125, CO-165, 40, 40);          //target 2
      fill(ColorMultiColor2[2]);
      ellipse(175, CO-165, 40, 40);          //target 2
      fill(ColorMultiColor2[3]);
      ellipse(225, CO-165, 40, 40);          //target 2
      fill(ColorMultiColor2[4]);
      ellipse(275, CO-165, 40, 40);          //target 2




      fill(255);
      textFont(f18);
      text("5", 1114, CO-429);              //Jumlah target 1
      text("5", 1144, CO-429);              //Jumlah target 2
      textFont(f16);
      textAlign(RIGHT, CENTER);
      text("1.", 995, CO-356);//nomor urutan setiap target sisi kiri
      textAlign(LEFT, CENTER);
      text("(10,20)", 1004, CO-355);//urutan setiap target sisi kiri
      textAlign(RIGHT, CENTER);
      text("1.", 1089, CO-356);//nomor urutan setiap target sisi tengah
      textAlign(LEFT, CENTER);
      text("(10,20)", 1097, CO-355);//urutan setiap target sisi tengah
      textAlign(RIGHT, CENTER);
      text("1.", 1182, CO-356);//nomor urutan setiap target sisi kanan
      textAlign(LEFT, CENTER);
      text("(10,20)", 1190, CO-355);//urutan setiap target sisi kanan

      textAlign(CENTER, CENTER);
      fill(255, 255, 0);//next target
      ellipse(1090, CO-223, 20, 20);   //next target 
      fill(255);
      text("(10,20)", 1140, CO-222);//next target

      fill(255);
      ellipse(1001, CO-165, 20, 20);   //SISA Warna 1
      fill(255, 255, 0);
      ellipse(1023, CO-165, 20, 20);   //SISA Warna 2
      fill(0);
      text("5", 1001, CO-165);//Jumlah Sisa Warna 1
      text("5", 1023, CO-165);//Jumlah Sisa Warna 2
      fill(0, 255, 0);
      ellipse(1141, CO-165, 20, 20);   //TERAMBIL 
      fill(0, 255, 255);
      ellipse(1163, CO-165, 20, 20);   //TERAMBIL 
      fill(0);
      text("5", 1141, CO-165);//Jumlah Terambil Warna 1
      text("5", 1163, CO-165);//Jumlah Terambil Warna 2
      fill(255);
      text("01:34:29", 1122, 624);//Time
    }
  }



  ////////////////////////// MANUAL /////////////////////////

  if (MainMode==2) 
  {     
    fill(0);
    text("MODE MANUAL", 187, CO-390);
    if (SubMode2==0) {
      text("SELECT MODE", 188, CO-369);
    }
    image(dis_m2s2, 1115, CO-307);
    cp5.getController("color_mode").hide();


    hideMode1A();
    hideMode1B();
    hideMode3A();
    hideMode3B();
    hideMode3C();
    hideMode4();
    cp5.getController("manual_mode").show();




    if (SubMode2==1) //SLIDER
    { 
      text("MANUAL SLIDER", 188, CO-369);   
      text("SHOULDER", 163, CO-319);
      text("ELBOW", 163, CO-261);
      text("WIRST", 163, CO-202);
      text("UP/DOWN", 102, CO-145);
      text("GRIPPER", 223, CO-145);


      cp5.getController("manual_mode").show();
      hideMode2B();
      hideMode2C();

      cp5.getController("slider_shoulder").show();
      cp5.getController("slider_elbow").show();
      cp5.getController("slider_wirst").show();
      cp5.getController("up_down").show();
      cp5.getController("gripper").show();

      //data//
      value_shoulder=slider_shoulder;
      value_elbow=slider_elbow;
      value_wirst=slider_wirst;
    }

    if (SubMode2==2) //TEXT
    {
      text("INPUT TEXT", 188, CO-369);   
      textAlign(LEFT, CENTER);
      text("SHOULDER", 40, CO-294);
      text("ELBOW", 40, CO-235);
      text("WIRST", 40, CO-177);
      textAlign(CENTER, CENTER);
      text("UP/DOWN", 102, CO-145);
      text("GRIPPER", 223, CO-145);
      stroke(10);
      line(246, CO-280, 299, CO-280);
      line(246, CO-222, 299, CO-222);
      line(246, CO-163, 299, CO-163);
      noStroke();



      //image(mmode2, 163, CO-237);

      cp5.getController("manual_mode").show();
      hideMode2A();
      hideMode2C();

      cp5.getController("text_shoulder").show();
      cp5.getController("text_elbow").show();
      cp5.getController("text_wirst").show();
      cp5.getController("up_down").show();
      cp5.getController("gripper").show();

      //data//
      value_shoulder=value_shoulder_text;
      value_elbow=value_elbow_text;
      value_wirst=value_wirst_text;

      text(value_shoulder_text, 270, CO-294);
      text(value_elbow_text, 270, CO-235);
      text(value_wirst_text, 270, CO-177);
    }

    if (SubMode2==3) //REMOTE

    {

      text("MANUAL EQUIPMENT", 188, CO-369);   

      text("REMOTE", 102, CO-319);
      text("KEYBOARD", 223, CO-319);
      text("OK", 163, CO-145);

      if (remote_keyboard==1) {
        text("PLEASE USE REMOTE\n FOR CONTROL ROBOT", 162, CO-227);
      }
      if (remote_keyboard==2) {
        text("PLEASE USE KEYBOARD\n FOR CONTROL ROBOT", 162, CO-227);
      }

      //image(mmode3, 163, CO-237);
      hideMode2A();
      hideMode2B();
      cp5.getController("manual_mode").show();


      cp5.getController("remote").show();
      cp5.getController("keyboard").show();
      cp5.getController("M2SM3OK").show();
    }
    //DISPLAY// 

    text(value_shoulder, 1025, CO-392); //Input Shoulder
    text(value_elbow, 1115, CO-392); //Input Shoulder
    text(value_wirst, 1205, CO-392); //Input Shoulder

    text("90", 1025, CO-261); //Output Shoulder
    text("90", 1115, CO-261); //Output Shoulder
    text("90", 1205, CO-261); //Output Shoulder

    fill(255);
    textFont(f18);
    text("90"+"%", 1205, CO-194); //Akurasi
    textFont(f16);
  }

  ////////////////////////// INVERSE KINEMATIC /////////////////////////


  if (MainMode==3) //INVERSE KINEMATIC
  { 
    text("MODE INVERSE", 187, CO-390);  
    if (SubMode3==0) {
      text("SELECT MODE", 188, CO-369);
    }
    cp5.getController("ik_mode").show();
    hideMode1A();
    hideMode1B();
    hideMode2A();
    hideMode2B();
    hideMode2C();
    hideMode4();

    if (SubMode3==1) 
    {  
      text("SINGLE POINT", 188, CO-369);  
      text("PLEASE CHOSE \n ONE POINT ON WORKSPACE \n FOR TARGET", 163, CO-206);  
      image(dis_m3s1, 1115, CO-307);
      cp5.getController("ik_mode").show();
      hideMode3B();
      hideMode3C();
    }

    if (SubMode3==2) { 
      text("MULTI POINT", 188, CO-369);
      text("COORDINAT SELECTED", 163, CO-332);  
      text("START", 102, CO-145);  
      text("RESET", 217, CO-145);  
      //image(ikmode2, 163, CO-237);
      image(dis_m3s2, 1115, CO-307);
      cp5.getController("start_trajectory").show();
      cp5.getController("reset_trajectory").show();
      hideMode3A();
      hideMode3C();
    }
    if (SubMode3==3) {
      text("INPUT TEXT", 188, CO-369);
      textAlign(LEFT, CENTER);
      text("KOORDINAT X", 34, CO-294); 
      text("KOORDINAT Y", 34, CO-236); 
      textAlign(CENTER, CENTER);
      text("UP/DOWN", 96, CO-146); 
      text("GRIPPER", 218, CO-146); 
      stroke(10);
      line(239, CO-280, 292, CO-280);
      line(239, CO-222, 292, CO-222);
      noStroke();
      //image(ikmode3, 163, CO-237);
      image(dis_m3s1, 1115, CO-307);
      hideMode3B();
      cp5.getController("text_posX").show();
      cp5.getController("text_posY").show();
      cp5.getController("start_trajectory").show();
      cp5.getController("reset_trajectory").show();
      hideMode3A();

      //data//
      value_posX=value_posX_text;
      value_posY=value_posY_text;


      fill(0);

      text(value_posX, 1137, CO-444); //Input X
      text(value_posY, 1218, CO-444); //Input Y

      text(value_posX, 266, CO-294); //Input X
      text(value_posY, 266, CO-236); //Input Y

      text("24", 1137, CO-364); //Output X
      text("90", 1218, CO-364); //Output Y

      text("24", 1137, CO-283); //Terhitung Shoulder
      text("90", 1218, CO-283); //Terhitung Elbow

      text("24", 1137, CO-202); //Terukur Shoulder
      text("90", 1218, CO-202); //Terukur Elbow


      fill(255);
      textFont(f18);
      text("90"+"%", 1179, CO-143); //Akurasi
      textFont(f16);
    }
  }


  ////////////////////////// COLOR DETECTOR /////////////////////////
  if (MainMode==4)
  {    hideAllMode();
    hideMode1A();
    hideMode1B();
    hideMode2A();
    hideMode2B();
    hideMode2C();
    hideMode3A();
    hideMode3B();
    hideMode3C();
     image(dis_m4, 1115, CO-307);
    textFont(f25);
    text("MODE SET PID", 163, CO-390);  
    if ( start_pid<1) {


      textFont(f16);
      textAlign(LEFT, CENTER);
      text("SET JOINT", 40, CO-330);  
      text("SET POINT", 40, CO-287);  
      text("SET KP", 40, CO-242);  
      text("SET KI", 40, CO-197);
      text("SET KD", 40, CO-152);
      textAlign(CENTER, CENTER);
      
     
      if (SubMode4>0) {
        text("START", 111, CO-115);  
        text("STOP", 163, CO-115);  
        text("RESET", 214, CO-115);
      }


      stroke(10);
      line(205, CO-319, 288, CO-319);
      line(214, CO-277, 279, CO-277);
      line(214, CO-232, 279, CO- 232);
      line(214, CO-187, 279, CO- 187);
      line(214, CO-142, 279, CO- 142);
      noStroke();


      for (int a=1; a<=SubMode4; a++) {
        if (SubMode4==a) {
          text(joint_pid[a-1], 246, CO-331);
          fill(255);
          textFont(f18);
          text(joint_pid[a-1], 1185, CO-474); //Joint
          textFont(f16);
        }
      }
    
    //image(pidmode, 163, CO-237);
   

    }

   
    
     if (SubMode4>0) {
        cp5.getController("text_setpoint").unlock();
        cp5.getController("text_KP").unlock();
        cp5.getController("text_KI").unlock();
        cp5.getController("text_KD").unlock();

        cp5.getController("start_pid").show();
        cp5.getController("stop_pid").show();
        cp5.getController("reset_pid").show();
         if ( start_pid==1) {
      cp5.getController("jointPID").hide();
      cp5.getController("text_setpoint").hide();
      cp5.getController("text_setpoint").hide();
      cp5.getController("text_KP").hide();
      cp5.getController("text_KI").hide();
      cp5.getController("text_KD").hide();
      cp5.getController("start_pid").hide();
      cp5.getController("reset_pid").hide();
      
      textFont(f16);
      text("STOP", 163, CO-115);  
      textFont(f20);
      text("PLEASE WAIT \n FOR THE RESPON", 159, CO-219);
      textFont(f16);
      
    }
      }
      
if (SubMode4==0) { text("CHOSE THE JOINT!", 163, CO-102);
        cp5.getController("text_setpoint").lock();
  cp5.getController("text_KP").lock();
      cp5.getController("text_KI").lock();
      cp5.getController("text_KD").lock();
      
        
         cp5.getController("stop_pid").hide();
      }
    
  
    if ( start_pid<1) {
      cp5.getController("jointPID").show();
      cp5.getController("text_setpoint").show();

      cp5.getController("text_KP").show();
      cp5.getController("text_KI").show();
      cp5.getController("text_KD").show();


      
        
  
      fill(0);
      text(value_setpoint, 246, CO-287); 
      text(value_KP, 246, CO-242); 
      text(value_KI, 246, CO-197); 
      text(value_KD, 246, CO-152); 

    }
      textFont(f20);
      text(value_KP, 1027, CO-378); 
      text(value_KI, 1117, CO-378); 
      text(value_KD, 1207, CO-378); 
      fill(255);
      text(value_setpoint, 1207, CO-324); 
      fill(0);
      textFont(f16);
    }
  

  ////////////////////////// OFF /////////////////////////

  if (MainMode!=1 && MainMode!=2 && MainMode!=3 && MainMode!=4 ) 
  {
    hideAllMode();

    hideMode1A();
    hideMode1B();
    hideMode2A();
    hideMode2B();
    hideMode2C();
    hideMode3A();
    hideMode3B();
    hideMode3C();
    hideMode4();
  }
}

public void hideAllMode() {
  cp5.getController("color_mode").hide(); //mode color
  cp5.getController("manual_mode").hide(); // mode manual
  cp5.getController("ik_mode").hide(); // mode inverse
}

public void hideMode1A() {
  cp5.getController("M1S1_no").hide();//MODE1A
  cp5.getController("M1S1_yes").hide();//MODE1A
  cp5.getGroup("M1S1_rgb").hide();//MODE1A
}

public void hideMode1B() {

  cp5.getController("chose_red").hide();
  cp5.getController("chose_green").hide();
  cp5.getController("chose_blue").hide();
  cp5.getController("chose_yellow").hide();
  cp5.getController("chose_black").hide();

  cp5.getController("chose_color_start").hide();
  cp5.getController("chose_color_change").hide();
}

public void hideMode2A() {
  cp5.getController("slider_shoulder").hide(); //MODE2A
  cp5.getController("slider_elbow").hide();//MODE2A
  cp5.getController("slider_wirst").hide();//MODE2A
  cp5.getController("up_down").hide();//MODE2A
  cp5.getController("gripper").hide();//MODE2A
}

public void hideMode2B() {
  cp5.getController("text_shoulder").hide();//MODE2B
  cp5.getController("text_elbow").hide();//MODE2B
  cp5.getController("text_wirst").hide();//MODE2B
}

public void hideMode2C() {
  cp5.getController("remote").hide();//MODE2C
  cp5.getController("keyboard").hide();//MODE2C
  cp5.getController("M2SM3OK").hide();//MODE2C
}

public void hideMode3A() {
}
public void hideMode3B() {
  cp5.getController("start_trajectory").hide();
  cp5.getController("reset_trajectory").hide();
}
public void hideMode3C() {
  cp5.getController("text_posX").hide();
  cp5.getController("text_posY").hide();
}

public void hideMode4() {
  cp5.getController("jointPID").hide();
  cp5.getController("jointPID").hide();
  cp5.getController("text_setpoint").hide();
  cp5.getController("text_KP").hide();
  cp5.getController("text_KI").hide();
  cp5.getController("text_KD").hide();
  cp5.getController("start_pid").hide();
  cp5.getController("stop_pid").hide();
  cp5.getController("reset_pid").hide();
}
public void SendToArduino()
{  
  
}




 
//--------------------- BACKGROUND ---------------------\\
PImage bg; //background
PImage cmode, cmode1, cmode2, mmode, mmode1, mmode2, mmode3, ikmode, ikmode2, ikmode3, pidmode; //control
PImage dis_m1s1, dis_m2s2, dis_m3s1, dis_m3s2, dis_m4; //display

//--------------------- FONT ---------------------\\
PFont f2, f4, f6, f8, f10, f12, f13, f14, f15, f16, f17, f18, f19, f20, f25, f30, f40, f50;

//--------------------- COLOR ---------------------\\
int c1, c2, c3,c4,c5;


public void SETimg() {

  bg=loadImage("bg.png"); 
  
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
  
}

public void SETfont() {
  f2 = createFont("arial", 2, false);
  f4 = createFont("arial", 4, false);
  f6 = createFont("arial", 6, false);
  f8 = createFont("arial", 8, false);
  f10 = createFont("arial", 10, false);
  f12 = createFont("arial", 12, false);
  f13 = createFont("arial", 13, false);
  f14 = createFont("arial", 14, false);
  f15 = createFont("arial", 15, false);
  f16 = createFont("arial", 16, false);
  f17 = createFont("arial", 17, false);
  f18 = createFont("arial", 18, false);
  f19 = createFont("arial", 19, false);
  f20 = createFont("arial", 20, false);
  f25 = createFont("arial", 25, false);
  f30= createFont("arial", 30, false);
  f40 = createFont("arial", 40, false);
  f50 = createFont("arial", 50, false);
}

public void SETcolor()
{
 c1=(0xffF0F6DC); //krem backgorund
 c2=(0xff53666A); //hijau tua
 c3=(0xff80A2A3); //hijau sedang
 c4=(0xffBDDBDB); //hijau muda
 c5=(0xffF75C57); //merah

}
String pn;
public void setup_UART()
{

  commListbox = cp5.addListBox("portComList", 20, CO-561, 285, 200); // make a listbox and populate it with the available comm ports
  commListbox.setColorLabel(0);
  commListbox.setItemHeight(15);
  commListbox.setBarHeight(15);
  commListbox.setCaptionLabel("PORT COM");
  commListbox.setColorBackground(c3);
  commListbox.setColorForeground(c5);
  commListbox.setColorActive(c5);
  commListbox.close();

  for (int i=0; i<Serial.list ().length; i++) 
  {

    pn = shortifyPortName(Serial.list()[i], 13);
    if (pn.length() >0 ) commListbox.addItem(pn, i); // addItem(name,value)
    commListMax = i;
  }

  commListbox.addItem("Close Comm", ++commListMax); // addItem(name,value)

  txtlblWhichcom = cp5.addTextlabel("txtlblWhichcom", "No Port Selected", 163, 720-561); // textlabel(name,text,x,y)
  txtlblWhichcom.setColorValue(0);
}



public void serialEvent (Serial usbPort) 
{
  try {
    String usbString = usbPort.readStringUntil ('\n');

    if (usbString != null) 
    {
      usbString = trim(usbString);
    }

    float data[] = PApplet.parseFloat(split(usbString, ','));
  }
  catch(RuntimeException e)
  {
    println("Serial event is not null");
  }
}



public void InitSerial( float portValue) 
{
  if (portValue < commListMax) {

    String portPos = Serial.list()[PApplet.parseInt(portValue)];
    txtlblWhichcom.setValue("Connected = " + shortifyPortName(portPos, 8));
    serial = new Serial(this, portPos, 115200);
    serial.bufferUntil('\n');
    serial_conect=1;
  } else 
  {
    txtlblWhichcom.setValue("Not Connected");
    serial.clear();
    serial.stop();
    serial_conect=0;
  }
}

public String shortifyPortName(String portName, int maxlen)  
{
  String shortName = portName;
  if (shortName.startsWith("/dev/")) shortName = shortName.substring(5);  
  if (shortName.startsWith("tty.")) shortName = shortName.substring(4); // get rid off leading tty. part of device name
  if (portName.length()>maxlen) shortName = shortName.substring(0, (maxlen-1)/2) + "~" +shortName.substring(shortName.length()-(maxlen-(maxlen-1)/2));
  if (shortName.startsWith("cu.")) shortName = "";// only collect the corresponding tty. devices
  return shortName;
}

public void controlEvent(ControlEvent theControlEvent)
{

  if (theControlEvent.isFrom(RadioButton)) {
    rgb=PApplet.parseInt(theControlEvent.getValue());
   
    if (rgb==1) {
      _MultiColor="RED";
    }
    if (rgb==2) {
      _MultiColor="GREEN";
    }
    if (rgb==3) {
      _MultiColor="BLUE";
    }
    if (rgb==4) {
      _MultiColor="YELLOW";
    }
    if (rgb==5) {
      _MultiColor="BLACK";
    }
    println("Mode: "+MainMode +" SubMode: "+SubMode1+" Color: "+_MultiColor+" Action: "+MultiColorAction);
  }  

  if (theControlEvent.isController()) {
    //--------------------- comlist ---------------------\\

    if (theControlEvent.getController().getName()=="portComList") {
      InitSerial(theControlEvent.getController().getValue());
    }




    if (theControlEvent.isController()) {
      ReadID=theControlEvent.getController().getId();      
println(ReadID);
      /*
      ID 
       MAIN MODE = 1
       MODE 1    = 11
       MODE 2    = 12
       */

      //MAIN MODE //
      if (ReadID==1 && start_pid==0 &&  yes_no_M1S1!=1 && chose_color_go!=1 ) { 
        MainMode+=1;
        if (MainMode==5) {
          MainMode=1;
        }
        println("Mode: "+MainMode);
      }
      // MODE 1 //

      if (MainMode==1 && ReadID==11) {
        SubMode1+=1;
        if (SubMode1==3) {
          SubMode1=1;
        }
      }


      if (MainMode==1) {
//--------------------- SINGLE COLOR ---------------------\\

//add radio button on top this program//

        if (ReadID==112 && yes_no_M1S1!=2) {
           
          rgb=0;
          yes_no_M1S1=1;
        
        }
        if (ReadID==113 ) {
           
        rgb=0;
          yes_no_M1S1=2;
          
        }
        
                
//--------------------- MULTI COLOR ---------------------\\
        if (SubMode1==2) {
          

          if (ReadID==121) {
            _MultiColor="RED";
            color_counter+=1;
            _ColorMultiColor=0xffF75C57;
          multicolorhide1=1;
         
          }
          if (ReadID==122) {
            _MultiColor="GREEN";
            color_counter+=1;
             _ColorMultiColor=0xff009B4C;
           multicolorhide2=1;
          }
          if (ReadID==123) {
            _MultiColor="BLUE";
            color_counter+=1;
             _ColorMultiColor=0xff2F318B;
          multicolorhide3=1;
          }
          if (ReadID==124) {
            _MultiColor="YELLOW";
            color_counter+=1;
             _ColorMultiColor=0xffFFF000;
        multicolorhide4=1;
           }
          if (ReadID==125) {
            _MultiColor="BLACK";
            _ColorMultiColor=0xff332C2B;
       multicolorhide5=1;
            color_counter+=1;
             _ColorMultiColor=color(0,0,0);
          }

          if (ReadID==126) {
            MultiColorAction="START";

            chose_color_go=1;
            color_counter=-1;
          }
          if (ReadID==127) {
            MultiColorAction="CHANGE";
            
            chose_color_go=2;
            
            multicolorhide1=0;
            multicolorhide2=0;
            multicolorhide3=0;
            multicolorhide4=0;
            multicolorhide5=0;
          
for(int a=0;a<=4;a++){
  ColorMultiColor[a]=0xff53666A;
}
for(int a=0;a<=4;a++){
  ColorMultiColor2[a]=0xffBDDBDB;
}
          }
          if (color_counter==5) {
            hide_rgb=1;
          }
          if (chose_color_go==2) {
            chose_color_go=0;
            color_counter=0;
            hide_rgb=2;
          }
          
          for(int b=1;b<=color_counter;b++){
            for(int c=121;c<=ReadID;c++){
              if(color_counter==b && ReadID==c){
                ColorMultiColor[b-1]= _ColorMultiColor;
                ColorMultiColor2[b-1]= _ColorMultiColor;
                
              }
             
            }
          }
        }
      }
    
      

      // MODE 2 //
      if (MainMode==2 && ReadID==12) {
        SubMode2+=1;
        if (SubMode2==4) {
          SubMode2=1;
        }
      }
      if (MainMode==2 && SubMode2==3) {
        if(ReadID==231){
          remote_keyboard=1;}
          if(ReadID==232){
            remote_keyboard=2;}
      }



      // MODE 3 //
      if (MainMode==3 && ReadID==13) {
        SubMode3+=1;
        if (SubMode3==4) {
          SubMode3=1;
        }
      }

      // MODE 4 //

    

      if (ReadID==411) {
        SubMode4+=1;
        if (SubMode4==4) {
          SubMode4=1;
        }
      }

      if (ReadID==423) {
        value_setpoint=0;
        value_KP=0;
        value_KI=0;
        value_KD=0;
      }
      
      if (ReadID==421) {
        start_pid=1;
      }
       if (ReadID==422) {
        start_pid=0;
      }
      
      
    
    
    //single color//
    if(MainMode==1){
    if (yes_no_M1S1==1) {
          MultiColorAction="YES";
        }
        if (yes_no_M1S1==2) {
          MultiColorAction="NO";
        }
   if (yes_no_M1S1==0) {
          MultiColorAction="";
        }
            println("Mode: "+MainMode +" SubMode: "+SubMode1+" Color: "+_MultiColor+ " Action: "+MultiColorAction);
    }
          
  

  
    }
  }
}
  public void settings() {  size(1280, 720, OPENGL); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SCARA" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
