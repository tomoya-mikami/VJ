class Kamon{
  float base_x;
  float base_y;
  float base_radius;
  float c_x,c_y;
  float radius;
  float s_radius;
  float distant;
  int angle;
  int angle2;
  int angle_speed;
  int angle_speed2;
  ArrayList<Ksqure> k;
  int move_s;
  float s_point;
  
  Kamon(float x,float y,float r,int l){
    s_point=1.00;
    base_x=x;
    base_y=y;
    base_radius=300;
    radius=r;
    distant=radius*0.3;
    angle=90;
    angle2=30;
    angle_speed2=6;
    angle_speed=6;
    k=new ArrayList<Ksqure>();
    for(int i=0;i<4;i++){
    k.add(new Ksqure(x+base_radius*cos(radians(90+l*60)),y+base_radius*sin(radians(90+l*60)),1.1*radius*s_point,1.4*radius*s_point));
    s_point+=0.1;
    }
    move_s=0;
    s_radius=0.4*radius;
  }
  
  void k_draw(int l,int n){
    c_x=base_x+base_radius*cos(radians(90+l*60));
    c_y=base_y+base_radius*sin(radians(90+l*60));
    fill(0,100,60);
    stroke(0,0,100);
    strokeWeight(2);
    ellipse(c_x,c_y,radius,radius);
    for(int i=0;i<3;i++){
    ellipse(c_x+distant*cos(radians(angle+i*120)),c_y+distant*sin(radians(angle+i*120)),s_radius,s_radius);
    }
    for(int i=0;i<3;i++){
    ellipse(c_x+distant*cos(radians(angle2+i*120)),c_y+distant*sin(radians(angle2+i*120)),s_radius,s_radius);
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
    if(k.size()==0 && n==5){
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
  int k_b;
  
  Ksqure(float x,float y,float l,float w){
    cx=x;
    cy=y;
    k_length=l;
    k_width=w;
    alpha=100;
    k_b=100;
  }
  
  void sq_draw(){
    stroke(0,0,k_b,alpha);
    line(cx,cy+k_length,cx+k_width,cy);
    line(cx+k_width,cy,cx,cy-k_length);
    line(cx,cy-k_length,cx-k_width,cy);
    line(cx-k_width,cy,cx,cy+k_length);
  }
  
  int sq_move(){
    k_length+=15;
    k_width+=15;
    alpha-=10;
    if(alpha<0) return 0;
    else return 1;
  }
}