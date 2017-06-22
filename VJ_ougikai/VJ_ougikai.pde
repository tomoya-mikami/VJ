Ougi o[];
int o_count;
int count;

void setup(){
  colorMode(HSB,360,100,100,100);
  size(1440,900);
  int x=0;
  int y=0;
  count=0;
  o_count=0;
  o=new Ougi[1000];
  for(int i=0;i<30;i++){
    for(int l=0;l<21;l++){
      o[o_count]=new Ougi(x,y);
      x+=108;
      o_count++;
    }
    if(i%2==0){
      x=54;
    }else{
      x=0;
    }
    y+=54;
  }
  frameRate(30);
}

void draw(){
  background(0,0,0);
  for(int i=0;i<o_count;i++)o[i].o_draw();
}

void keyPressed(){
  if(key == 'c' || key == 'C'){
    for(int i=0;i<o_count;i++){
      if((i/21)==2){
        o[i].o_color=210;
        o[i].o_bright=100;
        delay(500);
      }
    }
  }
}

class Ougi{
  float c_x,c_y;/*中心の座標*/
  float radius;/*半径*/
  public int o_color;
  public int o_bright;
  public int fill_s;
  int alpha;
  int alpha2;
  int color_c;
  int flag;
  Ougi(float x,float y){
    c_x=x;
    c_y=y;
    radius=20;
    o_color=0;
    o_bright=0;
    fill_s=0;
    alpha=50;
    alpha2=50;
    color_c=100;
    flag=0;
  }
  void o_draw(){
    stroke(0,0,color_c,alpha2);
    fill(o_color,o_bright,o_bright,alpha);
    //else fill(0,0,100-color_c,alpha);
    strokeWeight(8);
    ellipse(c_x,c_y,radius+80,radius+80);
    strokeWeight(5);
    ellipse(c_x,c_y,radius+50,radius+50);
    ellipse(c_x,c_y,radius+25,radius+25);
    ellipse(c_x,c_y,radius,radius);
    /*if(flag==0){
      color_c-=10;
      if(color_c<0)flag=1;
    }else{
      color_c+=10;
      if(color_c>100)flag=0;
    }*/   
  }
}