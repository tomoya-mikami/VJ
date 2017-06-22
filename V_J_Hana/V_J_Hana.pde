float x_sub;
float y_sub;
float r;
int count;
Hana h[];

void setup(){
  size(1400,900);
  colorMode(HSB,360,100,100,100);
  background(0,0,0);
  x_sub=0.2;
  y_sub=1.3;
  r=100;
  count=16;
  h=new Hana[count];
  for(int i=0;i<count;i++){
    h[i]=new Hana(random(50,width-50),random(50,height-50),30,random(50,100),12,1.2);
  }
}

void draw(){
    background(0,0,0);
    for(int i=0;i<count;i++){
      h[i].f_draw();
    }
}

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
  
  Hana(float x,float y,int a,float e,int s,float m){
    c_x=x;
    c_y=y;
    angle=a;
    edge=e;
    s_a=90;
    s_point=s;
    magni_edge=m;
    h_color=random(0,60);
    s_color=random(50,100);
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
  void f_draw(){
    strokeWeight(3);
    stroke(60,40,100,100);
    fill(h_color,s_color,100,100);
    pushMatrix();
    translate(c_x,c_y);
    for(int i=0;i<12;i++){
     h_draw();
     rotate(radians(angle));
    }
    fill(0,0,0);
    ellipse(0,0,edge/4,edge/4);
    s_a+=3;
    if(s_a>360)s_a=0;
    popMatrix();
  }
}