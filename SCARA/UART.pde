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
  if (theControlEvent.isController()) {
    ReadID=theControlEvent.getController().getId();    

    //--------------------- comlist ---------------------\\

    if (theControlEvent.getController().getName()=="portComList") {
      InitSerial(theControlEvent.getController().getValue());
    }

  }
   if (theControlEvent.isFrom(RadioButton)) {
    rgb=int(theControlEvent.getValue());
  }  
  
  
  if (theControlEvent.isController()) {
    ReadID=theControlEvent.getController().getId();      

    /*
      ID 
     MAIN MODE = 1
     MODE 1    = 11
     MODE 2    = 12
     */

    //MAIN MODE //
    if (ReadID==1) { 
      MainMode+=1;
      if (MainMode==5) {
        MainMode=1;
      }
      println("MODE "+MainMode+" | SUBMODE:");
    }
    // MODE 1 //
    if (MainMode==1 && ReadID==11) {
      SubMode1+=1;
      if (SubMode1==3) {
        SubMode1=1;
      }



      println("MODE 1 | SUBMODE:"+SubMode1);
    }

    if (ReadID==112) {
      yes_no_M1S1=1;
    }
    if (ReadID==113) {
      yes_no_M1S1=2;
    }
    
    if (MainMode==1) {

      if (SubMode1==2) {

        if (ReadID==121) {
          color_counter+=1;
        }
        if (ReadID==122) {
          color_counter+=1;
        }
        if (ReadID==123) {
          color_counter+=1;
        }
        if (ReadID==124) {
          color_counter+=1;
        }
        if (ReadID==125) {
          color_counter+=1;
        }

        if (ReadID==126) {
          chose_color_go=1;
          color_counter=-1;
        }
        if (ReadID==127) {
          chose_color_go=2;
        }
        if (color_counter==5) {
          hide_rgb=1;
        }
        if (chose_color_go==2) {
          chose_color_go=0;
          color_counter=0;
          hide_rgb=2;
        }
        println("counter:",+color_counter);
      }
    }

    // MODE 2 //
    if (MainMode==2 && ReadID==12) {
      SubMode2+=1;
      if (SubMode2==4) {
        SubMode2=1;
      }
      println("MODE 2 | SUBMODE:"+SubMode2);
    }
    if (MainMode==2 && SubMode2==2) {
      remote_keyboard=ReadID;
    }



    // MODE 3 //
    if (MainMode==3 && ReadID==13) {
      SubMode3+=1;
      if (SubMode3==4) {
        SubMode3=1;
      }
      println("MODE 3 | SUBMODE:"+SubMode3);
    }

    // MODE 4 //

    if (ReadID==422) {
      _stop_pid+=1;
      if (_stop_pid==2) {
        _stop_pid=0;
      }
    }
    println(_stop_pid);

    if (_stop_pid==1&& MainMode==4 && ReadID==411) {
      SubMode4+=1;
      if (SubMode4==4) {
        SubMode4=1;
      }
      println("MODE 4 | SUBMODE:"+SubMode4);
    }

    if (ReadID==423) {
      value_setpoint=0;
      value_KP=0;
      value_KI=0;
      value_KD=0;
    }
  }
}
