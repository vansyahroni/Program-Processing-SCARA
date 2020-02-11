
void letsgo()
{

  byte out[]=new byte[8];
  out[0]=byte(255);
  out[1]=byte(int(v1));
  out[2]=byte(int(v2));
  out[3]=byte(int(v3));
  out[4]=byte(int(v4));
  out[5]=byte(int(v5));
    out[6]=byte(int(KP));
  out[7]=byte(254);

  serial.write(out);
}

void ik_()
{

  byte out[]=new byte[8];
  out[0]=byte(255);
  out[1]=byte(int(Ibeta));
  out[2]=byte(int(Igamma));
  out[3]=byte(int(v3));
  out[4]=byte(int(v4));
  out[5]=byte(int(v5));
  out[6]=byte(int(KP));
  out[7]=byte(254);

  serial.write(out);
}
float r;

void Send_To_Arduino()
{   
  
  
if(START==true){
int Ifs=int(fs), Ife=int(fe), Ifw=int(fw);
      fill(0);
      textFont(font30);
      pushMatrix();
      textAlign(CENTER);
      text(Ifs, 1069, 611);
      text(Ife, 1183, 611);
      text(Ifw, 1297, 611);
      popMatrix();}


  if (serial_conect==1) 
  {   
      
    textFont(font25);
    fill(#fa8231);
  text(  nf((KP/100),0,2), 311, 366);
  
    pushMatrix();
    noStroke();
    fill(#2ecc71);
    ellipseMode(CENTER);
    ellipse(323, 233, 10, 10);
    popMatrix();
    fill(0); 
    textFont(font14);
    //    text("Mode: -", 160, 570);    





    if (P1==true) {
      v4=1;
    } else { 
      v4=0;
    }

    if (P2==true) {
      v5=1;
    } else {
      v5=0;
    }


    if (START==true) {

 



      if (MODE==true) {
     
         
          
            
          
               
            

        if (ik==false) {


          KoordinatY_=int(map(_KoordinatY, 0,90, 0, 660));
          KoordinatX_=int(map(_KoordinatX, -90,90,-660,660));
    pushMatrix();
           textFont(font25);
            textAlign(CENTER);
            text(_KoordinatX, 1128, 504);
            text(_KoordinatY, 1247, 504);
            popMatrix();
         

          if (KoordinatX_>0) {
            ik1.setTarget(KoordinatX_, KoordinatY_);
            beta=180-ik1.getBeta();
            gamma=270-ik1.getGama();
          } else {
            ik1.setTarget(KoordinatX_, KoordinatY_);
            beta=ik1.getBeta();
            gamma=ik1.getGama()-90;
          }
          if (gamma<=0) {
            gamma=0;
          }
          if (gamma>=180) {
            gamma=180;
          }

     
          Ibeta=int(beta);
          Igamma=int(gamma);


          ik_();
        } 
        else {
        

           r= sqrt(pow(mouseX-680, 2)+pow(mouseY-545, 2));

          if (r<600/2 && r > 351/2 && mouseY <545) {

             mosx=int(map(mosxe, 381, 979, -90, 90));
            mosy=int(map(mosye, 246, 546, 90, 0));
      
            float koorx=0;
            float koory=90;
            koorx=map(mosx, 0, 90, 0, 660);
            koory=map(mosy, -90, 90, -660, 660);

         


            if (koorx>0) {
              ik1.setTarget(koorx, koory);
              beta=180-ik1.getBeta();
              gamma=270-ik1.getGama();
            } else {
              ik1.setTarget(koorx, koory);
              beta=ik1.getBeta();
              gamma=ik1.getGama()-90;
            }
            if (gamma<=0) {
              gamma=0;
            }  
            if (gamma>=180) {
              gamma=180;
            }  
            if (beta<0) {
              beta=-1*beta;
              gamma=180-gamma;
            }  
           

            Ibeta=int(beta);
            Igamma=int(gamma);

            ik_();
          }
          fill(#2c3e50);
          ellipse(mosxe, mosye, 20, 20);
          pushMatrix();
            textFont(font25);
            fill(0);
            textAlign(CENTER);
            text(mosx, 1128, 504);
            text(mosy, 1247, 504);
            popMatrix();
        }
      } else { 
        letsgo();
      }
    }
  } else 
  {
    pushMatrix();
   noStroke();
    fill(#e74c3c);
    ellipseMode(CENTER);
    ellipse(323, 233, 10, 10);
    popMatrix();
    noFill();
  }
}

