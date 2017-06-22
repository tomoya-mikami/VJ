Kamon k;

void setup(){
  size(800,600);
  background(0,0,0);
  colorMode(HSB,360,100,100,100);
  k=new Kamon(width/2,height/2,200);
  smooth();
  frameRate(30);
}

void draw(){
  background(0,0,0);
  k.k_draw();
  k.k_move(0);
}

class Kamon{
  float c_x,c_y;
  float radius;
  float distant;
  int angle;
  int angle2;
  int angle_speed;
  int angle_speed2;
  ArrayList<Ksqure> k;
  int move_s;
  float s_point;
  
  Kamon(float x,float y,float r){
    s_point=1.00;
    c_x=x;
    c_y=y;
    radius=r;
    distant=radius*0.3;
    angle=90;
    angle2=30;
    angle_speed2=2;
    angle_speed=2;
    k=new ArrayList<Ksqure>();
    for(int i=0;i<4;i++){
    k.add(new Ksqure(x,y,1.1*radius*s_point,1.4*radius*s_point));
    s_point+=0.1;
    }
    move_s=0;
  }
  
  void k_draw(){
    fill(0,100,60);
    stroke(0,0,100);
    strokeWeight(2);
    ellipse(c_x,c_y,radius,radius);
    for(int i=0;i<3;i++){
    ellipse(c_x+distant*cos(radians(angle+i*120)),c_y+distant*sin(radians(angle+i*120)),radius*0.4,radius*0.4);
    }
    for(int i=0;i<3;i++){
    ellipse(c_x+distant*cos(radians(angle2+i*120)),c_y+distant*sin(radians(angle2+i*120)),radius*0.4,radius*0.4);
    }
    ellipse(c_x,c_y,radius*0.3,radius*0.3);
    for(int i=0;i<k.size();i++){
      k.get(i).sq_draw();
      if(move_s==1){
      if(k.get(i).sq_move()==0){
        k.remove(i);
      }
      }
    }
    if(k.size()==0){
      move_s=0;
      s_point=1.00;
      for(int i=0;i<4;i++){
      k.add(new Ksqure(c_x,c_y,1.1*radius*s_point,1.4*radius*s_point));
      s_point+=0.1;
    }
    }
      
  }
  void k_move(int i){
    if(i>0){
      angle+=angle_speed;
      angle2+=angle_speed2;
    }
  }
}

class Ksqure{
  float cx;
  float cy;
  float k_length;
  float k_width;
  int alpha;
  
  Ksqure(float x,float y,float l,float w){
    cx=x;
    cy=y;
    k_length=l;
    k_width=w;
    alpha=100;
  }
  
  void sq_draw(){
    stroke(0,0,100,alpha);
    line(cx,cy+k_length,cx+k_width,cy);
    line(cx+k_width,cy,cx,cy-k_length);
    line(cx,cy-k_length,cx-k_width,cy);
    line(cx-k_width,cy,cx,cy+k_length);
  }
  
  int sq_move(){
    k_length+=10;
    k_width+=10;
    alpha-=5;
    if(alpha<0) return 0;
    else return 1;
  }
}

void keyPressed(){
  if(key == 'a' || key == 'A'){
    k.move_s=1;
  }
}