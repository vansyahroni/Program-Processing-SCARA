  
float[] coordinatX = new float[100];
float[] coordinatY = new float[100];
float[] colorR = new float[100];
float[] colorG = new float[100];
float[] colorB = new float[100];

float  [] _dataX =new float [100];
float  [] _dataY =new float [100];



public void RESET_KOORDINAT() {
  count_click = 0;
}


          

public void RUN(){
 v4=1;
for(int a=0; a<=count_click;a++){
  
_dataX[a]=map(clickX[a], -90, 90, -660, 660);
_dataY[a]=map(clickY[a], 0, 90, 0, 660);


  if (_dataX[a]>0) {
            ik1.setTarget(_dataX[a],_dataY[a]);
            beta=180-ik1.getBeta();
            gamma=270-ik1.getGama();
            //              text(koorx, 500, 500);
          } 
          else {
            ik1.setTarget(_dataX[a]*-1, _dataY[a]);
            beta=ik1.getBeta();
            gamma=ik1.getGama()-90;
            //              text(ik1.getGama(), 500, 500);
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


         int _Ibeta=int(beta);
          int _Igamma=int(gamma);
          
        
          byte out[]=new byte[8];
    
  out[0]=byte(255);
  out[1]=byte(int(_Ibeta));
  out[2]=byte(int(_Igamma));
  out[3]=byte(int(v3));
  out[4]=byte(int(v4));
  out[5]=byte(int(v5));
  out[6]=byte(int(KP));
  out[7]=byte(254);
    serial.write(out);
    
//        println(out);
        
  
//          
//          float fpoint = sqrt(pow(clcikX[a], 2)+pow(clickY[a], 2));
//          float fpointX= fwX/clickX[a]*100;
//          float fpointY =fwY/clickY[a]*100;
//          float fpoint=(fpointX+fpointY)/2;
          
            
            
//      
    
//    println(_Ibeta, _Igamma);

fwX=int(map(( pe*cos(radians(fs+90-fe))+ps*cos(radians(fs))), -660,660,-90,90));
 fwY=int(map((pe*sin(radians(fs+90-fe))+ps*sin(radians(fs))), 0,660,0,90));

delay(1000);


out[0]=byte(255);
  out[1]=byte(int(_Ibeta));
  out[2]=byte(int(_Igamma));
  out[3]=byte(int(v3));
  out[4]=byte(int(0));
  out[5]=byte(int(v5));
  out[6]=byte(int(KP));
  out[7]=byte(254);
    serial.write(out);
//delay(1000);
//out[0]=byte(255);
//  out[1]=byte(int(_Ibeta));
//  out[2]=byte(int(_Igamma));
//  out[3]=byte(int(v3));
//  out[4]=byte(int(1));
//  out[5]=byte(int(v5));
//  out[6]=byte(int(KP));
//  out[7]=byte(254);
//    serial.write(out);
//delay(400);
  println(clickX[a], clickY[a], fwX, fwY);
}
v4=0;
}



int fx1=0;
int fy1=0;
int _Ibeta=0;
int _Igamma=0;
void fiture_(){
  
  
   int[] Ypos = new int[100];
  Ypos[0] = 50;
  for (int a=1; a<100; a++) {
    Ypos[a] = Ypos[a-1] +20;
  
}
    
       textAlign(CENTER);
  fill(#0DE4FA);
  textFont(font18);
  text("Xpos", X_rev+680-150+525, Y_rev+10);
  text("Ypos", X_rev+740-150+525, Y_rev+10);
int space=0;
  for (int a=0; a<=count_click; a++) {
   
    textFont(font18);
    fill(#FEFF00);
    textAlign(CENTER);
    String this_text = "(" + clickX[a] + " , " + clickY[a] + ")";
    text(this_text, X_rev+710-150+525, Y_rev+Ypos[a]-20);
    textAlign(LEFT);
    
 }}
  
  


void draw_coordinat_target() {
  
    for (int a=0; a<100; a++) {
    colorR[a] = random(255);
    colorG[a] = random(255);
    colorB[a] = random(255);
  
}
    pushMatrix();
    translate(-150,0,0);
    
  coordinatX[0] = (X_rev+380+525/2 + (0*2.5))-225; 
  coordinatY[0] = (Y_rev+250+525/3 - (0*2.5));
  
 
  /*calculate real coordinat*/
  for (int a =1; a<=count_click; a++) {
    coordinatX[a] = (X_rev+380+525/2 + (clickX[a]*2.5)); 
    coordinatY[a] = (Y_rev+250+525/3 - (clickY[a]*2.5));
  }

  /*draw line*/
  strokeWeight(4); 
  for (int a=1; a<=count_click; a++) {
    if ((clickX[a]>=-100-525/2) && (clickX[a] <=100+525/2)) {
      if ((clickY[a]>=-100-525/3) &&(clickY[a] <=100+525/3)) {     
        stroke(0);
        line(coordinatX[a-1], coordinatY[a-1], coordinatX[a], coordinatY[a]);
      }
    }
  }
  strokeWeight(1);

  /*draw target*/
  for (int a =0; a<=count_click; a++) {
    if (a==0) {
      noStroke();
      fill(0);
      ellipse(X_rev+380+525/2-225, Y_rev+250+525/3, 25, 25);
    } else {
      noStroke();
      fill(0);
      ellipse(coordinatX[a], coordinatY[a], 15, 15);
    }
  }
  popMatrix();
}


void draw_coordinat() {//KOTAK KOTAK
  pushMatrix();
    translate(-150,0,0);
  for (int x=0; x<525*2; x+=25) {
    stroke(#717171);
    line(X_rev+130+x, Y_rev, X_rev+130+x, Y_rev+500);
  }
  for (int y=0; y<525; y+=25) {
    stroke(#717171);
    line(X_rev+130, Y_rev+y, (X_rev+130+500+525), Y_rev+y);
  }

  //----- center line
  stroke(#FF9305);
  line(X_rev+380+525/2, Y_rev,(X_rev+380+525/2), Y_rev+500);  //sumbu Y
  line(X_rev+130, Y_rev+250+525/3, X_rev+630+525, Y_rev+250+525/3);   //sumbu X
popMatrix();
//
//  fill(#FEFF00);
//  text("---- Detail ----", X_rev-35, Y_rev+280);
//  noFill();
//  stroke(#717171);
//  rect(X_rev-30, Y_rev+300, 40, 40);
//  fill(#0DE4FA);
//  text("20x20 cm", X_rev+25, Y_rev+325);


  //----- keterangan warna koordinat
//  noStroke();
//  fill(color_point[0][0], color_point[0][1], color_point[0][2]);
//  ellipse(X_rev-20, Y_rev+12, 20, 20);
//
//  fill(color_point[1][0], color_point[1][1], color_point[1][2]);
//  ellipse(X_rev-20, Y_rev+12+50, 20, 20);
//
//  fill(color_point[2][0], color_point[2][1], color_point[2][2]);
//  ellipse(X_rev-20, Y_rev+12+100, 20, 20);
//
//  fill(color_point[3][0], color_point[3][1], color_point[3][2]);
//  ellipse(X_rev-20, Y_rev+12+150, 20, 20);
} 

