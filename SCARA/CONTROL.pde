void SETcontrol()
{
  cp5 = new ControlP5(this);    
  //--------------------- main control ---------------------\\

  /*untuk pindah mode utama
   1. Mode Color Detector
   2. Mode Manual
   3. Mode Invers
   4. Mode Set PID
   */

  cp5.addButton("main_mode")  //MAIN MODE
    .setId(1)
    .setPosition(20, CO-480)
    .setSize(40, 40)
    .setColorBackground(c_merah)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_terang) 
    .setLabelVisible(false) 
    .update()
    ;
  //--------------------- mode 1 ---------------------\\

  cp5.addButton("color_mode") //CONTROL SUB MODE
    .setId(11)
    .setPosition(40, CO-396)
    .setSize(43, 43)
    .setColorBackground(c_merah)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    .hide()

    ;

  //--------------------- mode 1 sub mode 1---------------------\\

  RadioButton= cp5.addRadioButton("radiobutton_rgb") //select color
    .setPosition(58, CO-266)
    .setSize(28, 27)
    .setColorActive(c_hijau_dasar)
    .setColorBackground(c_hijau_sedang) 
    .setColorForeground(c_hijau_sedang) 
    .setItemsPerRow(5)
    .setSpacingColumn(22)
    .addItem("red", 1)
    .addItem("green", 2)
    .addItem("blue", 3)
    .addItem("yellow", 4)
    .addItem("black", 5)
    .hideLabels() 
    .hide()
    ;


  cp5.addButton("M1S1_yes") //action yes
    .setPosition(95, CO-138)
    .setSize(35, 36)
    .setId(112)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    .hide()
    ;

  cp5.addButton("M1S1_no") //action no
    .setPosition(195, CO-138)
    .setSize(35, 36)
    .setId(113)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    .hide()
    ;

  //--------------------- mode 1 sub mode 2 ---------------------\\

  cp5.addButton("chose_red") //chose red
    .setPosition(56, CO-263)
    .setSize(31, 22)
    .setId(121)
    .setColorBackground(c_merah)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setLabelVisible(false) 
    .hide()
    ;

  cp5.addButton("chose_green")//chose green
    .setPosition(106, CO-263)
    .setSize(31, 22)
    .setId(122)
    .setColorBackground(c_GREEN)
    .setColorActive(c_GREEN) 
    .setColorForeground(c_GREEN) 
    .setLabelVisible(false) 
    .hide()
    ;

  cp5.addButton("chose_blue") //choses blue
    .setPosition(156, CO-263)
    .setSize(31, 22)
    .setId(123)
    .setColorBackground(c_BLUE)
    .setColorActive(c_BLUE) 
    .setColorForeground(c_BLUE) 
    .setLabelVisible(false) 
    .hide()
    ;

  cp5.addButton("chose_yellow") //chose yellow
    .setPosition(206, CO-263)
    .setSize(31, 22)
    .setId(124)
    .setColorBackground(c_YELLOW)
    .setColorActive(c_YELLOW) 
    .setColorForeground(c_YELLOW) 
    .setLabelVisible(false) 
    .hide()
    ;

  cp5.addButton("chose_black") //chose black
    .setPosition(256, CO-263)
    .setSize(27, 22)
    .setId(125)
    .setColorBackground(c_hitam)
    .setColorActive(c_hitam) 
    .setColorForeground(c_hitam) 
    .setLabelVisible(false) 
    .hide()
    ;

  cp5.addButton("chose_color_start") //action start
    .setPosition(95, CO-138)
    .setSize(35, 36)
    .setId(126)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    .hide()
    ;
  cp5.addButton("chose_color_change") //action change
    .setPosition(195, CO-138)
    .setSize(35, 36)
    .setId(127)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    .hide()
    ;              


  //--------------------- mode 2 ---------------------\\

  cp5.addButton("manual_mode") //CONTROL SUB MODE
    .setId(12)
    .setPosition(40, CO-396)
    .setSize(43, 43)
    .setColorBackground(c_merah)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    .update()
    ;

  //--------------------- mode 2 sub mode  1---------------------\\

  cp5.addSlider("m2s1_shoulder") //slider shoulder
    .setPosition(41, CO-307)
    .setRange(0, 180)
    .setSize(243, 27)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setColorValue(color(0, 0, 0))
    .setValue(90)
    .setLabelVisible(false) 
    ;

  cp5.addSlider("m2s1_elbow") //slider elbow
    .setPosition(41, CO-249)
    .setRange(0, 180)
    .setSize(243, 27)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setColorValue(color(0, 0, 0))
    .setValue(90)
    .setLabelVisible(false) 
    ;

  cp5.addSlider("m2s1_wirst") //slider wirst
    .setPosition(41, CO-190)
    .setRange(0, 180)
    .setSize(243, 27)
    .setLabelVisible(false) 
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setColorValue(color(0, 0, 0))
    .setValue(90)

    ;

  cp5.addToggle("up_down") //toggle up/down
    .setPosition(55, CO-133)
    .setSize(94, 27)
    .setValue(true)
    .setId(214)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setMode(ControlP5.SWITCH)
    .setLabelVisible(false) 
    ;

  cp5.addToggle("gripper") //toggle gripper
    .setPosition(177, CO-133)
    .setSize(94, 27)
    .setValue(true)
    .setId(215)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setMode(ControlP5.SWITCH)
    .setLabelVisible(false) 
    ;

  //--------------------- mode 2 sub mode  2 ---------------------\\

  cp5.addTextfield("m2s2_shoulder") //text shoulder
    .setPosition(163, CO-307)
    .setSize(61, 27)
    .setFont(f20)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setLabelVisible(false) 
    .setFocus(true)
    .setColor(c_putih)
    .setAutoClear(true)
    .setCaptionLabel("") 
    ;

  cp5.addTextfield("m2s2_elbow") //text elbow
    .setPosition(163, CO-249)
    .setSize(61, 27)
    .setFont(f20)
    .setLabelVisible(false) 
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setFocus(true)
    .setAutoClear(true)
    .setColor(c_putih)
    .setCaptionLabel("") 
    ;

  cp5.addTextfield("m2s2_wirst") //text wirst
    .setPosition(163, CO-190)
    .setSize(61, 27)
    .setLabelVisible(false) 
    .setFont(f20)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setFocus(true)
    .setAutoClear(true)
    .setColor(c_putih)
    .setCaptionLabel("") 
    ;

  //--------------------- mode 2 sub mode  3 ---------------------\\

  cp5.addButton("remote") //chose remote
    .setPosition(55, CO-307)
    .setSize(94, 27)
    .setLabel("changeBackground")
    .setId(231)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    ;

  cp5.addButton("keyboard") //chose keyboard
    .setPosition(177, CO-307)
    .setSize(94, 27)
    .setId(232)
    .setLabel("changeBackground")
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    ;

  cp5.addButton("M2SM3OK") //action ok
    .setPosition(116, CO-133)
    .setSize(94, 27)
    .setId(233)
    .setLabel("changeBackground")
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    ;

  //--------------------- mode 3 ---------------------\\

  cp5.addButton("ik_mode") //CONTROL SUB MODE
    .setId(13)
    .setPosition(40, CO-396)
    .setSize(43, 43)
    .setColorBackground(c_merah)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    ;

  //--------------------- mode 3 sub mode  2---------------------\\

  cp5.addButton("start_trajectory") //action start
    .setId(321)
    .setPosition(55, CO-133)
    .setSize(94, 27)
    .setColorBackground(c_merah)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    ;

  cp5.addButton("reset_trajectory") //action reset
    .setId(322)
    .setPosition(170, CO-133)
    .setSize(94, 27)
    .setColorBackground(c_merah)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    ;
  //--------------------- mode 3 sub mode  3---------------------\\
  cp5.addTextfield("m3s3_posX")//text pos X
    .setPosition(163, CO-307)
    .setSize(61, 27)
    .setFont(f20)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setFocus(true)
    .setColor(c_putih)
    .setCaptionLabel("") 
    ;

  cp5.addTextfield("m3s3_posY") //text pos Y
    .setPosition(163, CO-249)
    .setSize(61, 27)
    .setFont(f20)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setFocus(true)
    .setCaptionLabel("") 
    .setColor(c_putih)
    ;


  //--------------------- mode 4 --------------------\\

  cp5.addButton("jointPID") //set joint pid
    .setPosition(155, CO-341)
    .setSize(36, 19)
    .setId(411)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setLabelVisible(false) 
    ;  

  cp5.addTextfield("text_setpoint") //text set point
    .setPosition(155, CO-296)
    .setSize(36, 19)
    .setFont(f20)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setFocus(true)
    .setColor(c_putih)
    .setCaptionLabel("") 
    ;

  cp5.addTextfield("text_KP") //text kp
    .setPosition(155, CO-254)
    .setSize(36, 19)
    .setFont(f20)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setFocus(true)
    .setColor(c_putih)
    .setCaptionLabel("") 
    ;

  cp5.addTextfield("text_KI") //text ki
    .setPosition(155, CO-209)
    .setSize(36, 19)
    .setFont(f20)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setFocus(true)
    .setColor(c_putih)
    .setCaptionLabel("") 
    ;

  cp5.addTextfield("text_KD") //text kd
    .setPosition(155, CO-164)
    .setSize(36, 19)
    .setFont(f20)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_merah) 
    .setFocus(true)
    .setColor(c_putih)
    .setCaptionLabel("") 
    ;


  cp5.addButton("start_pid") //action start
    .setPosition(98, CO-106)
    .setSize(27, 27)
    .setId(421)
    .setLabel("changeBackground")
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    ;


  cp5.addButton("stop_pid") //action stop
    .setPosition(149, CO-106)
    .setSize(27, 27)
    .setId(422)
    .setLabel("changeBackground")
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    ;


  cp5.addButton("reset_pid") //action reset
    .setPosition(201, CO-106)
    .setSize(27, 27)
    .setId(423)
    .setLabel("changeBackground")
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    ;

  //--------------------- mode grafik/ obj --------------------\\

  cp5.addButton("graph_obj") //chose graph or obj
    .setPosition(385, CO-264)
    .setSize(40, 40)
    .setId(2)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    .hide()
    ;

  //--------------------- mode grafik --------------------\\
  myChart = cp5.addChart("grafik")
    .setPosition(439, CO-264)
    .setSize(456, 231)
    .setRange(-20, 20)
    .setView(Chart.AREA) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED

    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    ;

  myChart.addDataSet("grafik");
  myChart.setData("grafik", new float[100]);

  //--------------------- mode obj --------------------\\

  cp5.addButton("view_obj1") //set view 1
    .setPosition(385, CO-177)
    .setSize(40, 40)
    .setId(21)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    .hide()
    ;

  cp5.addButton("view_obj2") //set view2
    .setPosition(385, CO-90)
    .setSize(40, 40)
    .setId(22)
    .setColorBackground(c_hijau_sedang)
    .setColorActive(c_merah) 
    .setColorForeground(c_hijau_sedang) 
    .setLabelVisible(false) 
    .hide()
    ;

  MainMode=0;
}
