class Hana{
  /*中心座標*/
  float c_x;
  float c_y;
  int angle;
  float edge;
  int s_a;
  int s_point;
  float magni_edge;
  float h_color;
  float s_color;
  float b_color;
  float alpha;
  
  Hana(float x,float y,int a,float e,int s,float m,float h,float h_s,float h_b){
    c_x=x;
    c_y=y;
    angle=a;
    edge=e;
    s_a=90;
    s_point=s;
    magni_edge=m;
    h_color=h;
    s_color=h_s;
    b_color=h_b;
    alpha=0;
  }
  void h_draw(){
    float a1;
    float a2;
    float a3;
    float a4;
    /*必殺の極座標*/
    a1=edge*cos(radians(s_a+(angle/2)));
    a2=edge*sin(radians(s_a+(angle/2)));
    a3=edge*cos(radians(s_a-(angle/2)));
    a4=edge*sin(radians(s_a-(angle/2)));
    beginShape();
    vertex(0,0);
    vertex(a1,a2);
    bezierVertex(edge*cos(radians(s_a+s_point)),magni_edge*edge*sin(radians(s_a+s_point)),edge*cos(radians(s_a-s_point)),magni_edge*edge*sin(radians(s_a+s_point)),a3,a4);
    //vertex(a3,a4);
    vertex(0,0);
    vertex(a1,a2);
    endShape();
  }
  void f_draw(float x,float y){
    if(alpha<100)alpha+=10;
    strokeWeight(3);
    stroke(60,40,100,alpha);
    fill(h_color,s_color,b_color,alpha);
    pushMatrix();
    translate(x,y);
    for(int i=0;i<12;i++){
     h_draw();
     rotate(radians(angle));
    }
    fill(0,0,0);
    ellipse(0,0,edge/4,edge/4);
    //s_a+=3;
    if(s_a>360)s_a=0;
    popMatrix();
  }
}