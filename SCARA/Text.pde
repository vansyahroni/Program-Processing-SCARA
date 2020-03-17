
void _text()
{
  //main mode
  textAlign(CENTER, CENTER);
  textFont(font18);
  fill(0);
  noStroke();
  text("COLOR DETECTOR", 160, CO-465);



  //color mode
  text("SINGLE COLOR", 188, CO-369);

  //perintah RGB
  
  textFont(font14);
  if (rgb==1) { 
 text("THE RED COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
  }
  if (rgb==2) { 
    text("THE GREEN COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
  }
  if (rgb==3) { 
 text("THE BLUE COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
  }
   if (rgb==4) { 
text("THE YELLOW COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
  }
   if (rgb==5) { 
text("THE BLACK COLOR WILL BE TAKE"+"\n"+"ARE YOU SURE?", 163, CO-213);
}  


}

