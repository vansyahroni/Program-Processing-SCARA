
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


  cp5.addToggle("start")
    .setPosition(266, CO-480)
      .setSize(40, 40)
        .setColorActive(#81BF34)
          .setColorBackground(#BDDBDB) 
            .setColorForeground(#BDDBDB) 
              .setLabelVisible(false) 
                ;
                
                
                  cp5.addToggle("red")
    .setPosition(48, CO-305)
      .setSize(30, 26)
        .setColorActive(#F75C57)
          .setColorBackground(#F75C57) 
            .setColorForeground(#F75C57) 
              .setLabelVisible(false) 
                ;
                  cp5.addToggle("green")
    .setPosition(98, CO-305)
      .setSize(30, 26)
        .setColorActive(#009B4C)
          .setColorBackground(#009B4C) 
            .setColorForeground(#009B4C) 
              .setLabelVisible(false) 
                ;
                  cp5.addToggle("blue")
    .setPosition(148, CO-305)
      .setSize(30, 26)
        .setColorActive(#2F318B)
          .setColorBackground(#2F318B) 
            .setColorForeground(#2F318B) 
              .setLabelVisible(false) 
                ;
                  cp5.addToggle("yellow")
    .setPosition(198, CO-305)
      .setSize(30, 26)
        .setColorActive(#FFF000)
          .setColorBackground(#FFF000) 
            .setColorForeground(#FFF000) 
              .setLabelVisible(false) 
                ;
                  cp5.addToggle("black")
    .setPosition(248, CO-305)
      .setSize(30, 26)
        .setColorActive(#332C2B)
          .setColorBackground(#332C2B) 
            .setColorForeground(#332C2B) 
              .setLabelVisible(false) 
                ;
                
                
                
                
}

