
void GUI_setup()
{

  cp5.addTab("default")
    .setColorBackground(#F0F6DC)
      .setColorLabel(#F0F6DC)
        .setColorActive(#F0F6DC)
          ;

  cp5.addTab("HIDE")
    .setColorBackground(color(0, 160, 100))
      .setColorLabel(color(255))
        .setColorActive(color(255, 128, 0))
          .hide()
            ;

  cp5.getTab("default")
    .activateEvent(true) 
    ;


  cp5.getTab("HIDE")
    .activateEvent(true)
    ;


  /////////////////////////////////////////


  cp5.addBang("main_mode")
    .setPosition(20, CO-480)
      .setSize(40, 40)
        .setId(1)
          .setColorBackground(#F75C57)
            .setColorActive(#F75C57) 
              .setColorForeground(#BDDBDB) 
                .setLabelVisible(false) 
                  ;

  cp5.addBang("color_mode")
    .setPosition(40, CO-396)
      .setSize(43, 43)
        .setId(2)
          .setColorBackground(#F75C57)
            .setColorActive(#F75C57) 
              .setColorForeground(#80A2A3) 
                .setLabelVisible(false) 
                  ;


  cp5.addBang("yes")
    .setPosition(99, CO-147)
      .setSize(37, 32)
        .setLabel("changeBackground")

          .setColorBackground(#80A2A3)
            .setColorActive(#80A2A3) 
              .setColorForeground(#80A2A3) 
                .setLabelVisible(false) 
                  ;

  cp5.addBang("no")
    .setPosition(199, CO-147)
      .setSize(37, 32)
        .setLabel("changeBackground")

          .setColorBackground(#80A2A3)
            .setColorActive(#80A2A3) 
              .setColorForeground(#80A2A3) 


                .setLabelVisible(false) 
                  ;




  cp5.addToggle("start")
    .setPosition(266, CO-480)
      .setSize(40, 40)
        .setColorActive(#81BF34)
          .setColorBackground(#BDDBDB) 
            .setColorForeground(#BDDBDB) 
              .setLabelVisible(false) 
                ;




  RadioButton= cp5.addRadioButton("rgb")
    .setPosition(49, CO-295)
      .setSize(28, 27)
        .setColorActive(#53666A)
          .setColorBackground(#80A2A3) 
            .setColorForeground(#80A2A3) 
              .setItemsPerRow(5)
                .setSpacingColumn(22)
                  .addItem("50", 1)
                    .addItem("100", 2)
                      .addItem("150", 3)
                        .addItem("200", 4)
                          .addItem("250", 5)
                            .setColorLabel(#BDDBDB)
                              ;


  cp5.addBang("manual_mode")
    .setPosition(40, CO-396)
      .setSize(43, 43)
        .setId(3)
          .setColorBackground(#F75C57)
            .setColorActive(#F75C57) 
              .setColorForeground(#80A2A3) 
                .setLabelVisible(false) 
                  ;


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





  cp5.addBang("ik_mode")
    .setPosition(40, CO-396)
      .setSize(43, 43)
        .setId(3)
          .setColorBackground(#F75C57)
            .setColorActive(#F75C57) 
              .setColorForeground(#80A2A3) 
                .setLabelVisible(false) 
                  ;
}

