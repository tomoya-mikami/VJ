/*背景のひらひらしてるやつの設定*/
class Flip{
  /*座標*/
  float center_x,center_y;
  /*四隅*/
  float top,bottom;
  float f_width;
  int move_flag;
  int fill_flag;
  int w_max;
  float h;
  float flip_speed;
  int fi;
  int bright;
  Flip(float x,float y,int f){
    center_x=x;
    center_y=y;
    top=0;
    bottom=0;
    flip_speed=0.7;
    w_max=5;
    h=10;
    f_width=random(0,w_max);
    move_flag=((int)random(1,100))%2;
    fill_flag=((int)random(1,100))%2;
    fi=f;
    bright=80;
  }
  void f_draw(){
    if(move_flag==0){
        f_width+=flip_speed;
      if(f_width>w_max){
        move_flag=1;
      }
    }else{
      f_width-=flip_speed;
      if(f_width<1){
        if(fill_flag==0){
          fill_flag=1;
        }else{
          fill_flag=0;
        }
        move_flag=0;
      }
    }
    if(fill_flag==0){
      fill(fi,60,100,bright);
    }else{
      fill(fi,100,60,bright);
    }
    noStroke();
    quad((center_x-f_width),center_y,center_x,(center_y+h),(center_x+f_width),center_y,center_x,(center_y-h));
    center_y+=1;
    if(center_y>height+2*h)center_y=-2*h;
  }
}