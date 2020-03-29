void string_setup() {
  joint_pid[0]="SHOULDER";
  joint_pid[1]="ELBOW";
  joint_pid[2]="WIRST";

  _target_single_color[0]="THE RED COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  _target_single_color[1]="THE GREEN COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  _target_single_color[2]="THE BLUE COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  _target_single_color[3]="THE YELLOW COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  _target_single_color[4]="THE BLACK COLOR WILL BE TAKE "+"\n"+"ARE YOU SURE?";
  _target_single_color[5]="PLEASE CHOSE THE COLOR";
  _target_single_color[6]="PLEASE WAIT FOR 5 SECOND";

  target_color[0]=color(255, 0, 0);
  target_color[1]=color(0, 255, 0);
  target_color[2]=color(0, 0, 255);
  target_color[3]=color(#FFF000);
  target_color[4]=color(0, 0, 0);
  
  TextMode[0]="CHOSE MODE!";
TextMode[1]="COLOR DETECTOR";
TextMode[2]="MODE MANUAL";
TextMode[3]="MODE INVERSE ";
TextMode[4]="MODE SET PID";
}


void SETdisplay()
{

  textAlign(CENTER, CENTER);
  textFont(f16);
  fill(0);
  noStroke();
  //main

  text("90", 1080, CO-532); //Koordinat X Perhiutngan Forward Kinematic
  text("90", 1150, CO-532);//Koordinat X Perhiutngan Forward Kinematic

  ////////////////////////// MODE 1 //////////////////////////
  for(int a=0;a<=MainMode;a++){
    if(MainMode==a){
    text(TextMode[a], 185, CO-465);}
  }
  if (MainMode==1) { 
   

    //// SUB MODE 1 ////
    if (SubMode1==1) { 
      textFont(f15);
      text("SINGLE COLOR", 188, CO-369);                
      text("YES", 113, 634);
      text("NO", 213, 634);
      text("SET COLOR", 175, CO-313);  
      
      _rgb=rgb;
     if(rgb>=6){
       _rgb=5;}
       
      if (rgb>0) {
      
      for (int a=0; a<=rgb; a++) {
     
        if (rgb==a && yes_no_M1S1!=1 && yes_no_M1S1!=2) { 

          text(_target_single_color[a-1], 175, CO-188);
        }
        
          if (yes_no_M1S1==1 && rgb==a) {//yes
            yes_no_M1S1=0;
            rgb=7;
          }
           
        }
      }
        if (yes_no_M1S1==2 | yes_no_M1S1==1) {//no
          yes_no_M1S1=0;
          rgb=6;

        }
        
         for (int b=1; b<=_rgb; b++) {
           if (rgb==b) {target_single_color_fix=target_color[b-1];}
         }
           
           
           
           
      //DISPLAY//
    
      fill(target_single_color_fix);            //color targer
      textFont(f18);
      ellipse(1180, CO-473, 20, 20);          //target
      fill(255);                       
      textFont(f16);
      text("5", 1180, CO-429);              //Jumlah target
      textAlign(LEFT, CENTER);
      text("1.", 1087, CO-356);//nomor setiap target
      text("(10,20)", 1103, CO-355);//urutan target
      textAlign(CENTER, CENTER);
      text("(10,20)", 1121, CO-222);//next target

      fill(target_single_color_fix);
      ellipse(1001, CO-165, 20, 20);   //SISA 
      ellipse(1023, CO-165, 20, 20);   //SISA 

      ellipse(1141, CO-165, 20, 20);   //TERAMBIL 
      ellipse(1163, CO-165, 20, 20);   //TERAMBIL 
      fill(255);   
      text("01:34:29", 1122, 624);//Time
    }
    //// SUB MODE 2 ////
    if (SubMode1==2) {  
      text(" MULTI  COLOR ", 188, CO-369);
      text("START ", 113, CO-88);
      text("CHANGE", 213, CO-88);
      if (color_counter==-1)text("", 175, CO-313);  
      if (color_counter==0)text("SET FRIST COLOR ", 175, CO-313);  
      if (color_counter==1)text("SET SECOND COLOR", 175, CO-313);  
      if (color_counter==2)text("SET THRID COLOR", 175, CO-313);  
      if (color_counter==3)text("SET FOURTH COLOR", 175, CO-313);  
      if (color_counter==4)text("SET FIVE COLOR", 175, CO-313);  
      if (color_counter==5)text("KAKEAN ", 175, CO-313);  
      if (chose_color_go==1 )text("PLEASE WAIT FOR 5 SECOND", 175, CO-313);  
      if (chose_color_go==2)text("PLEASE CHOSE THE COLOR", 175, CO-313);  

      //DISPLAY//
        for(int a=0;a<=color_counter;a++){
      fill(255, 0, 0);                       //color targer
      ellipse(1114, CO-473, 20, 20);          //target 1
      ellipse(1144, CO-473, 20, 20);          //target 2
      fill(255);
      textFont(f18);
      text("5", 1114, CO-429);              //Jumlah target 1
      text("5", 1144, CO-429);              //Jumlah target 2
      textFont(f16);
      textAlign(RIGHT, CENTER);
      text("1.", 995, CO-356);//nomor urutan setiap target sisi kiri
      textAlign(LEFT, CENTER);
      text("(10,20)", 1004, CO-355);//urutan setiap target sisi kiri
      textAlign(RIGHT, CENTER);
      text("1.", 1089, CO-356);//nomor urutan setiap target sisi tengah
      textAlign(LEFT, CENTER);
      text("(10,20)", 1097, CO-355);//urutan setiap target sisi tengah
      textAlign(RIGHT, CENTER);
      text("1.", 1182, CO-356);//nomor urutan setiap target sisi kanan
      textAlign(LEFT, CENTER);
      text("(10,20)", 1190, CO-355);//urutan setiap target sisi kanan

      textAlign(CENTER, CENTER);
      fill(255, 255, 0);//next target
      ellipse(1090, CO-223, 20, 20);   //next target 
      fill(255);
      text("(10,20)", 1140, CO-222);//next target

      fill(255);
      ellipse(1001, CO-165, 20, 20);   //SISA Warna 1
      fill(255, 255, 0);
      ellipse(1023, CO-165, 20, 20);   //SISA Warna 2
      fill(0);
      text("5", 1001, CO-165);//Jumlah Sisa Warna 1
      text("5", 1023, CO-165);//Jumlah Sisa Warna 2
      fill(0, 255, 0);
      ellipse(1141, CO-165, 20, 20);   //TERAMBIL 
      fill(0, 255, 255);
      ellipse(1163, CO-165, 20, 20);   //TERAMBIL 
      fill(0);
      text("5", 1141, CO-165);//Jumlah Terambil Warna 1
      text("5", 1163, CO-165);//Jumlah Terambil Warna 2
      fill(255);
      text("01:34:29", 1122, 624);//Time
    }
  }

  ////////////////////////// MODE 2 //////////////////////////

  if (MainMode==2) { 
    text("MANUAL", 185, CO-465);

    //DISPLAY//
    text(value_shoulder, 1025, CO-392); //Input Shoulder
    text(value_elbow, 1115, CO-392); //Input Shoulder
    text(value_wirst, 1205, CO-392); //Input Shoulder

    text("90", 1025, CO-261); //Output Shoulder
    text("90", 1115, CO-261); //Output Shoulder
    text("90", 1205, CO-261); //Output Shoulder

    fill(255);
    textFont(f18);
    text("90"+"%", 1205, CO-194); //Akurasi
    textFont(f16);
    //// SUB MODE 1 ////

    if (SubMode2==1) { 
      fill(0);
      text("MANUAL SLIDER", 188, CO-369);
    }

    //// SUB MODE 2 ////

    if (SubMode2==2) {  
      fill(0);
      text("MANUAL TEXT", 188, CO-369);
      text(value_shoulder_text, 270, CO-294);
      text(value_elbow_text, 270, CO-235);
      text(value_wirst_text, 270, CO-177);
    }

    //// SUB MODE 1 ////

    if (SubMode2==3) {  
      fill(0);
      text("REMOTE", 188, CO-369);

      if (ReadID==231) { 
        text("YOU WILL OPERATE THE ROBOT "+"\n"+"USE REMOTE", 162, CO-206);
      }
      if (ReadID==232) { 
        text("YOU WILL OPERATE THE ROBOT "+"\n"+"USE KEYBOARD", 163, CO-206);
      }



      if (ReadID==233 ) { 
        text("YOU CAN CONTROL"+"\n"+"THE ROBOT ", 163, CO-206);
      }
    }
  }

  ////////////////////////// MODE 3 //////////////////////////

  if (MainMode==3) {
    text("INVERSE KINEMATIC", 185, CO-465);

    //// SUB MODE 1 ////

    if (SubMode3==1) {  
      text("ONE POINT", 188, CO-369);
      text("PLEASE CHOSE THE COORDINAT", 163, CO-239);


      //DISPLAY//
      fill(0);
      text(value_posX, 1137, CO-444); //Input X
      text(value_posY, 1218, CO-444); //Input Y


      text("24", 1137, CO-364); //Output X
      text("90", 1218, CO-364); //Output Y

      text("24", 1137, CO-283); //Terhitung Shoulder
      text("90", 1218, CO-283); //Terhitung Elbow

      text("24", 1137, CO-202); //Terukur Shoulder
      text("90", 1218, CO-202); //Terukur Elbow


      fill(255);
      textFont(f18);
      text("90"+"%", 1179, CO-143); //Akurasi
      textFont(f16);
    }

    //// SUB MODE 2 ////

    if (SubMode3==2) {  
      text("MULTI POINT", 188, CO-369);
      //      text("PLEASE CHOSE THE COORDINAT", 163, CO-239);
      if (ReadID==321) {
        text("START THE COORDINAT", 163, CO-239);
      } 
      if (ReadID==322) {
        text("PLEASE CHOSE THE COORDINAT", 163, CO-239);
      }

      //DISPLAY//
      fill(255);
      textAlign(RIGHT, CENTER);
      text("1.", 985, CO-447);//nomor urutan setiap target 
      textAlign(LEFT, CENTER);
      text("(10,20)", 993, CO-447);//urutan setiap target 
      textAlign(RIGHT, CENTER);
      text("1.", 1089, CO-447);//nomor urutan target terukur
      textAlign(LEFT, CENTER);
      text("(10,20)", 1097, CO-447);//urutan setiap target terukur
      textFont(f18);
      textAlign(CENTER, CENTER);
      text("90"+"%", 1215, CO-447); //Akurasi
      text("90", 1215, CO-204); //Jumlah Target
      text("90"+"%", 1215, CO-168); //Akurasi Total
      textFont(f16);
      text("01:34:29", 1122, 624);//Time
    }

    //// SUB MODE 3 ////

    if (SubMode3==3) {  
      text("KOORDINAT TEXT", 188, CO-369);
      text(value_posX_text, 270, CO-294);
      text(value_posY_text, 270, CO-235);


      //DISPLAY//
      fill(0);
      text(value_posX, 1137, CO-444); //Input X
      text(value_posY, 1218, CO-444); //Input Y

      text("24", 1137, CO-364); //Output X
      text("90", 1218, CO-364); //Output Y

      text("24", 1137, CO-283); //Terhitung Shoulder
      text("90", 1218, CO-283); //Terhitung Elbow

      text("24", 1137, CO-202); //Terukur Shoulder
      text("90", 1218, CO-202); //Terukur Elbow


      fill(255);
      textFont(f17);
      text("90"+"%", 1179, CO-143); //Akurasi
      textFont(f16);
    }
  }

  ////////////////////////// MODE 4 //////////////////////////

  if (MainMode==4) {
    text("SET PID ", 185, CO-465);

    //DISPLAY//

    textFont(f16);
    fill(0);
    text(value_KP, 1027, CO-377); //KP
    text(value_KI, 1117, CO-377); //KI
    text(value_KD, 1207, CO-377); //KD
    textFont(f17);
    fill(255);
    text(value_setpoint, 1207, CO-324); //Set Point
    text("24", 1207, CO-290); // Value P
    text("24", 1207, CO-257); // Value I
    text("24", 1207, CO-225); // Value D
    text("24", 1207, CO-192) ;//value PID
    text("90"+" s", 1207, CO-159); // rise time
    text("90"+"%", 1207, CO-128); // akurasi
    text("STABIL", 1207, CO-95); // keterangan
    textFont(f16);
    //// SUB MODE 3 ////
    fill(0);

    for (int a=1; a<=SubMode4; a++) {
      if (SubMode4==a) {
        text(joint_pid[a-1], 246, CO-331);
        fill(255);
        textFont(f17);
        text(joint_pid[a-1], 1185, CO-474); //Joint
        textFont(f16);
      }
    }

    fill(0);
    text(value_setpoint, 246, CO-287);
    text(value_KP, 246, CO-245);
    text(value_KI, 246, CO-200);
    text(value_KD, 246, CO-155);
  }
}
}
