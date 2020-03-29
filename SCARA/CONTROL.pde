void SETcontrol()
{
  //--------------------- control tab ---------------------\\
  cp5.addTab("default")
    .setColorBackground(c1)
    .setColorLabel(c1)
    .setColorActive(c1)
    ;

  cp5.addTab("HIDE")
    .hide()
    ;

  cp5.getTab("default")
    .activateEvent(true) 
    ;

  cp5.getTab("HIDE")
    .activateEvent(true)
    ;
  //--------------------- main control ---------------------\\

  /*untuk pindah mode utama
   1. Mode Color Detector
   2. Mode Manual
   3. Mode Invers
   4. Mode Set PID
   */

  cp5.addBang("main_mode")  //MAIN MODE
    .setId(1)
    .setPosition(20, CO-480)
    .setSize(40, 40)
    .setColorBackground(c5)
    .setColorActive(c5) 
    .setColorForeground(c4) 
    .setLabelVisible(false) 
    .update()
    ;
  //--------------------- mode 1 ---------------------\\

  cp5.addBang("color_mode") //CONTROL SUB MODE
    .setId(11)
    .setPosition(40, CO-396)
    .setSize(43, 43)
    .setColorBackground(#F75C57)
    .setColorActive(#F75C57) 
    .setColorForeground(#80A2A3) 
    .setLabelVisible(false) 

    ;

  ////// CHOSE COLOR //////

  RadioButton= cp5.addRadioButton("M1S1_rgb") 
    .setPosition(58, CO-266)
    .setSize(28, 27)
    .setColorActive(#53666A)
    .setColorBackground(c3) 
    .setColorForeground(c3) 
    .setItemsPerRow(5)
    .setSpacingColumn(22)
    .addItem("red", 1)
    .addItem("green", 2)
    .addItem("blue", 3)
    .addItem("yellow", 4)
    .addItem("black", 5)
    .hideLabels() 
    ;


  cp5.addBang("M1S1_yes")
    .setPosition(95, CO-138)
    .setSize(35, 36)
    .setId(112)
    .setColorBackground(c3)
    .setColorActive(c5) 
    .setColorForeground(c3) 
    .setLabelVisible(false) 

    ;

  cp5.addBang("M1S1_no")
    .setPosition(195, CO-138)
    .setSize(35, 36)
    .setId(113)
    .setColorBackground(c3)
    .setColorActive(c5) 
    .setColorForeground(c3) 
    .setLabelVisible(false) 
    ;

  ////// CHOSE COLOR  2 //////

  cp5.addBang("chose_red")
    .setPosition(56, CO-263)
    .setSize(31, 22)
    .setId(121)
    .setColorBackground(c5)
    .setColorActive(c5) 
    .setColorForeground(c5) 
    .setLabelVisible(false) 
    ;

  cp5.addBang("chose_green")
    .setPosition(106, CO-263)
    .setSize(31, 22)
    .setId(122)
    .setColorBackground(#009B4C)
    .setColorActive(#009B4C) 
    .setColorForeground(#009B4C) 
    .setLabelVisible(false) 
    ;

  cp5.addBang("chose_blue")
    .setPosition(156, CO-263)
    .setSize(31, 22)
    .setId(123)
    .setColorBackground(#2F318B)
    .setColorActive(#2F318B) 
    .setColorForeground(#2F318B) 
    .setLabelVisible(false) 
    ;

  cp5.addBang("chose_yellow")
    .setPosition(206, CO-263)
    .setSize(31, 22)
    .setId(124)
    .setColorBackground(#FFF000)
    .setColorActive(#FFF000) 
    .setColorForeground(#FFF000) 
    .setLabelVisible(false) 
    ;

  cp5.addBang("chose_black")
    .setPosition(256, CO-263)
    .setSize(27, 22)
    .setId(125)
    .setColorBackground(#332C2B)
    .setColorActive(#332C2B) 
    .setColorForeground(#332C2B) 
    .setLabelVisible(false) 
    ;

  cp5.addBang("chose_color_start")
    .setPosition(95, CO-138)
    .setSize(35, 36)
    .setId(126)
    .setColorBackground(c3)
    .setColorActive(c5) 
    .setColorForeground(c3) 
    .setLabelVisible(false) 
    ;
  cp5.addBang("chose_color_change")
    .setPosition(195, CO-138)
    .setSize(35, 36)
    .setId(127)
    .setColorBackground(c3)
    .setColorActive(c5) 
    .setColorForeground(c3) 
    .setLabelVisible(false) 
    ;              


  //////////////////////// MDOE 2 ///////////////////////////

  cp5.addBang("manual_mode") //CONTROL SUB MODE
    .setId(12)
    .setPosition(40, CO-396)
    .setSize(43, 43)
    .setColorBackground(#F75C57)
    .setColorActive(#F75C57) 
    .setColorForeground(#80A2A3) 
    .setLabelVisible(false) 
    .update()
    ;

  ////// SLIDER //////

  cp5.addSlider("slider_shoulder")
    .setPosition(41, CO-307)
    .setRange(0, 180)
    .setSize(243, 27)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setColorValue(color(0, 0, 0))
    .setValue(90)
    .setLabelVisible(false) 
    ;

  cp5.addSlider("slider_elbow")
    .setPosition(41, CO-249)
    .setRange(0, 180)
    .setSize(243, 27)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setColorValue(color(0, 0, 0))
    .setValue(90)
    .setLabelVisible(false) 
    ;

  cp5.addSlider("slider_wirst")
    .setPosition(41, CO-190)
    .setRange(0, 180)
    .setSize(243, 27)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setColorValue(color(0, 0, 0))
    .setValue(90)
    .setLabelVisible(false) 
    ;

  cp5.addToggle("up_down")
    .setPosition(55, CO-133)
    .setSize(94, 27)
    .setValue(true)
    .setId(214)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setMode(ControlP5.SWITCH)
    .setLabelVisible(false) 
    ;

  cp5.addToggle("gripper")
    .setPosition(177, CO-133)
    .setSize(94, 27)
    .setValue(true)
    .setId(215)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setMode(ControlP5.SWITCH)
    .setLabelVisible(false) 
    ;

  ////// TEXT //////

  cp5.addTextfield("text_shoulder")
  .setLabelVisible(false) 
    .setPosition(163, CO-307)
    .setSize(61, 27)
    .setFont(f20)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setFocus(true)
    .setColor(255)
     
    ;

  cp5.addTextfield("text_elbow")
  .setLabelVisible(false) 
    .setPosition(163, CO-249)
    .setSize(61, 27)
    .setFont(f20)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setFocus(true)
    
    .setColor(255)
    ;

  cp5.addTextfield("text_wirst")
    .setLabelVisible(false) 
    .setPosition(163, CO-190)
    .setSize(61, 27)

    .setFont(f20)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setFocus(true)
   
    .setColor(255)
    ;

  ////// REMOTE //////

  cp5.addBang("remote")
    .setPosition(55, CO-307)
    .setSize(94, 27)
    .setLabel("changeBackground")
    .setId(231)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#80A2A3) 
    .setLabelVisible(false) 
    ;

  cp5.addBang("keyboard")
    .setPosition(177, CO-307)
    .setSize(94, 27)
    .setId(232)
    .setLabel("changeBackground")
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#80A2A3) 
    .setLabelVisible(false) 
    ;

  cp5.addBang("M2SM3OK")
    .setPosition(116, CO-114)
    .setSize(94, 27)
    .setId(233)
    .setLabel("changeBackground")
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#80A2A3) 
    .setLabelVisible(false) 
    ;

  //////////////////////// MDOE 3 ///////////////////////////

  cp5.addBang("ik_mode") //CONTROL SUB MODE
    .setId(13)
    .setPosition(40, CO-396)
    .setSize(43, 43)
    .setColorBackground(#F75C57)
    .setColorActive(#F75C57) 
    .setColorForeground(#80A2A3) 
    .setLabelVisible(false) 
    ;


  cp5.addTextfield("text_posX")
    .setPosition(163, CO-307)
    .setSize(61, 27)
    .setFont(f20)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setFocus(true)
    .setColor(255)
    ;

  cp5.addTextfield("text_posY")
    .setPosition(163, CO-249)
    .setSize(61, 27)
    .setFont(f20)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setFocus(true)
    .setColor(255)
    ;

  cp5.addBang("start_trajectory") //CONTROL SUB MODE
    .setId(321)
    .setPosition(55, CO-133)
    .setSize(94, 27)
    .setColorBackground(#F75C57)
    .setColorActive(#F75C57) 
    .setColorForeground(#80A2A3) 
    .setLabelVisible(false) 
    ;

  cp5.addBang("reset_trajectory") //CONTROL SUB MODE
    .setId(322)
    .setPosition(170, CO-133)
    .setSize(94, 27)
    .setColorBackground(#F75C57)
    .setColorActive(#F75C57) 
    .setColorForeground(#80A2A3) 
    .setLabelVisible(false) 
    ;


  cp5.addBang("jointPID")
    .setPosition(155, CO-341)
    .setSize(36, 19)
    .setId(411)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setLabelVisible(false) 
    ;  

  cp5.addTextfield("text_setpoint")
    .setPosition(155, CO-296)
    .setSize(36, 19)
    .setFont(f20)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setFocus(true)
    .setColor(255)
    ;

  cp5.addTextfield("text_KP")
    .setPosition(155, CO-254)
    .setSize(36, 19)
    .setFont(f20)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setFocus(true)
    .setColor(255)
    ;

  cp5.addTextfield("text_KI")
    .setPosition(155, CO-209)
    .setSize(36, 19)
    .setFont(f20)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setFocus(true)
    .setColor(255)
    ;

  cp5.addTextfield("text_KD")
    .setPosition(155, CO-164)
    .setSize(36, 19)
    .setFont(f20)
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#F75C57) 
    .setFocus(true)
    .setColor(255)
    ;


  cp5.addBang("start_pid")
    .setPosition(98, CO-106)
    .setSize(27, 27)
    .setId(421)
    .setLabel("changeBackground")
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#80A2A3) 
    .setLabelVisible(false) 
    ;


  cp5.addBang("stop_pid")
    .setPosition(149, CO-106)
    .setSize(27, 27)
    .setId(422)
    .setLabel("changeBackground")
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#80A2A3) 
    .setLabelVisible(false) 
    ;


  cp5.addBang("reset_pid")
    .setPosition(201, CO-106)
    .setSize(27, 27)
    .setId(423)
    .setLabel("changeBackground")
    .setColorBackground(#80A2A3)
    .setColorActive(#F75C57) 
    .setColorForeground(#80A2A3) 
    .setLabelVisible(false) 
    ;
}
