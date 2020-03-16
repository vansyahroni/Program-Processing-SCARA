
void GUI_setup()
{
  cp5.addBang("main_mode")
    .setPosition(20, CO-480)
      .setSize(40, 40)
        .setId(i)
          .setColorBackground(#F75C57)
            .setColorActive(#F75C57) 
              .setColorForeground(#BDDBDB) 
                .setLabelVisible(false) 
                  ;

  cp5.addBang("color_mode")
    .setPosition(40, CO-396)
      .setSize(43, 43)
        .setId(i)
          .setColorBackground(#F75C57)
            .setColorActive(#F75C57) 
              .setColorForeground(#80A2A3) 
                .setLabelVisible(false) 
                  ;


  cp5.addBang("yes")
    .setPosition(99, CO-147)
      .setSize(37, 32)
        .setId(i)
          .setColorBackground(#80A2A3)
            .setColorActive(#80A2A3) 
              .setColorForeground(#80A2A3) 
                .setLabelVisible(false) 
                  ;

  cp5.addBang("no")
    .setPosition(199, CO-147)
      .setSize(37, 32)
        .setId(i)
          .setColorBackground(#80A2A3)
            .setColorActive(#80A2A3) 
              .setColorForeground(#80A2A3) 
                .setLabelVisible(false) 
                  ;
}

