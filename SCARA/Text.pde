
void _text()
{
  //main mode
  textAlign(CENTER, CENTER);
  textFont(font[16]);
  fill(0);
  noStroke();
  //main

  if (MainMode==1) {
    text("COLOR DETECTOR", 185, CO-465);
    if (SubMode1==1) {
      textFont(font[15]);
      text("SINGLE COLOR", 188, CO-369);                
      text("YES", 113, CO-88);
      text("NO", 213, CO-88);
      text("SET COLOR",175, CO-313);  
      if (rgb>0) {
        if (rgb==1) { 
          text("THE RED COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 175, CO-188);
        }
        if (rgb==2) { 
          text("THE BLUE COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?", 175, CO-188);
        }
        if (rgb==3) { 
          text("THE GREEN COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?", 175, CO-188);
        }
        if (rgb==4) { 
          text("THE YELLOW COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 175, CO-188);
        }
        if (rgb==5) { 
          text("THE BLACK COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 175, CO-188);
        }
        
        
      if (_statustab==111 && rgb!=1 && rgb!=2 && rgb!=3 && rgb!=4 && rgb!=5) { 
        textFont(font[14]);
        text("PLEASE WAIT FOR 5 SECOND", 175, CO-188);
      }
      if (_statustab==112 && rgb!=1 && rgb!=2 && rgb!=3 && rgb!=4 && rgb!=5) { 
        text("PLEASE CHOSE THE COLOR!", 175, CO-188);   
      }
      } else {
        text("PLEASE CHOSE THE COLOR! ", 175, CO-188);
      }

    }

    if (SubMode1==2) {  
      text("MULTI COLOR", 188, CO-369);
       text("START", 113, CO-88);
      text("CHANGE", 213, CO-88);
      if(color_counter==-1)text("",175, CO-313);  
      if(color_counter==0)text("SET FRIST COLOR",175, CO-313);  
      if(color_counter==1)text("SET SECOND COLOR",175, CO-313);  
      if(color_counter==2)text("SET THRID COLOR",175, CO-313);  
      if(color_counter==3)text("SET FOURTH COLOR",175, CO-313);  
      if(color_counter==4)text("SET FIVE COLOR",175, CO-313);  
      if(color_counter==5)text("KAKEAN ",175, CO-313);  
    if(chose_color_go==1 )text("PLEASE WAIT FOR 5 SECOND",175, CO-313);  
  if(chose_color_go==2)text("PLEASE CHOSE THE COLOR",175, CO-313);  
    }
    
   
}
      
 
  

   
    
  


  if (MainMode==2) {
    text("MANUAL", 185, CO-465);

    if (SubMode2==1) {  
      text("MANUAL SLIDER", 188, CO-369);
    }

    if (SubMode2==2) {  
      text("MANUAL TEXT", 188, CO-369);
      text(value_shoulder, 270, CO-294);
      text(value_elbow, 270, CO-235);
      text(value_wirst, 270, CO-177);
    }
    if (SubMode2==3) {  
      text("REMOTE", 188, CO-369);

      if (_statustab==231) { 
        text("YOU WILL OPERATE THE ROBOT "+"\n"+"USE REMOTE", 163, CO-186);
      }
      if (_statustab==232) { 
        text("YOU WILL OPERATE THE ROBOT "+"\n"+"USE KEYBOARD", 163, CO-186);
      }
    }
  }


  if (MainMode==3) {
    text("INVERSE KINEMATIC", 185, CO-465);
    if (SubMode3==1) {  
      text("SILAHKAN PILIH POINT YANG MAU \n ANDA TUJU", 163, CO-206);
    }

    if (SubMode3==2) {  
      text("SILAHKAN PILIH KOORDINAT \n MANA SAJA YANG MAU  ANDA TUJU", 163, CO-206);
    }
    if (SubMode3==3) {  
      text(value_posX, 270, CO-294);
      text(value_posY, 270, CO-235);
    }
  }

  if (MainMode==4) {


    text("SET PID ", 185, CO-465);

    if (SubMode4==1) { 
      text("SHOULDER", 246, CO-331);
    }
    if (SubMode4==2) { 
      text("ELBOW", 246, CO-331);
    }
    if (SubMode4==3) { 
      text("WIRST", 246, CO-331);
    }

    text(value_setpoint, 246, CO-287);
    text(value_KP, 246, CO-245);
    text(value_KI, 246, CO-200);
    text(value_KD, 246, CO-155);
  }
}













