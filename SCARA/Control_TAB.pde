void contorlTab() {
  imageMode(CENTER);
  if (tab==1) //COLOR DETECTOR
  { 
    image(cmode, 163, CO-237);
    cp5.getController("no").moveTo("default");
    cp5.getController("yes").moveTo("default");
    cp5.getController("color_mode").moveTo("default");
    cp5.getGroup("rgb").moveTo("default");
    
     cp5.getController("manual_mode").moveTo("mode2");
       cp5.getController("slider_shoulder").moveTo("mode2");
    cp5.getController("slider_elbow").moveTo("mode2");
    cp5.getController("slider_wirst").moveTo("mode2");
    cp5.getController("up_down").moveTo("mode2");
    cp5.getController("gripper").moveTo("mode2");
  }
  
  if (tab==2) //MANUAL
  { 
   image(mmode1, 163, CO-237);
 
    
    cp5.getController("no").moveTo("mode2");
    cp5.getController("yes").moveTo("mode2");
    cp5.getController("color_mode").moveTo("mode2");
    cp5.getGroup("rgb").moveTo("mode2");
    
     cp5.getController("manual_mode").moveTo("default");
    cp5.getController("slider_shoulder").moveTo("default");
    cp5.getController("slider_elbow").moveTo("default");
    cp5.getController("slider_wirst").moveTo("default");
    cp5.getController("up_down").moveTo("default");
    cp5.getController("gripper").moveTo("default");
  }

  if (tab!=1 && tab!=2) 
  {
    cp5.getController("color_mode").moveTo("Mode2");
    cp5.getController("no").moveTo("Mode2");
    cp5.getController("yes").moveTo("Mode2");
cp5.getGroup("rgb").moveTo("Mode2");

 cp5.getController("manual_mode").moveTo("mode2");
       cp5.getController("slider_shoulder").moveTo("mode2");
    cp5.getController("slider_elbow").moveTo("mode2");
    cp5.getController("slider_wirst").moveTo("mode2");
    cp5.getController("up_down").moveTo("mode2");
    cp5.getController("gripper").moveTo("mode2");
    
      cp5.getController("text_shoulder").moveTo("mode2");
      cp5.getController("text_elbow").moveTo("mode2");
       cp5.getController("text_wirst").moveTo("mode2");
  }
  
  
  if (tab==1 &&_tab==1) //single color
  {
    pushMatrix();
    translate(0, 0, 1);
    image(cmode1, 163, CO-207);
    popMatrix();
    cp5.getController("color_mode").moveTo("default");
    cp5.getController("no").moveTo("default");
    cp5.getController("yes").moveTo("default");
    cp5.getGroup("rgb").moveTo("default");
  }

  if (tab==1 &&_tab==2) //multicolor
  {
    cp5.getController("color_mode").moveTo("default");
    cp5.getController("no").moveTo("Mode2");
    cp5.getController("yes").moveTo("Mode2");
    cp5.getGroup("rgb").moveTo("Mode2");
  }
  
  if (tab==2 &&_tab2==1) //mmode1
  {
       cp5.getController("manual_mode").moveTo("default");
    cp5.getController("slider_shoulder").moveTo("default");
    cp5.getController("slider_elbow").moveTo("default");
    cp5.getController("slider_wirst").moveTo("default");
    cp5.getController("up_down").moveTo("default");
    cp5.getController("gripper").moveTo("default");
    
         cp5.getController("text_shoulder").moveTo("mode2");
      cp5.getController("text_elbow").moveTo("mode2");
       cp5.getController("text_wirst").moveTo("mode2");
  }
  
  if (tab==2 &&_tab2==2) //mmode2
  {
   image(mmode2, 163, CO-237);
 
   
  cp5.getController("manual_mode").moveTo("default");
    cp5.getController("slider_shoulder").moveTo("mode2");
    cp5.getController("slider_elbow").moveTo("mode2");
    cp5.getController("slider_wirst").moveTo("mode2");
    cp5.getController("up_down").moveTo("default");
    cp5.getController("gripper").moveTo("default");
    
     cp5.getController("text_shoulder").moveTo("default");
      cp5.getController("text_elbow").moveTo("default");
       cp5.getController("text_wirst").moveTo("default");
  }
  
}

