/*桜の設定*/
class Ball{
  int flag;
  float center_x;
  float center_y;
  float x_speed;
  float y_speed;
  float radius;
  float a_chanel;
  float chanel_speed;
  int fi;
  
  Ball(float x,float y,float sx,float sy,float r,int f){
    center_x=x;
    center_y=y;
    x_speed=sx;
    y_speed=sy;
    a_chanel=100;
    radius=r;
    chanel_speed=1;
    flag=1;
    fi=f;
  }
  
  int draw_ball(){
    noStroke();
    fill(fi,20,100,a_chanel);
    center_x+=x_speed;
    center_y+=y_speed;
    ellipse(center_x,center_y,radius,radius);
    a_chanel-=chanel_speed;
    if(a_chanel<0){
      flag=0;
    }
    return flag;
  }
}