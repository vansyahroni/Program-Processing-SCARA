void GUI_setup()
{
  int PosXslider = 15;
  int PosYslider = 535;
  
cp5.addToggle("START")
    .setPosition(30, 450)
      .setSize(45, 45)
      .setColorBackground(#fa8231)
       .setColorActive(#20bf6b)
     .setColorForeground(#fa8231)
      .captionLabel().setVisible(false)
    
        ;  
  cp5.addToggle("MODE")
    .setPosition(PosXslider+96, 482)
      .setSize(110, 20)
        .setMode(ControlP5.SWITCH)
        .setColorBackground(#fa8231)
        .setColorActive(#f7b731)
        .captionLabel().setVisible(false)
          ;  
  cp5.addToggle("ik")
    .setPosition(PosXslider+222, 482)
      .setSize(110, 20)
      .setMode(ControlP5.SWITCH)
        .setColorBackground(#fa8231)
        .setColorActive(#f7b731)
        .captionLabel().setVisible(false)
        ;  
//
//  cp5.addTab("sensorServoes")
//    .setColorBackground(color(0, 160, 100))
//      .setColorLabel(color(255))
//        .setColorActive(color(255, 128, 0))
//          ;
//
//  cp5.getTab("default")
//    .activateEvent(true)
//      .setLabel("Main")
//        .setId(1)
//          ;
//
//  cp5.getTab("sensorServoes")
//    .activateEvent(true)
//      .setId(2)
//        ;

  cp5.addSlider("v1")
    .setPosition(PosXslider+96, PosYslider)
  
      .setRange(0, 180)
        .setSize(235  ,20)
        
        
      .setColorForeground(#fd9644) 
      .setColorActive(#fd9644)
     .setColorBackground(#f7b731)
     
  .setColorValue(color(0, 0, 0))
        .setValue(90)
            .captionLabel().setVisible(false)
  ;

  cp5.addSlider("v2")
    .setPosition(PosXslider+96, PosYslider+(30*1))
      .setRange(0, 180)
        .setValue(90)
         .setSize(235,20)
      .setColorForeground(#fd9644) 
      .setColorActive(#fd9644)
     .setColorBackground(#f7b731)
      .setColorValue(color(0, 0, 0))
     .captionLabel().setVisible(false)
        .setFont(font18)
          ;

  cp5.addSlider("v3")
    .setPosition(PosXslider+96, PosYslider+(30*2))
      .setRange(0, 180)
        .setValue(90)
         .setSize(235,20)
      .setColorForeground(#fd9644) 
      .setColorActive(#fd9644)
     .setColorBackground(#f7b731)
      .setColorValue(color(0, 0, 0))
         
     .captionLabel().setVisible(false)
  ;


  cp5.addToggle("P1")
     .setPosition(PosXslider+96, PosYslider+(30*3))
      .setSize(110, 20)
        .setMode(ControlP5.SWITCH)
        .setColorBackground(#fa8231)
        .setColorActive(#f7b731)
        .captionLabel().setVisible(false)
        ;  
  cp5.addToggle("P2")
     .setPosition(PosXslider+222, PosYslider+(30*3))
      .setSize(110, 20)
        .setMode(ControlP5.SWITCH)
        .setColorBackground(#fa8231)
        .setColorActive(#f7b731)
        .captionLabel().setVisible(false)
        ;  


//  cp5.addSlider("KoordinatX")
//    .setPosition(PosXslider+150, PosYslider)
//      .setRange(-90, 90)
//
//        ;
//
//  cp5.addSlider("KoordinatY")
//    .setPosition(PosXslider+150, PosYslider+(20*1))
//      .setRange(0, 90)
//
//        ;
//  cp5.addSlider("cb1")
//    .setPosition(900, PosYslider+(20*1))
//      .setRange(800, 1400  )
//
//        ;
//  cp5.addSlider("cb2")
//    .setPosition(900, PosYslider+(20*2))
//      .setRange(300,400)
//
//        ;
//
//  cp5.addSlider("cb3")
//    .setPosition(900, PosYslider+(20*3))
//   .setRange(0, 1)
//
//        ;


  cp5.addTextfield("setkp")
    .setPosition(231, 342)
       .setSize(50, 30)
      .setColorBackground(#fa8231)
                .setColorActive(0) 
        .setFont(font20)
        .setFocus(true)
          .captionLabel().setVisible(false)

              ;
              
                cp5.addTextfield("KoordinatX")
    .setPosition(PosXslider+96+55, PosYslider+(30*5))
      .setSize(55, 20)
      .setColorBackground(#fa8231)
        .setFont(font20)
   
  .setColorValue(#4b6584)          //Orange
  .setColorActive(#f7b731)         //Green
  .setColorBackground(#fa8231)  //Dark Red
          .setFocus(true)
          .captionLabel().setVisible(false)
            .setColor(255)
              ;
              
                cp5.addTextfield("KoordinatY")
    .setPosition(PosXslider+222+55, PosYslider+(30*5))
      .setSize(55, 20)
        .setFont(font20)
  .setColorValue(#4b6584)          //Orange
  .setColorActive(#f7b731)         //Green
  .setColorBackground(#fa8231)  //Dark Red
          .setFocus(true)
          .captionLabel().setVisible(false)
            .setColor(255)
              ;
}



