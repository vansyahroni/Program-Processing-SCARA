void cameraGO(){
  cam.read();
  if(change_background==1){
  background(bg); 
  }
  else background(bg2); 
  image(cam, 640, CO-438, 510, 287);
}
