void contorlTab() {
  imageMode(CENTER);

  ////////////////////////// COLOR DETECTOR /////////////////////////
  if (tab==1)
  { 
    image(cmode, 163, CO-237);
    cp5.getController("color_mode").moveTo("default");

    //////////////// OFF OTHER CONTROLP5 ///////////////////////////

    cp5.getController("slider_shoulder").moveTo("HIDE");//MODE2A
    cp5.getController("slider_elbow").moveTo("HIDE");//MODE2A
    cp5.getController("slider_wirst").moveTo("HIDE");//MODE2A
    cp5.getController("up_down").moveTo("HIDE");//MODE2A
    cp5.getController("gripper").moveTo("HIDE");//MODE2A

    cp5.getController("text_shoulder").moveTo("HIDE");//MODE2B
    cp5.getController("text_elbow").moveTo("HIDE");//MODE2B
    cp5.getController("text_wirst").moveTo("HIDE");//MODE2B

    cp5.getController("remote").moveTo("HIDE");//MODE2C
    cp5.getController("keyboard").moveTo("HIDE");//MODE2C
    cp5.getController("mmode3ok").moveTo("HIDE");//MODE2C


    ////////////////////////// SINGLE COLOR /////////////////////////

    if (_tab==1) 
    {pushMatrix();
    translate(0,0,0.1);
      image(cmode1, 163, CO-207);
      popMatrix();
      cp5.getController("color_mode").moveTo("default");

      cp5.getController("no").moveTo("default");
      cp5.getController("yes").moveTo("default");
      cp5.getGroup("rgb").moveTo("default");
    }

    ////////////////////////// MULTI COLOR /////////////////////////

    if (_tab==2) 
    {
      cp5.getController("color_mode").moveTo("default");

      cp5.getController("no").moveTo("HIDE");
      cp5.getController("yes").moveTo("HIDE");
      cp5.getGroup("rgb").moveTo("HIDE");
    }
  }


  ////////////////////////// MANUAL /////////////////////////

  if (tab==2) //MANUAL
  { 
    image(mmode, 163, CO-237);
    cp5.getController("manual_mode").moveTo("default");

    //////////////// OFF OTHER CONTROLP5 ///////////////////////////

    cp5.getController("no").moveTo("HIDE");//MODE1A
    cp5.getController("yes").moveTo("HIDE");//MODE1A
    cp5.getGroup("rgb").moveTo("HIDE");//MODE1A

    ////////////////////////// MANUAL SLIDER /////////////////////////

    if (_tab2==1) 
    { 
      image(mmode1, 163, CO-237);
      cp5.getController("manual_mode").moveTo("default");

      cp5.getController("slider_shoulder").moveTo("default");
      cp5.getController("slider_elbow").moveTo("default");
      cp5.getController("slider_wirst").moveTo("default");
      cp5.getController("up_down").moveTo("default");
      cp5.getController("gripper").moveTo("default");

      cp5.getController("text_shoulder").moveTo("HIDE");
      cp5.getController("text_elbow").moveTo("HIDE");
      cp5.getController("text_wirst").moveTo("HIDE");

      cp5.getController("remote").moveTo("HIDE");
      cp5.getController("keyboard").moveTo("HIDE");
      cp5.getController("mmode3ok").moveTo("HIDE");
    }

    ////////////////////////// MANUAL TEXT /////////////////////////

    if (_tab2==2) //mmode2
    {
      image(mmode2, 163, CO-237);
      cp5.getController("manual_mode").moveTo("default");

      cp5.getController("slider_shoulder").moveTo("HIDE");
      cp5.getController("slider_elbow").moveTo("HIDE");
      cp5.getController("slider_wirst").moveTo("HIDE");
      cp5.getController("up_down").moveTo("default");
      cp5.getController("gripper").moveTo("default");

      cp5.getController("text_shoulder").moveTo("default");
      cp5.getController("text_elbow").moveTo("default");
      cp5.getController("text_wirst").moveTo("default");

      cp5.getController("remote").moveTo("HIDE");
      cp5.getController("keyboard").moveTo("HIDE");
      cp5.getController("mmode3ok").moveTo("HIDE");
    }


    ////////////////////////// MANUAL REMOTE /////////////////////////

    if (_tab2==3) //mmode2
    {
      image(mmode3, 163, CO-237);
      cp5.getController("manual_mode").moveTo("default");

      cp5.getController("slider_shoulder").moveTo("HIDE");
      cp5.getController("slider_elbow").moveTo("HIDE");
      cp5.getController("slider_wirst").moveTo("HIDE");
      cp5.getController("up_down").moveTo("HIDE");
      cp5.getController("gripper").moveTo("HIDE");

      cp5.getController("text_shoulder").moveTo("HIDE");
      cp5.getController("text_elbow").moveTo("HIDE");
      cp5.getController("text_wirst").moveTo("HIDE");

      cp5.getController("remote").moveTo("default");
      cp5.getController("keyboard").moveTo("default");
      cp5.getController("mmode3ok").moveTo("default");
    }
  }

  ////////////////////////// INVERSE KINEMATIC /////////////////////////


  if (tab==3) //INVERSE KINEMATIC
  { 
    image(ikmode, 163, CO-237);
    cp5.getController("ik_mode").moveTo("default");

  
    cp5.getController("no").moveTo("HIDE"); //MODE1A
    cp5.getController("yes").moveTo("HIDE");//MODE1A
    cp5.getGroup("rgb").moveTo("HIDE");//MODE1A


    cp5.getController("slider_shoulder").moveTo("HIDE"); //MODE2A
    cp5.getController("slider_elbow").moveTo("HIDE");//MODE2A
    cp5.getController("slider_wirst").moveTo("HIDE");//MODE2A
    cp5.getController("up_down").moveTo("HIDE");//MODE2A
    cp5.getController("gripper").moveTo("HIDE");//MODE2A

    cp5.getController("text_shoulder").moveTo("HIDE");//MODE2B
    cp5.getController("text_elbow").moveTo("HIDE");//MODE2B
    cp5.getController("text_wirst").moveTo("HIDE");//MODE2B

    cp5.getController("remote").moveTo("HIDE");//MODE2C
    cp5.getController("keyboard").moveTo("HIDE");//MODE2C
    cp5.getController("mmode3ok").moveTo("HIDE");//MODE2C
  }

  ////////////////////////// OFF /////////////////////////

  if (tab!=1 && tab!=2 && tab!=3) 
  {
    cp5.getController("color_mode").moveTo("HIDE"); //mode color

    cp5.getController("no").moveTo("HIDE");
    cp5.getController("yes").moveTo("HIDE");
    cp5.getGroup("rgb").moveTo("HIDE");

    cp5.getController("manual_mode").moveTo("HIDE"); // mode manual

    cp5.getController("slider_shoulder").moveTo("HIDE");
    cp5.getController("slider_elbow").moveTo("HIDE");
    cp5.getController("slider_wirst").moveTo("HIDE");
    cp5.getController("up_down").moveTo("HIDE");
    cp5.getController("gripper").moveTo("HIDE");

    cp5.getController("text_shoulder").moveTo("HIDE");
    cp5.getController("text_elbow").moveTo("HIDE");
    cp5.getController("text_wirst").moveTo("HIDE");

    cp5.getController("remote").moveTo("HIDE");
    cp5.getController("keyboard").moveTo("HIDE");
    cp5.getController("mmode3ok").moveTo("HIDE");

    cp5.getController("ik_mode").moveTo("HIDE"); // mode inverse
  }
}

