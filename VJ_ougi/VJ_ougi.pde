Ougi o[];
Ougi o2[];
int count;
int o_count;
int o_max;
int o_max2;
int reserve;
int reserve2;
int reserveX;

void setup(){
  int x=0;
  int y=0;
  count=0;
  o_count=1;
  o_max=0;
  o_max2=0;
  size(2160,1480);
  colorMode(HSB,360,100,100,100);
  o=new Ougi[500];
  o2=new Ougi[500];
  for(int l=0;l<15;l++){
    for(int i=0;i<21;i++){
      o[o_max]=new Ougi(x,y);
      o_max++;
      x+=108;    
    }
    x=0;
    y+=108;
  }
  y=54;
  x=2160-54;
  reserveX=x;
  for(int l=0; l<15;l++){
    for(int i=0;i<21;i++){
      o2[o_max2]=new Ougi(x,y);
      o_max2++;
      x-=108;
    }
    x=reserveX;
    y+=108;
  }
}

void draw(){
  background(0,0,0);
  for(int i=0;i<o_max;i++){
      o[i].o_draw();
      o2[i].o_draw();
    }
    
  count++;
  if(count>1 && o_count<22){
    count=0;
    for(int l=0;l<o_count;l++){
      reserve=l;
      for(int i=0;i<15;i++){
        o[reserve].draw_s=1;
        reserve+=21;
      }
    }
    for(int m=0;m<o_count;m++){
      reserve2=m;
      for(int n=0;n<15;n++){
        o2[reserve2].draw_s=1;
        reserve2+=21;
      }
    }
    o_count++;
  }
}

class Ougi{
  float c_x,c_y;/*中心の座標*/
  float radius;/*半径*/
  public int draw_s;/*円を描くスイッチ*/
  public int o_color;
  Ougi(float x,float y){
    c_x=x;
    c_y=y;
    radius=20;
    draw_s=0;
    o_color=10;
  }
  void o_draw(){
    if(draw_s==1){
    stroke(0,0,100);
    fill(o_color,100,100);
    strokeWeight(8);
    ellipse(c_x,c_y,radius+80,radius+80);
    strokeWeight(5);
    ellipse(c_x,c_y,radius+50,radius+50);
    ellipse(c_x,c_y,radius+25,radius+25);
    ellipse(c_x,c_y,radius,radius);
    }
  }
}