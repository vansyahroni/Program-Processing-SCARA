class InverseKinematic {
  float a = 0; // Length of L1 (in mm)
  float b = 0; // Length of L2 (in mm)


  float beta = 0;
  float gamma = 0;  

  InverseKinematic (float ia, float ib) {
    a = ia;
    b = ib;
  
  }

  void setA(float ia) {
    a = ia;
  }

  void setB(float ib) {
    b = ib;
  }


  

  // End Effector Target (xn, yn) (in cm)
  void setTarget(float xn, float yn) {

    float c = sqrt(pow(xn, 2)+pow((yn), 2));
    float B1 = atan(yn/(xn));

    //a2 .... = a^2 ....
    float a2 = pow(a, 2);
    float b2 = pow(b, 2);
    float c2 = pow(c, 2);

    float B2 = acos((a2+c2-b2)/(2*a*c));

    float B = B1 + B2;

    float G = acos((a2+b2-c2)/(2*a*b));

    beta = degrees(B);
    gamma = degrees(G);
  }

  float getBeta() {
    return beta;
  }

  float getGama() {
    return gamma;
  }
}

int fkx, fky;
void fk(){
  fkx=int(ps*cos(fs)+pe*cos(fs+fe));
  fky=int(ps*sin(fs)+pe*sin(fs+fe));
//  println(fkx+"\t"+fky);
}
