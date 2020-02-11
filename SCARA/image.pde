PImage logo, judul, name, bg, fslider, display, hub, start, manual, IK1, IK2, p1on, p1off, p2off, p2on, setkp, ws, workspace, workspace2;

void image_() {
  logo = loadImage("logo.png");
  judul = loadImage("Judul.png");
  name=loadImage("name.png");
  bg=loadImage("bg.png");
  fslider=loadImage("fslider.png");
  display=loadImage("display.png");
  hub=loadImage("hub.png");
  start=loadImage("start.png");
  manual=loadImage("manual.png");
  IK1=loadImage("ik1.png");
  IK2=loadImage("ik2.png");
  p1on=loadImage("p1on.png");
  p1off=loadImage("p1off.png");
  p2off=loadImage("p2off.png");
  p2on=loadImage("p2on.png");
  setkp=loadImage("setkp.png");
  ws=loadImage("ws.png");
  workspace=loadImage("workspace.png");
  workspace2=loadImage("workspace2.png");
}


void images() {

  imageMode(CENTER);  
  image(judul, width/2, 45);

  image(display, 1183, 557);
  pushMatrix();
  scale(0.19);

  image(hub, 341, 1260);

  popMatrix();

  image(logo, 185, 121);
  image(fslider, 181, 557);
  image(setkp, 181, 358);
  image(ws, 682, 709);

  if (START==true) {

    image(start, 181, 557);
    if (MODE==false) {
      image(manual, 181, 557);
    }

    if (MODE==true) {




      if (ik==false) { 
        image(IK2, 181, 557);
        pushMatrix();
        scale(0.63);
        image(workspace2, 1080, 615);
        popMatrix();
      }
     else {
      image(IK1, 181, 557);
      pushMatrix();
      scale(0.63);
      image(workspace, 1080, 615);
      popMatrix();
    }
  }
  if (P1==true) { 
    image(p1off, 1183, 557);
  } else { 
    image(p1on, 1183, 557);
  }
  if (P2==true) { 
    image(p2off, 1183, 557);
  } else { 
    image(p2on, 1183, 557);
  }
}

}
