void controlGO() {
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  noStroke();

  textFont(f18);
  fill(c_hitam);
  text("CHOSE MODE", 185, CO-460); 
  textFont(f16);
  //--------------------- mode 1 sub mode  1 ---------------------\\

  if (MainMode==1 )
  { 
    text("MODE COLOR DETECTOR", 187, CO-390);
    if (SubMode1==0) {
      text("SELECT MODE", 188, CO-369);
    }

    if (SubMode1==1 | SubMode1==2) {
      cp5.getController("manual_mode").hide();

      //draw ellipse for chose the color//
      pushMatrix();
      translate(0, 0, 1);
      fill(c_RED);
      ellipse(72, CO-252, 40, 40);
      fill(c_GREEN);
      ellipse(122, CO-252, 40, 40);
      fill(c_BLUE);
      ellipse(172, CO-252, 40, 40);
      fill(c_YELLOW);
      ellipse(222, CO-252, 40, 40);
      fill(c_BLACK);
      ellipse(272, CO-252, 40, 40);
      fill(c_BLACK);
      popMatrix();
    }

    hideMode2A();
    hideMode2B();
    hideMode2C();
    hideMode3A();
    hideMode3B();
    hideMode3C();
    hideMode4();
    if (m1s1_action==1 | m1s2_action==1) {  
      cp5.getController("color_mode").hide();
    } else {
      cp5.getController("color_mode").show();
    }


    if (SubMode1==1) //SINGLE COLOR
    {   
//--------- CONTROL --------- //
      image(dis_m1s1, 1115, CO-307);
      hideMode1B();
      cp5.getController("color_mode").show();
      cp5.getController("M1S1_no").show();
      cp5.getController("M1S1_yes").show();

      fill(c_hitam);
      text("SINGLE COLOR", 188, CO-369);    
      text("YES", 113, 634);
      text("NO", 213, 634);
      text("SET COLOR", 175, CO-313);  

      if (m1s1_action==1) { 
        text("PLEASE WAIT FOR 5 SECOND", 175, CO-188);
        cp5.getGroup("radiobutton_rgb").hide();
      } else 
        cp5.getGroup("radiobutton_rgb").show();

        if (m1s1_rgb>0) {
          for (int a=0; a<=m1s1_rgb; a++) {
            if (m1s1_rgb==a ) { 
              m1s1_action=0;
              text(m1s1_s_target[a-1], 175, CO-188);
              _m1s1_c_target= m1s1_c_target[a-1];
            }
          }
        }
        
        //--------- DISPLAY --------- //
      fill(_m1s1_c_target);  
      ellipse(1180, CO-473, 20, 20);          //target ellipse
      
      fill(c_putih);                       
      textFont(f18);
      text("5", 1180, CO-429);              //Jumlah target
      
      textFont(f16);
      textAlign(LEFT, CENTER);
      text("1.", 1087, CO-356);//nomor setiap target
      text("(10,20)", 1103, CO-355);//urutan target
      
      textFont(f18);
      textAlign(CENTER, CENTER);
      text("(10,20)", 1121, CO-222);//next target

      fill(_m1s1_c_target);
      ellipse(1001, CO-165, 20, 20);   //SISA 
      ellipse(1023, CO-165, 20, 20);   //SISA 

      ellipse(1141, CO-165, 20, 20);   //TERAMBIL 
      ellipse(1163, CO-165, 20, 20);   //TERAMBIL 
      
      fill(c_putih);   
      text("01:34:29", 1122, 624);//Time

        if (m1s1_action==2) {//no
          text("PLEASE CHOSE THE COLOR", 175, CO-188);
          _m1s1_c_target=c_hijau_dasar;
        }
      

      
    }


    if (SubMode1==2) //MULTI COLOR
    { 
      text("MULTI COLOR", 188, CO-369); 
      text("START", 113, CO-88);
      text("CHANGE", 213, CO-88);


      text("SELECTED COLOR", 175, CO-205);

      image(dis_m1s1, 1115, CO-307);
      cp5.getController("color_mode").show();
      hideMode1A();


      cp5.getController("chose_color_start").show();
      cp5.getController("chose_color_change").show();

      if (m1s2_c_off[0]==1) {
        cp5.getController("chose_red").hide();
      }
      if (m1s2_c_off[1]==1) {
        cp5.getController("chose_green").hide();
      }
      if (m1s2_c_off[2]==1) {
        cp5.getController("chose_blue").hide();
      }
      if (m1s2_c_off[3]==1) {
        cp5.getController("chose_yellow").hide();
      }
      if (m1s2_c_off[4]==1) {
        cp5.getController("chose_black").hide();
      }

      if (m1s2_off==1 |  m1s2_action==1) {
        cp5.getController("chose_red").hide();

        cp5.getController("chose_green").hide();
        cp5.getController("chose_blue").hide();
        cp5.getController("chose_yellow").hide();
        cp5.getController("chose_black").hide();
      }

      if (m1s2_off==1 |  m1s2_action==1 | m1s2_c_off[0]==0 | m1s2_c_off[1]==0 | m1s2_c_off[2]==0 | m1s2_c_off[3]==0 | m1s2_c_off[4]==0)
      {
        cp5.getController("chose_red").show();
        cp5.getController("chose_green").show();
        cp5.getController("chose_blue").show();
        cp5.getController("chose_yellow").show();
        cp5.getController("chose_black").show();
      }


      for (int a=0; a<=m1s2_counter; a++) {

        if (m1s2_counter==a) { 
          text(m1s2_s_target[a], 175, CO-313);
        }
      }

      if (m1s2_action==1 )text("PLEASE WAIT FOR 5 SECOND", 175, CO-313);  
      if (m1s2_action==2)text("PLEASE CHOSE THE COLOR", 175, CO-313);  

      //DISPLAY//

      fill(m1s2_c_target1[0]);                       //color targer
      ellipse(1114, CO-473, 20, 20);          //target 1
      fill(m1s2_c_target1[1]);
      ellipse(1144, CO-473, 20, 20);          //target 2
      fill(m1s2_c_target1[2]);
      ellipse(1174, CO-473, 20, 20);          //target 2
      fill(m1s2_c_target1[3]);
      ellipse(1204, CO-473, 20, 20);          //target 2
      fill(m1s2_c_target1[4]);
      ellipse(1234, CO-473, 20, 20);          //target 2

      fill(m1s2_c_target2[0]);                       //color targer
      ellipse(75, CO-165, 40, 40);          //target 1
      fill(m1s2_c_target2[1]);
      ellipse(125, CO-165, 40, 40);          //target 2
      fill(m1s2_c_target2[2]);
      ellipse(175, CO-165, 40, 40);          //target 2
      fill(m1s2_c_target2[3]);
      ellipse(225, CO-165, 40, 40);          //target 2
      fill(m1s2_c_target2[4]);
      ellipse(275, CO-165, 40, 40);          //target 2




      fill(c_putih);
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
      fill(c_putih);//next target
      ellipse(1090, CO-223, 20, 20);   //next target 
      fill(c_putih);
      text("(10,20)", 1140, CO-222);//next target

      fill(c_putih);
      ellipse(1001, CO-165, 20, 20);   //SISA Warna 1
      fill(c_putih);
      ellipse(1023, CO-165, 20, 20);   //SISA Warna 2
      fill(c_hitam);
      text("5", 1001, CO-165);//Jumlah Sisa Warna 1
      text("5", 1023, CO-165);//Jumlah Sisa Warna 2
      fill(c_hitam);
      ellipse(1141, CO-165, 20, 20);   //TERAMBIL 
      fill(c_hitam);
      ellipse(1163, CO-165, 20, 20);   //TERAMBIL 
      fill(c_hitam);
      text("5", 1141, CO-165);//Jumlah Terambil Warna 1
      text("5", 1163, CO-165);//Jumlah Terambil Warna 2
      fill(c_putih);
      text("01:34:29", 1122, 624);//Time
    }
  }



  ////////////////////////// MANUAL /////////////////////////

  if (MainMode==2) 
  {     
    fill(c_hitam);
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


      cp5.getController("manual_mode").show();
      hideMode2B();
      hideMode2C();

      cp5.getController("m2s1_shoulder").show();
      cp5.getController("m2s1_elbow").show();
      cp5.getController("m2s1_wirst").show();
      cp5.getController("up_down").show();
      cp5.getController("gripper").show();

      //data//
      value_shoulder=m2s1_shoulder;
      value_elbow=m2s1_elbow;
      value_wirst=m2s1_wirst;
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
      stroke(c_hijau_dasar);
      line(246, CO-280, 299, CO-280);
      line(246, CO-222, 299, CO-222);
      line(246, CO-163, 299, CO-163);
      noStroke();



      //image(mmode2, 163, CO-237);

      cp5.getController("manual_mode").show();
      hideMode2A();
      hideMode2C();

      cp5.getController("m2s2_shoulder").show();
      cp5.getController("m2s2_elbow").show();
      cp5.getController("m2s2_wirst").show();
      cp5.getController("up_down").show();
      cp5.getController("gripper").show();

      //data//
      value_shoulder=_m2s2_shoulder;
      value_elbow=_m2s2_elbow;
      value_wirst=_m2s2_wirst;

      text(value_shoulder, 270, CO-294);
      text(value_elbow, 270, CO-235);
      text(value_wirst, 270, CO-177);
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
    //DISPLAY// 

    text(value_shoulder, 1025, CO-392); //Input Shoulder
    text(value_elbow, 1115, CO-392); //Input Shoulder
    text(value_wirst, 1205, CO-392); //Input Shoulder

    text("90", 1025, CO-261); //Output Shoulder
    text("90", 1115, CO-261); //Output Shoulder
    text("90", 1205, CO-261); //Output Shoulder

    fill(c_putih);
    textFont(f18);
    text("90"+"%", 1205, CO-194); //Akurasi
    textFont(f16);
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
      text("RESET", 217, CO-145);  
      //image(ikmode2, 163, CO-237);
      image(dis_m3s2, 1115, CO-307);
      cp5.getController("start_trajectory").show();
      cp5.getController("reset_trajectory").show();
      hideMode3A();
      hideMode3C();
    }
    if (SubMode3==3) {
      text("INPUT TEXT", 188, CO-369);
      textAlign(LEFT, CENTER);
      text("KOORDINAT X", 34, CO-294); 
      text("KOORDINAT Y", 34, CO-236); 
      textAlign(CENTER, CENTER);
      text("UP/DOWN", 96, CO-146); 
      text("GRIPPER", 218, CO-146); 
      stroke(c_hijau_dasar);
      line(239, CO-280, 292, CO-280);
      line(239, CO-222, 292, CO-222);
      noStroke();
      //image(ikmode3, 163, CO-237);
      image(dis_m3s1, 1115, CO-307);
      hideMode3B();
      cp5.getController("m3s3_posX").show();
      cp5.getController("m3s3_posY").show();
      cp5.getController("start_trajectory").show();
      cp5.getController("reset_trajectory").show();
      hideMode3A();

      //data//
      value_posX=_m3s3_posX;
      value_posY=_m3s3_posY;


      fill(c_hitam);

      text(value_posX, 1137, CO-444); //Input X
      text(value_posY, 1218, CO-444); //Input Y

      text(value_posX, 266, CO-294); //Input X
      text(value_posY, 266, CO-236); //Input Y

      text("24", 1137, CO-364); //Output X
      text("90", 1218, CO-364); //Output Y

      text("24", 1137, CO-283); //Terhitung Shoulder
      text("90", 1218, CO-283); //Terhitung Elbow

      text("24", 1137, CO-202); //Terukur Shoulder
      text("90", 1218, CO-202); //Terukur Elbow


      fill(c_putih);
      textFont(f18);
      text("90"+"%", 1179, CO-143); //Akurasi
      textFont(f16);
    }
  }


  ////////////////////////// COLOR DETECTOR /////////////////////////
  if (MainMode==4)
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
    image(dis_m4, 1115, CO-307);
    textFont(f25);
    text("MODE SET PID", 163, CO-390);  
    if ( m4_start<1) {


      textFont(f16);
      textAlign(LEFT, CENTER);
      text("SET JOINT", 40, CO-330);  
      text("SET POINT", 40, CO-287);  
      text("SET KP", 40, CO-242);  
      text("SET KI", 40, CO-197);
      text("SET KD", 40, CO-152);
      textAlign(CENTER, CENTER);


      if (SubMode4>0) {
        text("START", 111, CO-115);  
        text("STOP", 163, CO-115);  
        text("RESET", 214, CO-115);
      }


      stroke(c_hijau_dasar);
      line(205, CO-319, 288, CO-319);
      line(214, CO-277, 279, CO-277);
      line(214, CO-232, 279, CO- 232);
      line(214, CO-187, 279, CO- 187);
      line(214, CO-142, 279, CO- 142);
      noStroke();


      for (int a=1; a<=SubMode4; a++) {
        if (SubMode4==a) {
          text(m4_joint[a-1], 246, CO-331);
          fill(c_putih);
          textFont(f18);
          text(m4_joint[a-1], 1185, CO-474); //Joint
          textFont(f16);
        }
      }

      //image(pidmode, 163, CO-237);
    }



    if (SubMode4>0) {
      cp5.getController("text_setpoint").unlock();
      cp5.getController("text_KP").unlock();
      cp5.getController("text_KI").unlock();
      cp5.getController("text_KD").unlock();

      cp5.getController("start_pid").show();
      cp5.getController("stop_pid").show();
      cp5.getController("reset_pid").show();
      if ( m4_start==1) {
        cp5.getController("jointPID").hide();
        cp5.getController("text_setpoint").hide();
        cp5.getController("text_setpoint").hide();
        cp5.getController("text_KP").hide();
        cp5.getController("text_KI").hide();
        cp5.getController("text_KD").hide();
        cp5.getController("start_pid").hide();
        cp5.getController("reset_pid").hide();

        textFont(f16);
        text("STOP", 163, CO-115);  
        textFont(f20);
        text("PLEASE WAIT \n FOR THE RESPON", 159, CO-219);
        textFont(f16);
      }
    }

    if (SubMode4==0) { 
      text("CHOSE THE JOINT!", 163, CO-102);
      cp5.getController("text_setpoint").lock();
      cp5.getController("text_KP").lock();
      cp5.getController("text_KI").lock();
      cp5.getController("text_KD").lock();


      cp5.getController("stop_pid").hide();
    }


    if ( m4_start<1) {
      cp5.getController("jointPID").show();
      cp5.getController("text_setpoint").show();

      cp5.getController("text_KP").show();
      cp5.getController("text_KI").show();
      cp5.getController("text_KD").show();





      fill(c_hitam);
      text(value_setpoint, 246, CO-287); 
      text(value_KP, 246, CO-242); 
      text(value_KI, 246, CO-197); 
      text(value_KD, 246, CO-152);
    }
    textFont(f20);
    text(value_KP, 1027, CO-378); 
    text(value_KI, 1117, CO-378); 
    text(value_KD, 1207, CO-378); 
    fill(c_putih);
    text(value_setpoint, 1207, CO-324); 
    fill(c_hitam);
    textFont(f16);
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
    hideGraph();
  }

  ////////////////////////// GRAPH /////////////////////////

  if (MainMode!=0) {
    cp5.getController("graph_obj").show();//MODE1A




    fill(c_hitam);
    textFont(f14);
    text("MODE", 405, CO-213);

    pushMatrix();
    translate(0, 0, 0);
    fill(c_putih);
    textFont(f16);
    text("MODE", 844, CO-247);

    strokeWeight(3);
    stroke(c_hijau_dasar);
    fill(c_hijau_dasar);
    rect(439, CO-264, 456, 231);
    noStroke();
    pushMatrix();
    fill(c_hijau_dasar);
    translate(0, 0, 5);
    rect(794, CO-264, 101, 34, 0, 0, 0, 5);
    fill(c_hitam);
    popMatrix();
    popMatrix();

    if (graph_or_obj==1) { //obj
      if (ReadID==21) {
        viewOBJ=1;
      }
      if (ReadID==22) {
        viewOBJ=2;
      }


      println(viewOBJ);
      objGO();


      textFont(f14);
      text("VIEW 1", 405, CO-126); 
      text("VIEW 2", 405, CO-39); 

      cp5.getController("grafik").hide();//MODE1A
      cp5.getController("view_obj1").show();//MODE1A
      cp5.getController("view_obj2").show();//MODE1A

      fill(c_putih);
      pushMatrix();
      translate(0, 0, 10);
      textFont(f16);
      text("CAD 3D", 844, CO-247);
      popMatrix();
      fill(c_hitam);
      textFont(f14);
    }
    if (graph_or_obj==2) {
      textFont(f14);
      text("GRAPH 1", 405, CO-126); 
      text("RESET", 405, CO-39); 


      fill(c_putih);
      pushMatrix();
      translate(0, 0, 10);
      textFont(f16);

      text("GRAFIK", 844, CO-247);
      popMatrix();
      fill(c_hitam);
      textFont(f14);



      cp5.getController("view_obj1").show();//MODE1A
      cp5.getController("view_obj2").show();//MODE1A

      textFont(f16);
      cp5.getController("grafik").show();//MODE1A
      myChart.push("grafik", (sin(frameCount*0.1)*10));
    }
  }



  ////////////////////////// X Y /////////////////////////
  if (MainMode!=0) {
    fill(c_hijau_terang);
    ellipse(1080, CO-532, 50, 50);
    ellipse(1150, CO-532, 50, 50);
    fill(c_putih);
    textFont(f16);
    text("X", 1080, CO-569);
    text("Y", 1150, CO-569);
    fill(c_hitam);

    text("90", 1080, CO-532);
    text("21", 1150, CO-532);
  }
  fill(c_hitam);
}

void hideAllMode() {
  cp5.getController("color_mode").hide(); //mode color
  cp5.getController("manual_mode").hide(); // mode manual
  cp5.getController("ik_mode").hide(); // mode inverse
}

void hideMode1A() {
  cp5.getController("M1S1_no").hide();//MODE1A
  cp5.getController("M1S1_yes").hide();//MODE1A
  cp5.getGroup("radiobutton_rgb").hide();//MODE1A
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
  cp5.getController("m2s1_shoulder").hide(); //MODE2A
  cp5.getController("m2s1_elbow").hide();//MODE2A
  cp5.getController("m2s1_wirst").hide();//MODE2A
  cp5.getController("up_down").hide();//MODE2A
  cp5.getController("gripper").hide();//MODE2A
}

void hideMode2B() {
  cp5.getController("m2s2_shoulder").hide();//MODE2B
  cp5.getController("m2s2_elbow").hide();//MODE2B
  cp5.getController("m2s2_wirst").hide();//MODE2B
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
  cp5.getController("m3s3_posX").hide();
  cp5.getController("m3s3_posY").hide();
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

void hideGraph() {
  cp5.getController("grafik").hide();//MODE1A
  cp5.getController("graph_obj").hide();//MODE1A
  cp5.getController("view_obj1").hide();//MODE1A
  cp5.getController("view_obj2").hide();//MODE1A
}
