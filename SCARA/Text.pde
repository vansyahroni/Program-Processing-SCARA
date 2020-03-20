
void _text()
{
  //main mode
  textAlign(CENTER, CENTER);
  textFont(font16);
  fill(0);
  noStroke();
  //main
  if(MainMode==1) {text("COLOR DETECTOR", 185, CO-465);}
  if(MainMode==2) {text("MANUAL", 185, CO-465);}
  if(MainMode==3) {text("INVERSE KINEMATIC", 185, CO-465);}



  //sub mode
//  if(MainMode==1 &&SubMode1==1){ }
  if(MainMode==1 &&SubMode1==2){  text("MULTI COLOR", 188, CO-369);}
  if(MainMode==2 &&SubMode2==1){  text("MANUAL SLIDER", 188, CO-369);}
  if(MainMode==2 &&SubMode2==2){  text("MANUAL TEXT", 188, CO-369);}
    if(MainMode==2 &&SubMode2==3){  text("REMOTE", 188, CO-369);}

  //perintah RGB

  
if(MainMode==1 && SubMode1==1){
   textFont(font14);
    text("SINGLE COLOR", 188, CO-369);                
text("YA",113, CO-78);
text("NO",213, CO-78);
  if (rgb>0) {
    if (rgb==1) { 
      text("THE RED COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
    }
    if (rgb==2) { 
      text("THE BLUE COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?", 163, CO-213);
    }
    if (rgb==3) { 
      text("THE GREEN COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?", 163, CO-213);
    }
    if (rgb==4) { 
      text("THE YELLOW COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
    }
    if (rgb==5) { 
      text("THE BLACK COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
    }  
}  
 else {
    text("PLEASE CHOSE THE COLOR! ", 163, CO-213);
  }
  

}
  
  
 if(MainMode==2 &&SubMode2==2){  
  text(value_shoulder, 270, CO-294);
    text(value_elbow, 270, CO-235);
      text(value_wirst, 270, CO-177);
 }
 
  if(_statustab==231){ text("YOU WILL OPERATE THE ROBOT "+"\n"+"USE REMOTE", 163, CO-186); }
   if(_statustab==232){ text("YOU WILL OPERATE THE ROBOT "+"\n"+"USE KEYBOARD", 163, CO-186); }
  
}


