Arrow a;

void setup(){
  size(400,400);
  background(0,0,0);
  colorMode(HSB,360,100,100,100);
  a=new Arrow(200,0,80,15,10,0,100);
}

void draw(){
  a.arrow_draw();
}

class Arrow{
  float c_x;
  float c_y;
  float lengh;
  float wid;
  float displacement;
  float a_h;
  float a_s;
  float s_point;
  
  Arrow(float x,float y,float l,float w,float d,float h,float s){
    c_x=x;
    c_y=y;
    lengh=l;
    wid=w;
    displacement=d;
    a_h=h;
    a_s=s;
    s_point=5;
  }
  void a_draw(){
    fill(a_h,a_s,100,100);
    noStroke();
    quad(c_x,c_y,c_x,c_y+lengh,c_x+wid,c_y+lengh-displacement,c_x+wid,c_y-displacement);
    quad(c_x,c_y,c_x,c_y+lengh,c_x-wid,c_y+lengh-displacement,c_x-wid,c_y-displacement);
    strokeWeight(2);
    stroke(0,0,100);
    line(c_x,c_y+s_point,c_x,c_y+lengh-s_point);
    fill(0,0,100);
    noStroke();
    quad(c_x,c_y+lengh,c_x,c_y+2*lengh,c_x+wid,c_y+2*lengh-displacement,c_x+wid,c_y+lengh-displacement);
    quad(c_x,c_y+lengh,c_x,c_y+2*lengh,c_x-wid,c_y+2*lengh-displacement,c_x-wid,c_y+lengh-displacement);
    strokeWeight(2);
    stroke(a_h,a_s,100,100);
    line(c_x,c_y+lengh+s_point,c_x,(c_y+2*lengh)-s_point);
  }
  void arrow_draw(){
    for(int i=0;i<4;i++){
      a_draw();
      c_y+=2*lengh;
    }
  }
}