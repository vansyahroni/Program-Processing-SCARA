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
  
}

public void main_mode() { 
  MainMode+=1;
   if(MainMode==5){
    MainMode=1;
  }
 
}

public void color_mode() {
  SubMode1+=1;
   if(SubMode1==3){
    SubMode1=1;
  }
}

public void manual_mode() {
  SubMode2+=1;
   if(SubMode2==4){
    SubMode2=1;
  }
}
