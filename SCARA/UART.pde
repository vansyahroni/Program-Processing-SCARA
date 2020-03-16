String pn;
void setup_UART()
{
  //Comport List Selection                   
  commListbox = cp5.addListBox("portComList", 10, 270, 320, 200); // make a listbox and populate it with the available comm ports
commListbox.setColorLabel(0);
commListbox.setItemHeight(20);
  commListbox.setBarHeight(20);
  commListbox.captionLabel().set("PORT COM");
  commListbox.setColorBackground(#fa8231);
  commListbox.setColorForeground(#f7b731);
    commListbox.setColorActive(#f7b731);

  for (int i=0; i<Serial.list ().length; i++) 
  {

     pn = shortifyPortName(Serial.list()[i], 13);
    if (pn.length() >0 ) commListbox.addItem(pn, i); // addItem(name,value)
    commListMax = i;
  }

  commListbox.addItem("Close Comm", ++commListMax); // addItem(name,value)
  // text label for which comm port selected
   
  txtlblWhichcom = cp5.addTextlabel("txtlblWhichcom", "No Port Selected", 220, 230); // textlabel(name,text,x,y)
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

      fs=data[1];
    fe=data[2];
    fw=data[3];
    
    rs=data[4];
    re=data[5];
    rw=data[6];
    rp1=data[7];
    rp2=data[8];
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
void controlEvent(ControlEvent theControlEvent)
{
  if (theControlEvent.isGroup()) if (theControlEvent.name()=="portComList") InitSerial(theControlEvent.group().value()); // initialize the serial port selected
  
  
 

  
}


