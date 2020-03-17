String pn;
void setup_UART()
{
  //Comport List Selection                   
  commListbox = cp5.addListBox("portComList", 20, 720-550, 285, 200); // make a listbox and populate it with the available comm ports
commListbox.setColorLabel(0);
commListbox.setItemHeight(15);
  commListbox.setBarHeight(15);
  commListbox.captionLabel().set("PORT COM");
  commListbox.setColorBackground(#80a2a3);
  commListbox.setColorForeground(#F75C57);
    commListbox.setColorActive(#F75C57);

  for (int i=0; i<Serial.list ().length; i++) 
  {

     pn = shortifyPortName(Serial.list()[i], 13);
    if (pn.length() >0 ) commListbox.addItem(pn, i); // addItem(name,value)
    commListMax = i;
  }

  commListbox.addItem("Close Comm", ++commListMax); // addItem(name,value)
  // text label for which comm port selected
   
  txtlblWhichcom = cp5.addTextlabel("txtlblWhichcom", "No Port Selected", 163, 720-565); // textlabel(name,text,x,y)
  txtlblWhichcom.setColorValue(0); 
}




void serialEvent (Serial usbPort) 
{
  try {
    String usbString = usbPort.readStringUntil ('\n');

    if (usbString != null) 
    {
      usbString = trim(usbString);
      //    println(usbString); //--> for debuging
    }

    float data[] = float(split(usbString, ','));
    //for (int sensorNum = 1; sensorNum < data.length; sensorNum++) { println(sensorNum + " " + data[sensorNum]);  } //--> for debuging
//
//      fs=data[1];
//    fe=data[2];
//    fw=data[3];
//    
//    rs=data[4];
//    re=data[5];
//    rw=data[6];
//    rp1=data[7];
//    rp2=data[8];
  }
  catch(RuntimeException e)
  {
    println("Serial event is not null");
  }
}


//initialize the serial port selected in the listBox
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

int background;
int rgb=0;
void controlEvent(ControlEvent theControlEvent)
{
  if (theControlEvent.isGroup()) if (theControlEvent.name()=="portComList") InitSerial(theControlEvent.group().value()); // initialize the serial port selected
  
  if(theControlEvent.isFrom(RadioButton)) {
    print("got an event from "+theControlEvent.getName()+"\t");
    for(int i=0;i<theControlEvent.getGroup().getArrayValue().length;i++) {
      print(int(theControlEvent.getGroup().getArrayValue()[i]));
    }
  rgb=int(theControlEvent.getValue());
  yes_no=3;
  }  

  
}



