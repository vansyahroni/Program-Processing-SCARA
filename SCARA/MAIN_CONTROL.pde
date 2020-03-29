void contorlTab() {
  imageMode(CENTER);
textAlign(CENTER, CENTER);
textFont(f16);
noStroke();
fill(0);

  ////////////////////////// COLOR DETECTOR /////////////////////////
  if (MainMode==0 )
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
    println("Main Mode:"+MainMode+"Sub Mode:"+SubMode);
  }
  
  if (MainMode==1 )
  { 

    cp5.getController("manual_mode").hide();
    image(cmode, 163, CO-237);
     
    hideMode2A();
    hideMode2B();
    hideMode2C();
    hideMode3A();
    hideMode3B();
    hideMode3C();
    hideMode4();
    cp5.getController("color_mode").show();
    
    
    if (SubMode1==1) //SINGLE COLOR
    {  
      pushMatrix();
      translate(0, 0, 0.0002);
      image(cmode1, 172, CO-252);
      popMatrix();
      image(dis_m1s1, 1115, CO-307);
      cp5.getController("color_mode").show();
      cp5.getController("M1S1_no").show();
      cp5.getController("M1S1_yes").show();

      cp5.getGroup("M1S1_rgb").show();
      hideMode1B();
    }

    if (SubMode1==2) //MULTI COLOR
    {
      image(cmode2, 163, CO-237);
      image(dis_m1s1, 1115, CO-307);
      cp5.getController("color_mode").show();
      hideMode1A();

      cp5.getController("chose_red").show();
      cp5.getController("chose_green").show();
      cp5.getController("chose_blue").show();
      cp5.getController("chose_yellow").show();
      cp5.getController("chose_black").show();

      cp5.getController("chose_color_start").show();
      cp5.getController("chose_color_change").show();

      if (hide_rgb==1) {
        cp5.getController("chose_red").hide();;
        cp5.getController("chose_green").hide();
        cp5.getController("chose_blue").hide();
        cp5.getController("chose_yellow").hide();
        cp5.getController("chose_black").hide();
      }

      if (hide_rgb==2) {
        cp5.getController("chose_red").show();
        cp5.getController("chose_green").show();
        cp5.getController("chose_blue").show();
        cp5.getController("chose_yellow").show();
        cp5.getController("chose_black").show();
      }
    }
    println("Main Mode:"+MainMode+"Sub Mode:"+SubMode1);
  }
 
  
  ////////////////////////// MANUAL /////////////////////////

  if (MainMode==2) 
  {     image(mmode, 163, CO-237);
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
      image(mmode1, 163, CO-237);

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
      image(mmode2, 163, CO-237);

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
      
    }

    if (SubMode2==3) //REMOTE
    
    { 
      image(mmode3, 163, CO-237);
      hideMode2A();
      hideMode2B();
      cp5.getController("manual_mode").show();
     

      cp5.getController("remote").show();
      cp5.getController("keyboard").show();
      cp5.getController("M2SM3OK").show();
    }
        println("Main Mode:"+MainMode+"Sub Mode:"+SubMode2);
  }

  ////////////////////////// INVERSE KINEMATIC /////////////////////////


  if (MainMode==3) //INVERSE KINEMATIC
  { 
    image(ikmode, 163, CO-237);
    cp5.getController("ik_mode").show();
    hideMode1A();
    hideMode1B();
    hideMode2A();
    hideMode2B();
    hideMode2C();
    hideMode4();

    if (SubMode3==1) 
    { 
      image(dis_m3s1, 1115, CO-307);
      cp5.getController("ik_mode").show();
      hideMode3B();
      hideMode3C();
    }

    if (SubMode3==2) { 
      image(ikmode2, 163, CO-237);
      image(dis_m3s2, 1115, CO-307);
      cp5.getController("start_trajectory").show();
      cp5.getController("reset_trajectory").show();
      hideMode3A();
      hideMode3C();
    }
    if (SubMode3==3) {
      image(ikmode3, 163, CO-237);
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
    }
  }
  

  ////////////////////////// COLOR DETECTOR /////////////////////////
  if (MainMode==4)
  { 
    image(pidmode, 163, CO-237);
    image(dis_m4, 1115, CO-307);
    cp5.getController("jointPID").show();
    cp5.getController("text_setpoint").show();
    cp5.getController("text_KP").show();
    cp5.getController("text_KI").show();
    cp5.getController("text_KD").show();

    cp5.getController("start_pid").show();
    cp5.getController("stop_pid").show();
    cp5.getController("reset_pid").show();

    hideAllMode();
    hideMode1A();
    hideMode1B();
    hideMode2A();
    hideMode2B();
    hideMode2C();
    hideMode3A();
    hideMode3B();
    hideMode3C();
  }
  



  ////////////////////////// OFF /////////////////////////

  if (MainMode!=1 && MainMode!=2 && MainMode!=3 && MainMode!=4 && MainMode==0) 
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

void hideAllMode() {
  cp5.getController("color_mode").hide(); //mode color
  cp5.getController("manual_mode").hide(); // mode manual
  cp5.getController("ik_mode").hide(); // mode inverse
}

void hideMode1A() {
  cp5.getController("M1S1_no").hide();//MODE1A
  cp5.getController("M1S1_yes").hide();//MODE1A
  cp5.getGroup("M1S1_rgb").hide();//MODE1A
}

void hideMode1B() {

  cp5.getController("chose_red").hide();
  cp5.getController("chose_green").hide();
  cp5.getController("chose_blue").hide();
  cp5.getController("chose_yellow").hide();
  cp5.getController("chose_black").hide();

  cp5.getController("chose_color_start").hide();
  cp5.getController("chose_color_change").hide();
}

void hideMode2A() {
  cp5.getController("slider_shoulder").hide(); //MODE2A
  cp5.getController("slider_elbow").hide();//MODE2A
  cp5.getController("slider_wirst").hide();//MODE2A
  cp5.getController("up_down").hide();//MODE2A
  cp5.getController("gripper").hide();//MODE2A
}

void hideMode2B() {
  cp5.getController("text_shoulder").hide();//MODE2B
  cp5.getController("text_elbow").hide();//MODE2B
  cp5.getController("text_wirst").hide();//MODE2B
}

void hideMode2C() {
  cp5.getController("remote").hide();//MODE2C
  cp5.getController("keyboard").hide();//MODE2C
  cp5.getController("M2SM3OK").hide();//MODE2C
}

void hideMode3A() {
}
void hideMode3B() {
  cp5.getController("start_trajectory").hide();
  cp5.getController("reset_trajectory").hide();
}
void hideMode3C() {
  cp5.getController("text_posX").hide();
  cp5.getController("text_posY").hide();
}

void hideMode4() {
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
  
