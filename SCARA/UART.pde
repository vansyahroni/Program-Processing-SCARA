String pn;
void setup_UART()
{

  commListbox = cp5.addListBox("portComList", 20, CO-561, 285, 200); // make a listbox and populate it with the available comm ports
  commListbox.setColorLabel(0);
  commListbox.setItemHeight(15);
  commListbox.setBarHeight(15);
  commListbox.setCaptionLabel("PORT COM");
  commListbox.setColorBackground(c_hijau_sedang);
  commListbox.setColorForeground(c_merah);
  commListbox.setColorActive(c_merah);
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
    m1s1_rgb=int(theControlEvent.getValue());
   
    if (m1s1_rgb==1) {
      _m1s2_s_target="RED";
    }
    if (m1s1_rgb==2) {
      _m1s2_s_target="GREEN";
    }
    if (m1s1_rgb==3) {
      _m1s2_s_target="BLUE";
    }
    if (m1s1_rgb==4) {
      _m1s2_s_target="YELLOW";
    }
    if (m1s1_rgb==5) {
      _m1s2_s_target="BLACK";
    }
    println("Mode: "+MainMode +" SubMode: "+SubMode1+" Color: "+_m1s2_s_target+" Action: ");
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
      if (ReadID==1 && m4_start==0 &&  m1s1_action!=1 && m1s2_action!=1 ) { 
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

        if (ReadID==112 && m1s1_action!=2) {
           
          m1s1_rgb=0;
          m1s1_action=1;
        
        }
        if (ReadID==113 ) {
           
        m1s1_rgb=0;
          m1s1_action=2;
          
        }
        
                
//--------------------- MULTI COLOR ---------------------\\
        if (SubMode1==2) {
          

          if (ReadID==121) {
            _m1s2_s_target="RED";
            m1s2_counter+=1;
            _m1s2_c_target=c_merah;
          m1s2_c_off[0]=1;
         
          }
          if (ReadID==122) {
            _m1s2_s_target="GREEN";
            m1s2_counter+=1;
             _m1s2_c_target=c_GREEN;
           m1s2_c_off[1]=1;
          }
          if (ReadID==123) {
            _m1s2_s_target="BLUE";
            m1s2_counter+=1;
             _m1s2_c_target=c_BLUE;
          m1s2_c_off[2]=1;
          }
          if (ReadID==124) {
            _m1s2_s_target="YELLOW";
            m1s2_counter+=1;
             _m1s2_c_target=c_YELLOW;
        m1s2_c_off[3]=1;
           }
          if (ReadID==125) {
            _m1s2_s_target="BLACK";
            _m1s2_c_target=c_hitam;
       m1s2_c_off[4]=1;
            m1s2_counter+=1;
             _m1s2_c_target=color(0,0,0);
          }

          if (ReadID==126) {
            

            m1s2_action=1;
            m1s2_counter=-1;
          }
          if (ReadID==127) {

            
            m1s2_action=2;
            
            m1s2_c_off[0]=0;
            m1s2_c_off[1]=0;
            m1s2_c_off[2]=0;
            m1s2_c_off[3]=0;
            m1s2_c_off[4]=0;
          
for(int a=0;a<=4;a++){
  m1s2_c_target1[a]=c_hijau_dasar;
}
for(int a=0;a<=4;a++){
  m1s2_c_target2[a]=c_hijau_terang;
}
          }
          if (m1s2_counter==5) {
            m1s2_off=1;
          }
          if (m1s2_action==2) {
            m1s2_action=0;
            m1s2_counter=0;
            m1s2_off=2;
          }
          
          for(int b=1;b<=m1s2_counter;b++){
            for(int c=121;c<=ReadID;c++){
              if(m1s2_counter==b && ReadID==c){
                m1s2_c_target1[b-1]= _m1s2_c_target;
                m1s2_c_target2[b-1]= _m1s2_c_target;
                
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
        m4_start=1;
      }
       if (ReadID==422) {
        m4_start=0;
      }
      
      
    
    
    //single color//
    if(MainMode==1){
    if (m1s1_action==1) {

        }
        if (m1s1_action==2) {

        }
   if (m1s1_action==0) {

        }

    }
          
  

  
    }
    
    if(MainMode!=0){
      if(ReadID==2){
        graph_or_obj+=1;
      }
        if(graph_or_obj==3){
        graph_or_obj=1;
      }
      
      
      }
        
    
  }
}
