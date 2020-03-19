void contorlTab(){
  imageMode(CENTER);
      if (tab==1) //TAB MAIN 
  { image(cmode,163, CO-237);
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
  if (tab==1 &&_tab==1) //single color
  {pushMatrix();
  translate(0,0,1);
    image(cmode1,163, CO-207);
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
}
