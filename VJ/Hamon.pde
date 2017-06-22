class Hamon{
  float c_x;
  float c_y;
  float c_h;
  float c_s;
  float c_b;
  float alpha;
  float a_speed;
  float radius;
  
  Hamon(float x,float y){
    c_x=x;
    c_y=y;
    c_h=random(0,360);
    c_s=50;
    c_b=random(30,60);
    radius=random(100,200);
    alpha=100;
    a_speed=random(0.5,1);
  }
  
  int h_draw(){
    strokeWeight(6);
    stroke(c_h,c_s,c_b,alpha);
    noFill();
    ellipse(c_x,c_h,radius,radius);
    radius+=10;
    alpha-=1;
    if(alpha<0)return 0;
    else return 1;
  }
}