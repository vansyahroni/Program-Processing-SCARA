int fwX=0;
int fwY=0;

void fw(){
  
 fwX=int(map(( pe*cos(radians(fs+fe))+ps*cos(radians(fs))), -660,660,-90,90));
 fwY=int(map((pe*sin(radians(fs+fe))+ps*sin(radians(fs))), 0,660,0,90));
// ellipse(( pe*cos(radians(fs+90-fe))+ps*cos(radians(fs))), ((pe*sin(radians(fs+90-fe))+ps*sin(radians(fs)))), 20,20);
 
}



