String pn;
void setup_UART()
{

  commListbox = cp5.addListBox("portComList", 20, CO-561, 285, 200); // make a listbox and populate it with the available comm ports
  commListbox.setColorLabel(0);
  commListbox.setItemHeight(15);
  commListbox.setBarHeight(15);
  commListbox.setCaptionLabel("PORT COM");
  commListbox.setColorBackground(c3);
  commListbox.setColorForeground(c5);
  commListbox.setColorActive(c5);
  commListbox.close();

  for (int i=0; i<Serial.list ().length; i++) 
  {

    pn = shortifyPortName(Serial.list()[i], 13);
    if (pn.length() >0 ) commListbox.addItem(pn, i); // addItem(name,value)
    commListMax = i;
  }

  commListbox.addItem("Close Comm", ++commListMax); // addItem(name,value)

  txtlblWhichcom = cp5.addTextlabel("txtlblWhichcom", "No Port Selected", 163, 720-561); // textlabel(name,text,x,y)
  txtlblWhichcom.setColorValue(0);
}



void serialEvent (Serial usbPort) 
{
  try {
    String usbString = usbPort.readStringUntil ('\n');

    if (usbString != null) 
    {
      usbString = trim(usbString);
    }

    float data[] = float(split(usbString, ','));
  }
  catch(RuntimeException e)
  {
    println("Serial event is not null");
  }
}



void InitSerial( float portValue) 
{
  if (portValue < commListMax) {

    String portPos = Serial.list()[int(portValue)];
    txtlblWhichcom.setValue("Connected = " + shortifyPortName(portPos, 8));
    serial = new Serial(this, portPos, 115200);
    serial.bufferUntil('\n');
    serial_conect=1;
  } else 
  {
    txtlblWhichcom.setValue("Not Connected");
    serial.clear();
    serial.stop();
    serial_conect=0;
  }
}

String shortifyPortName(String portName, int maxlen)  
{
  String shortName = portName;
  if (shortName.startsWith("/dev/")) shortName = shortName.substring(5);  
  if (shortName.startsWith("tty.")) shortName = shortName.substring(4); // get rid off leading tty. part of device name
  if (portName.length()>maxlen) shortName = shortName.substring(0, (maxlen-1)/2) + "~" +shortName.substring(shortName.length()-(maxlen-(maxlen-1)/2));
  if (shortName.startsWith("cu.")) shortName = "";// only collect the corresponding tty. devices
  return shortName;
}

void controlEvent(ControlEvent theControlEvent)
{

  if (theControlEvent.isFrom(RadioButton)) {
    rgb=int(theControlEvent.getValue());
   
    if (rgb==1) {
      _MultiColor="RED";
    }
    if (rgb==2) {
      _MultiColor="GREEN";
    }
    if (rgb==3) {
      _MultiColor="BLUE";
    }
    if (rgb==4) {
      _MultiColor="YELLOW";
    }
    if (rgb==5) {
      _MultiColor="BLACK";
    }
    println("Mode: "+MainMode +" SubMode: "+SubMode1+" Color: "+_MultiColor+" Action: "+MultiColorAction);
  }  

  if (theControlEvent.isController()) {
    //--------------------- comlist ---------------------\\

    if (theControlEvent.getController().getName()=="portComList") {
      InitSerial(theControlEvent.getController().getValue());
    }




    if (theControlEvent.isController()) {
      ReadID=theControlEvent.getController().getId();      
println(ReadID);
      /*
      ID 
       MAIN MODE = 1
       MODE 1    = 11
       MODE 2    = 12
       */

      //MAIN MODE //
      if (ReadID==1 && start_pid==0 &&  yes_no_M1S1!=1 && chose_color_go!=1 ) { 
        MainMode+=1;
        if (MainMode==5) {
          MainMode=1;
        }
        println("Mode: "+MainMode);
      }
      // MODE 1 //

      if (MainMode==1 && ReadID==11) {
        SubMode1+=1;
        if (SubMode1==3) {
          SubMode1=1;
        }
      }


      if (MainMode==1) {
//--------------------- SINGLE COLOR ---------------------\\

//add radio button on top this program//

        if (ReadID==112 && yes_no_M1S1!=2) {
           
          rgb=0;
          yes_no_M1S1=1;
        
        }
        if (ReadID==113 ) {
           
        rgb=0;
          yes_no_M1S1=2;
          
        }
        
                
//--------------------- MULTI COLOR ---------------------\\
        if (SubMode1==2) {
          

          if (ReadID==121) {
            _MultiColor="RED";
            color_counter+=1;
            _ColorMultiColor=#F75C57;
          multicolorhide1=1;
         
          }
          if (ReadID==122) {
            _MultiColor="GREEN";
            color_counter+=1;
             _ColorMultiColor=#009B4C;
           multicolorhide2=1;
          }
          if (ReadID==123) {
            _MultiColor="BLUE";
            color_counter+=1;
             _ColorMultiColor=#2F318B;
          multicolorhide3=1;
          }
          if (ReadID==124) {
            _MultiColor="YELLOW";
            color_counter+=1;
             _ColorMultiColor=#FFF000;
        multicolorhide4=1;
           }
          if (ReadID==125) {
            _MultiColor="BLACK";
            _ColorMultiColor=#332C2B;
       multicolorhide5=1;
            color_counter+=1;
             _ColorMultiColor=color(0,0,0);
          }

          if (ReadID==126) {
            MultiColorAction="START";

            chose_color_go=1;
            color_counter=-1;
          }
          if (ReadID==127) {
            MultiColorAction="CHANGE";
            
            chose_color_go=2;
            
            multicolorhide1=0;
            multicolorhide2=0;
            multicolorhide3=0;
            multicolorhide4=0;
            multicolorhide5=0;
          
for(int a=0;a<=4;a++){
  ColorMultiColor[a]=#53666A;
}
for(int a=0;a<=4;a++){
  ColorMultiColor2[a]=#BDDBDB;
}
          }
          if (color_counter==5) {
            hide_rgb=1;
          }
          if (chose_color_go==2) {
            chose_color_go=0;
            color_counter=0;
            hide_rgb=2;
          }
          
          for(int b=1;b<=color_counter;b++){
            for(int c=121;c<=ReadID;c++){
              if(color_counter==b && ReadID==c){
                ColorMultiColor[b-1]= _ColorMultiColor;
                ColorMultiColor2[b-1]= _ColorMultiColor;
                
              }
             
            }
          }
        }
      }
    
      

      // MODE 2 //
      if (MainMode==2 && ReadID==12) {
        SubMode2+=1;
        if (SubMode2==4) {
          SubMode2=1;
        }
      }
      if (MainMode==2 && SubMode2==3) {
        if(ReadID==231){
          remote_keyboard=1;}
          if(ReadID==232){
            remote_keyboard=2;}
      }



      // MODE 3 //
      if (MainMode==3 && ReadID==13) {
        SubMode3+=1;
        if (SubMode3==4) {
          SubMode3=1;
        }
      }

      // MODE 4 //

    

      if (ReadID==411) {
        SubMode4+=1;
        if (SubMode4==4) {
          SubMode4=1;
        }
      }

      if (ReadID==423) {
        value_setpoint=0;
        value_KP=0;
        value_KI=0;
        value_KD=0;
      }
      
      if (ReadID==421) {
        start_pid=1;
      }
       if (ReadID==422) {
        start_pid=0;
      }
      
      
    
    
    //single color//
    if(MainMode==1){
    if (yes_no_M1S1==1) {
          MultiColorAction="YES";
        }
        if (yes_no_M1S1==2) {
          MultiColorAction="NO";
        }
   if (yes_no_M1S1==0) {
          MultiColorAction="";
        }
            println("Mode: "+MainMode +" SubMode: "+SubMode1+" Color: "+_MultiColor+ " Action: "+MultiColorAction);
    }
          
  

  
    }
  }
}
