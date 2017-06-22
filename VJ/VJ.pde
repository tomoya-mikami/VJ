import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

/*音楽再生関連*/
int m_set;
Minim min;
AudioPlayer pl;
FFT fft;
int specSize;

int count; /*シーンがどれくらい進んだかのカウント*/

/*シーン1*/
int bright1;
ArrayList<Hamon> ha;

/*シーン2*/
int bright2;

/*シーン3*/
float lastMouseX;
float lastMouseY;

/*シーン5*/
Hana h;
Hana h2;
PImage kasa1;
float bairitu;

/*シーン6*/
int alpha1;
PImage kasa2;
ArrayList<Ball> b;
int center;
Flip[] f;
int f_count;
int alpha2;

/*シーン７*/
Kamon[] k;
Arrow[][] w;
int arrow_s;
int sakura_s;
int sakura_c;
ArrayList<Ball> b2;

/*シーン8*/
int alpha3;

/*シーン9*/
float radius1;

void setup(){
  size(1440,900);  
  colorMode(HSB,360,100,100,100);
  background(0,0,0);

/*以下変数の初期化*/
  count = 0;/*この値を変えれば好きなシーンから始められる*/
  bright1=0;
  ha=new ArrayList<Hamon>();
  bright2=0;
  lastMouseX=0;
  lastMouseY=0;
  kasa1=loadImage("kasa1.png");
  kasa2=loadImage("kasa2.png");
  bairitu=0;
  alpha1=100;
  b=new ArrayList<Ball>();
  b2=new ArrayList<Ball>();
  f_count=1000;
  f=new Flip[f_count];
  for(int i=0;i<f_count;i++){
    f[i]=new Flip(random(width),random(-1*height,0),46);
  }
  center=width;
  h=new Hana(0,0,30,100,12,1.2,344,90,100);
  h2=new Hana(0,0,30,100,12,1.2,222,72,68);
  alpha2=0;
  k=new Kamon[6];
  for(int i=0;i<6;i++){
    k[i]=new Kamon(width/2,height/2,100,i);
  }
  alpha3=0;
  w=new Arrow[140][10];
  int y=0;
  int x=0;
  float c=0;
  for(int i=0;i<50;i++){
    c=random(0,100);
    for(int l=0;l<10;l++){
    w[i][l]=new Arrow(x,y,80,15,10,c,100);
    y+=160;
    }
    x+=30;
    if(i%2==0)y=-80;
    else y=0;
    //println(x);
  }
  arrow_s=0;
  sakura_c=0;
  radius1=0;
  /*音楽再生関連*/
  min=new Minim(this);
  pl=min.loadFile("CPART_music_終_01.mp3",512);
  m_set=1;
  fft=new FFT(pl.bufferSize(),pl.sampleRate());
  specSize=fft.specSize();
}

void draw(){
  /*switch文。必ずbreakで終わる。caseごとに1シーンって感じで*/
  fft.forward(pl.mix);
  switch(count){
    /*シーン１*/
    case 1:
      noCursor();
      background(0,0,0);
      for(int i=0;i<specSize;i++){
        if(i>3&&i<5&&fft.getBand(i)*5>120){
          ha.add(new Hamon(random(200,width-200),random(100,height-100)));
        }
      }
      for(int i=0;i<ha.size();i++){
        if(ha.get(i).h_draw()==0)ha.remove(i);
      }
      if(bright1<100)bright1++;
      fill(0,0,bright1);
      noStroke();
      ellipse(mouseX,mouseY,height/2,height/2);
      break;
    /*シーン2*/  
    case 2:
      cursor();
      background(0,0,0);
      if(bright1>0)bright1-=3;
      fill(0,0,bright1);
      noStroke();
      ellipse(mouseX,mouseY,height/2,height/2);
      lastMouseX=mouseX;
      lastMouseY=mouseY;
      break;
    /*シーン3*/  
    //case 3:
      //background(0,0,0);
      /*noStroke();
      if(bright2<100)bright2++;
      fill(0,0,bright2);
      ellipse(mouseX,mouseY,height/2,height/2);
      ellipse(width-mouseX,mouseY,height/2,height/2);
      */
      //lastMouseX=mouseX;
      //lastMouseY=mouseY;
      //break;
    /*シーン4*/  
    /*case 4:
      background(0,0,0);
      break;*/
 
    /*シーン3*/
    case 3:
      noCursor();
      background(0,0,0);
      if(center>-5000){
      for(int i=0;i<15;i++){
        b.add(new Ball(center,height/2,random(-5,5),random(-5,5),random(20,40),310));
      }
      for(int i=0;i<b.size();i++){
      if((b.get(i).draw_ball())==0){
        b.remove(i);
      }
      }
      center-=20;
      }
      for(int i=0;i<f_count;i++){
        f[i].f_draw();
      }
      h.f_draw(mouseX,mouseY);
      h2.f_draw(width-mouseX,lastMouseY+(-1)*(mouseY-lastMouseY));
      /*imageMode(CENTER);
      if(bairitu<500)bairitu+=100;
      image(kasa1,mouseX,mouseY,bairitu,bairitu);
      image(kasa1,width-mouseX,lastMouseY+(-1)*(mouseY-lastMouseY),bairitu,bairitu);*/
      break;
   /*シーン6*/
     /*case 6:
      background(0,0,0);
      if(center>-5000){
      for(int i=0;i<10;i++){
        b.add(new Ball(center,height/2,random(-5,5),random(-5,5),random(20,40),310));
      }
      for(int i=0;i<b.size();i++){
      if((b.get(i).draw_ball())==0){
        b.remove(i);
      }
      }
      center-=20;
      }
      for(int i=0;i<f_count;i++){
        f[i].f_draw();
      }
      imageMode(CENTER);
      colorMode(RGB,255,255,255,100);
      if(alpha1>0){
      alpha1-=25;
      tint(255,255,255,alpha1);
      image(kasa1,mouseX,mouseY,bairitu,bairitu);
      image(kasa1,width-mouseX,lastMouseY+(-1)*(mouseY-lastMouseY),bairitu,bairitu);
      }
      tint(255,255,255,100-alpha1);
      image(kasa2,mouseX,mouseY,bairitu,bairitu);
      image(kasa2,width-mouseX,lastMouseY+(-1)*(mouseY-lastMouseY),bairitu,bairitu);
      colorMode(HSB,360,100,100,100);
      break;*/
    /*シーン4*/
      case 4:
        background(0,0,0);
        for(int i=0;i<f_count;i++){
        f[i].f_draw();
      }
      fill(0,0,0,alpha2);
      //rect(0,0,width,height);
      if(alpha2<100)alpha2+=1;
      break;
      /*シーン5*/
    case 5:
      background(0,0,0);
      for(int i=0;i<specSize;i++){
        if(i>0&&i<2&&fft.getBand(i)*5>300){
          for(int l=0;l<6;l++)k[l].move_s=1;
        }
      }
      if(arrow_s>0){
        for(int i=0;i<50;i++){
          for(int l=0;l<10;l++){
            w[i][l].a_draw();
          }
        }
      }
      if(sakura_s>0){
        for(int i=0;i<15;i++){
        b.add(new Ball(sakura_c,height/2,random(-5,5),random(-5,5),random(20,40),310));
        b.add(new Ball(width-sakura_c,height/2,random(-5,5),random(-5,5),random(20,40),310));
      }
      sakura_c+=20;
      }
      for(int i=0;i<b.size();i++){
      if((b.get(i).draw_ball())==0){
        b.remove(i);
      }
      }
      
      for(int i=0;i<6;i++)k[i].k_draw(i,5);
    break;
    /*シーン6*/
    case 6:
      for(int i=0;i<6;i++){
        for(int l=0;l<k[i].k.size();l++){
        k[i].k.get(l).k_b-=1;
        if(k[i].k.get(l).k_b==0)k[i].k.remove(l);
        }
        k[i].k_draw(i,6);
      }
      if(k[0].k.size()==0)count+=1;
    break;
    /*シーン7*/
    case 7:
      background(0,0,0);
      for(int i=0;i<6;i++){
        if(k[i].base_radius>0){
        k[i].base_radius-=2;
        k[i].radius+=2;
        }
        k[i].k_draw(i,7);
      }
      /*fill(0,0,0,alpha3);
      noStroke();
      rect(0,0,width,height);
      fill(0,0,100,alpha3);
      ellipse(mouseX,mouseY,height/2,height/2);
      if(alpha3<100)alpha3+=1;*/
    break;
    /*シーン8*/
    case 8:
      background(0,0,0);
      for(int i=0;i<6;i++){
        if(k[0].base_y+(k[0].radius/2)<height){
          k[i].base_y+=1;
          if(k[i].s_radius>0)k[i].s_radius-=2;
          else k[i].s_radius=0;
        }
        k[i].k_draw(i,8);
      }
    break;
    /*シーン9*/
    case 9:
      background(0,0,0);
      for(int i=0;i<6;i++){
        if(k[0].radius>0)k[i].radius-=1;
        else k[i].radius=0;
        k[i].k_draw(i,9);
      }
    break;
    /*終了時*/
    default:
      background(0,0,0);
      break;
  }
  //fill(0,0,100);
  //textSize(50);
  //text("scen"+ count,100,100);
  /*画像の書き出し*/
  //saveFrame("flame/#######.tif");
}

void mousePressed(){
  if(mouseButton == LEFT){
    count++;
    if(m_set==1){
      pl.play();
    }
  }
  if(mouseButton== RIGHT){
    count--;
  }
}

void keyPressed(){
  if(key == 'a' || key == 'A'){
     if(count==5)for(int i=0;i<6;i++)k[i].move_s=1;
  }
  if(key == 's' || key == 'S'){
     if(count==5)for(int i=0;i<6;i++)k[i].k_move(1);
  }
  if(key == 'd' || key == 'D'){
    if(count == 5)arrow_s=1;
  }
  if(key == 'r' || key == 'R'){
    if(count==5){
      
    }
  }
  if(key == 'l' || key == 'L'){
    if(count==5)sakura_s=1;
  }
}

void keyReleased(){
  arrow_s=0;
  sakura_s=0;
  sakura_c=0;
}
void stop()
{
  pl.close();  //サウンドデータを終了
  min.stop();
  super.stop();
}