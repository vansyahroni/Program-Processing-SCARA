
void GUI_setup()
{
  //////////////////////// TAB ///////////////////////////
  cp5.addTab("default")
    .setColorBackground(#F0F6DC)
      .setColorLabel(#F0F6DC)
        .setColorActive(#F0F6DC)
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


  //////////////////////// MAIN CONTROL ///////////////////////////


  cp5.addBang("main_mode")  //MAIN MODE
    .setPosition(20, CO-480)
      .setSize(40, 40)
        .setId(1)
          .setColorBackground(#F75C57)
            .setColorActive(#F75C57) 
              .setColorForeground(#BDDBDB) 
                .setLabelVisible(false) 
                  ;


  //////////////////////// MDOE 1 ///////////////////////////
       
  
     
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
             
  RadioButton= cp5.addRadioButton("rgb") 
    .setPosition(49, CO-295)
      .setSize(28, 27)
        .setColorActive(#53666A)
          .setColorBackground(#80A2A3) 
            .setColorForeground(#80A2A3) 
              .setItemsPerRow(5)
                .setSpacingColumn(22)
                  .addItem("red", 1)
                    .addItem("green", 2)
                      .addItem("blue", 3)
                        .addItem("yellow", 4)
                          .addItem("black", 5)
                            .setColorLabel(#BDDBDB)
                              ;
                            

  cp5.addBang("yes")
    .setPosition(95, CO-138)
      .setSize(35, 36)
          .setColorBackground(color(0))
            .setColorActive(#80A2A3) 
              .setColorForeground(color(0)) 
                .setLabelVisible(false) 
                  ;
    
  cp5.addBang("no")
    .setPosition(195, CO-138)
      .setSize(35, 36)
          .setColorBackground(color(0))
            .setColorActive(#80A2A3) 
              .setColorForeground(color(0)) 
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
                    .captionLabel().setVisible(false)
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
                    .captionLabel().setVisible(false)
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
                    .captionLabel().setVisible(false)
                      ;

  cp5.addToggle("up_down")
    .setPosition(55, CO-133)
      .setSize(94, 27)
        .setValue(true)
          .setColorBackground(#80A2A3)
            .setColorActive(#F75C57) 
              .setColorForeground(#F75C57) 
                .setMode(ControlP5.SWITCH)
                  ;

  cp5.addToggle("gripper")
    .setPosition(177, CO-133)
      .setSize(94, 27)
        .setValue(true)
          .setColorBackground(#80A2A3)
            .setColorActive(#F75C57) 
              .setColorForeground(#F75C57) 
                .setMode(ControlP5.SWITCH)
                  ;

              ////// TEXT //////
              
  cp5.addTextfield("text_shoulder")
    .setPosition(163, CO-307)
      .setSize(61, 27)

        .setFont(font20)
          .setColorBackground(#80A2A3)
            .setColorActive(#F75C57) 
              .setColorForeground(#F75C57) 
                .setFocus(true)
                  .captionLabel().setVisible(false)
                    .setColor(255)
                      ;

  cp5.addTextfield("text_elbow")
    .setPosition(163, CO-249)
      .setSize(61, 27)

        .setFont(font20)
          .setColorBackground(#80A2A3)
            .setColorActive(#F75C57) 
              .setColorForeground(#F75C57) 
                .setFocus(true)
                  .captionLabel().setVisible(false)
                    .setColor(255)
                      ;

  cp5.addTextfield("text_wirst")
    .setPosition(163, CO-190)
      .setSize(61, 27)

        .setFont(font20)
          .setColorBackground(#80A2A3)
            .setColorActive(#F75C57) 
              .setColorForeground(#F75C57) 
                .setFocus(true)
                  .captionLabel().setVisible(false)
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

  cp5.addBang("mmode3ok")
    .setPosition(116, CO-114)
      .setSize(94, 27)
        .setId(232)
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
}



