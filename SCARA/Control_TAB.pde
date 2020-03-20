void contorlTab() {
  imageMode(CENTER);

  ////////////////////////// COLOR DETECTOR /////////////////////////
  if (MainMode==1)
  { 
    image(cmode, 163, CO-237);
    cp5.getController("color_mode").moveTo("default");
    hideMode2A();
    hideMode2B();
    hideMode2C();
    hideMode3A();
    hideMode3B();
    hideMode3C();
    hideMode4();


    if (SubMode1==1) //SINGLE COLOR
    {  
      pushMatrix();
      translate(0, 0, 0.0002);
      image(cmode1, 163, CO-291);
      popMatrix();
      cp5.getController("color_mode").moveTo("default");
      cp5.getController("no").moveTo("default");
      cp5.getController("yes").moveTo("default");
      cp5.getGroup("rgb").moveTo("default");
      hideMode1B();
    }

    if (SubMode1==2) //MULTI COLOR
    {
      cp5.getController("color_mode").moveTo("default");
      hideMode1A();
    }
  }
  ////////////////////////// MANUAL /////////////////////////

  if (MainMode==2) 
  { 
    image(mmode, 163, CO-237);
    cp5.getController("manual_mode").moveTo("default");
    hideMode1A();
    hideMode1B();
    hideMode3A();
    hideMode3B();
    hideMode3C();
    hideMode4();

    if (SubMode2==1) //SLIDER
    { 
      image(mmode1, 163, CO-237);
      cp5.getController("manual_mode").moveTo("default");
      hideMode2B();
      hideMode2C();

      cp5.getController("slider_shoulder").moveTo("default");
      cp5.getController("slider_elbow").moveTo("default");
      cp5.getController("slider_wirst").moveTo("default");
      cp5.getController("up_down").moveTo("default");
      cp5.getController("gripper").moveTo("default");
    }

    if (SubMode2==2) //TEXT
    {
      image(mmode2, 163, CO-237);
      cp5.getController("manual_mode").moveTo("default");
      hideMode2A();
      hideMode2C();

      cp5.getController("text_shoulder").moveTo("default");
      cp5.getController("text_elbow").moveTo("default");
      cp5.getController("text_wirst").moveTo("default");
    }

    if (SubMode2==3) //REMOTE
    {
      image(mmode3, 163, CO-237);
      cp5.getController("manual_mode").moveTo("default");
      hideMode2A();
      hideMode2B();

      cp5.getController("remote").moveTo("default");
      cp5.getController("keyboard").moveTo("default");
      cp5.getController("mmode3ok").moveTo("default");
    }
  }

  ////////////////////////// INVERSE KINEMATIC /////////////////////////


  if (MainMode==3) //INVERSE KINEMATIC
  { 
    image(ikmode, 163, CO-237);
    cp5.getController("ik_mode").moveTo("default");
    hideMode1A();
    hideMode1B();
    hideMode2A();
    hideMode2B();
    hideMode2C();
    hideMode4();

    if (SubMode3==1) //SLIDER
    { 

      cp5.getController("ik_mode").moveTo("default");
      hideMode3B();
      hideMode3C();
    }

    if (SubMode3==3) {
      hideMode3A();
      hideMode3C();
    }
    if (SubMode3==3) {
      image(ikmode3, 163, CO-237);
      cp5.getController("text_posX").moveTo("default");
      cp5.getController("text_posY").moveTo("default");
      hideMode3A();
      hideMode3B();
    }
  }

  ////////////////////////// COLOR DETECTOR /////////////////////////
  if (MainMode==4)
  { 
    image(pidmode, 163, CO-237);
    cp5.getController("jointPID").moveTo("default");
    cp5.getController("text_setpoint").moveTo("default");
    cp5.getController("text_KP").moveTo("default");
    cp5.getController("text_KI").moveTo("default");
    cp5.getController("text_KD").moveTo("default");

    cp5.getController("start_pid").moveTo("default");
      cp5.getController("stop_pid").moveTo("default");
        cp5.getController("reset_pid").moveTo("default");
        
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

  if (MainMode!=1 && MainMode!=2 && MainMode!=3 && MainMode!=4) 
  {
    hideAllMode();

    hideMode1A();
    hideMode1B();
    hideMode2A();
    hideMode2B();
    hideMode2C();
    hideMode3C();
    hideMode3C();
    hideMode3C();
    hideMode4();
  }
}

void hideAllMode() {
  cp5.getController("color_mode").moveTo("HIDE"); //mode color
  cp5.getController("manual_mode").moveTo("HIDE"); // mode manual
  cp5.getController("ik_mode").moveTo("HIDE"); // mode inverse
}

void hideMode1A() {
  cp5.getController("no").moveTo("HIDE");//MODE1A
  cp5.getController("yes").moveTo("HIDE");//MODE1A
  cp5.getGroup("rgb").moveTo("HIDE");//MODE1A
}

void hideMode1B() {
}

void hideMode2A() {
  cp5.getController("slider_shoulder").moveTo("HIDE"); //MODE2A
  cp5.getController("slider_elbow").moveTo("HIDE");//MODE2A
  cp5.getController("slider_wirst").moveTo("HIDE");//MODE2A
  cp5.getController("up_down").moveTo("HIDE");//MODE2A
  cp5.getController("gripper").moveTo("HIDE");//MODE2A
}

void hideMode2B() {
  cp5.getController("text_shoulder").moveTo("HIDE");//MODE2B
  cp5.getController("text_elbow").moveTo("HIDE");//MODE2B
  cp5.getController("text_wirst").moveTo("HIDE");//MODE2B
}

void hideMode2C() {
  cp5.getController("remote").moveTo("HIDE");//MODE2C
  cp5.getController("keyboard").moveTo("HIDE");//MODE2C
  cp5.getController("mmode3ok").moveTo("HIDE");//MODE2C
}

void hideMode3A() {
}
void hideMode3B() {
}
void hideMode3C() {
  cp5.getController("text_posX").moveTo("HIDE");
  cp5.getController("text_posY").moveTo("HIDE");
}

void hideMode4() {
  cp5.getController("jointPID").moveTo("HIDE");
  cp5.getController("jointPID").moveTo("HIDE");
  cp5.getController("text_setpoint").moveTo("HIDE");
  cp5.getController("text_KP").moveTo("HIDE");
  cp5.getController("text_KI").moveTo("HIDE");
  cp5.getController("text_KD").moveTo("HIDE");
    cp5.getController("start_pid").moveTo("HIDE");
      cp5.getController("stop_pid").moveTo("HIDE");
        cp5.getController("reset_pid").moveTo("HIDE");
        
  
  
  
  
}

