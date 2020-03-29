void contorlTab() {
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  textFont(f16);
  noStroke();
  fill(0);

  ////////////////////////// COLOR DETECTOR /////////////////////////


  if (MainMode==1)
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
      fill(#F75C57);
      ellipse(72, CO-252, 40, 40);
      fill(#009B4C);
      ellipse(122, CO-252, 40, 40);
      fill(#2F318B);
      ellipse(172, CO-252, 40, 40);
      fill(#FFF000);
      ellipse(222, CO-252, 40, 40);
      fill(#332C2B);
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
    }

    if (SubMode1==2) //MULTI COLOR
    { 
      text("MULTI COLOR", 188, CO-369); 

      //image(cmode2, 163, CO-237);


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

      //image(mmode1, 163, CO-237);

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
      text("STOP", 163, CO-145);  
      //image(ikmode2, 163, CO-237);
      image(dis_m3s2, 1115, CO-307);
      cp5.getController("start_trajectory").show();
      cp5.getController("reset_trajectory").show();
      hideMode3A();
      hideMode3C();
    }
    if (SubMode3==3) {
      textAlign(LEFT, CENTER);
      text("KOORDINAT X", 34, CO-305); 
      text("KOORDINAT Y", 34, CO-247); 
       textAlign(CENTER, CENTER);
      text("UP/DOWN", 96, CO-146); 
      text("GRIPPER", 218, CO-146); 
   
   line(240,291,267,291);
   line(240,233,267,233);
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
    }
  }


  ////////////////////////// COLOR DETECTOR /////////////////////////
  if (MainMode==4)
  { 
    textFont(f25);
    text("MODE SET PID", 163, CO-390);  
    textFont(f16);
    textAlign(LEFT, CENTER);
    text("SET JOINT", 40, CO-330);  
    text("SET POINT", 40, CO-287);  
    text("SET KP", 40, CO-242);  
    text("SET KI", 40, CO-197);
    text("SET KD", 40, CO-152);
    textAlign(CENTER, CENTER);
    text("START", 111, CO-115);  
    text("STOP", 163, CO-115);  
    text("RESET", 214, CO-115);  

    line(205, 319, 288,319);
    line(214, 277, 279, 277);
    line(214, 232, 279, 232);
    line(214, 187, 279, 187);
    line(214, 142, 279, 142);


    //image(pidmode, 163, CO-237);
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
