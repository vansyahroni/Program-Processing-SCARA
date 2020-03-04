  
float[] coordinatX = new float[100];
float[] coordinatY = new float[100];
float[] colorR = new float[100];
float[] colorG = new float[100];
float[] colorB = new float[100];

public void RESET_KOORDINAT() {

  count_click = 0;
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
// println(clickX[a], clickY[a]);
 
  
 
          KoordinatX_=int(map(cx, -90, 90, -660, 660));
          KoordinatY_=int(map(cy , 0, 90, 0, 660));

          if (KoordinatX_>0) {
            ik1.setTarget(KoordinatX_, KoordinatY_);
            beta=180-ik1.getBeta();
            gamma=270-ik1.getGama();
            //              text(koorx, 500, 500);
          } else {
            ik1.setTarget(KoordinatX_*-1, KoordinatY_);
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


          _Ibeta=int(beta);
          _Igamma=int(gamma);
//println(_Ibeta,_Igamma);
          ik_();
        
 }}
  
  


void draw_coordinat_target() {
  
    for (int a=0; a<100; a++) {
    colorR[a] = random(255);
    colorG[a] = random(255);
    colorB[a] = random(255);
  
}
    pushMatrix();
    translate(-150,0,0);
    
  coordinatX[0] = (X_rev+380+525/2 + (0*2.5)); 
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
      ellipse(X_rev+380+525/2, Y_rev+250+525/3, 25, 25);
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
