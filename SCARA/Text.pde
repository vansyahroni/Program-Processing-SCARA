
void _text()
{
  //main mode
  textAlign(CENTER, CENTER);
  textFont(font18);
  fill(0);
  noStroke();
  //main
  if(tab==1) {text("COLOR DETECTOR", 160, CO-465);}
  if(tab==2) {text("MANUAL", 160, CO-465);}
  if(tab==3) {text("KINEMATIKA", 160, CO-465);}



  //color mode
  if(_tab==1){  text("SINGLE COLOR", 188, CO-369);}
  if(_tab==2){  text("MULTI COLOR", 188, CO-369);}


  //perintah RGB

  textFont(font14);
  if (rgb>0) {
    if (rgb==1) { 
      text("THE RED COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
    }
    if (rgb==2) { 
      text("THE GREEN COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
    }
    if (rgb==3) { 
      text("THE BLUE COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
    }
    if (rgb==4) { 
      text("THE YELLOW COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
    }
    if (rgb==5) { 
      text("THE BLACK COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
    }  
      if (rgb==6) { 
      text("", 163, CO-213);
    }  

    //yes or no
    if (yes_no>0) {
      if (yes_no==1) {
        
        text("OKE, PLEASE WAIT FOR 5 SECOND!", 163, CO-213);
      }
      if (yes_no==2) {
      
        text("PLEASE CHOSE THE COLOR!", 163, CO-213);
      }
         if (yes_no==3) {
      
        text("", 163, CO-213);
      }
    } else { 
      rgb=rgb*1;
    }
  } else {
    text("PLEASE CHOSE THE COLOR!", 163, CO-213);
  }
}

