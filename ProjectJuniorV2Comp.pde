//CS171 Project
//Program that allows the user to play a third person shooter game
// Olugbenga Akinduro
//Last edited: 15/12/20

import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioPlayer musicplayer, musicplayer2;

int stage;
float bgrepeat;
PImage menu;
float y=1;
float x;
float speed =0.5;
PImage scene, player, player2, player3;
PFont  wording;
float player_x=300, player2_x=50, player3_x=10;
float frame=0;
int direction=0, direction2=0, direction3=0;
int Points = 0;
int Health = 100;
int SuperHealth = 150;
PFont font;
int enemy=80, enemy2=80;
float frame2=0, frame3=0;
int quit_flag=0;
String instru="\nSpacebar is to Attack\n Left key is to move left\n Right key is to move right";
//Creating the scene for the game (size of the game, the background etc...)
void setup() {
  size(640, 480,P2D);
  frameRate(30);
  smooth();
  scene = loadImage("BG1.gif"); 
  //here is where i added music that i got from youtube etc
  minim = new Minim(this);
  musicplayer = minim.loadFile("8Bit.mp3"); // I downloaded this song from youtube the link is (https://youtu.be/kmAMnQXIVnI?list=PLKQWNXwX2zTkYUBbLPaTwYpDBIcFnDch3)
  musicplayer.play();  
  player=loadImage("Untitled.png");//from xenosheet which i downloaded from (http://opengameart.org/content/xeon-ultimate-smash-friends)
  player2=loadImage("newrun.png");//from this website (http://opengameart.org/content/fighting-robot-for-ultimate-smash-friends)
  player3=loadImage("newrun.png");//from this website(http://opengameart.org/content/fighting-robot-for-ultimate-smash-friends)
  textureMode(NORMAL);
  blendMode(BLEND);
  noStroke();
  font  = createFont("BLKCHCRY.TTF", 30);
  stage=1;
}
void draw()
{
  if (stage==1) {
    menu=loadImage("gamegb.gif");
    background(menu);
    textFont(font);
    fill(255, 255, 255);
    text("Press Enter To Start", 200, 200);
    fill(255,0,0);
    text("Instructions: " + instru, 80, 300);
    fill(255,128,0);
    text("Kira",300, 30);



    if (keyCode==ENTER) {
      stage=2;
    }
  }
  if (stage==2) {

    background(scene);

    textAlign(CENTER);
    //if(key==ENTER) move to other image
    {
      float left=frame/4;
      float right=(frame+1)/4;
      if (direction==1)
      {
        float temp=left;
        left=right;
        right=temp;
      }

      pushMatrix();                     
      translate(player_x, 300);
      beginShape();                    
      texture(player);
      vertex( 0, 0, left, 0);    
      vertex(124, 0, right, 0);
      vertex(124, 124, right, 1);
      vertex( 0, 124, left, 1);
      endShape(CLOSE);
      popMatrix();
    }
    //for other  enemy, copy and paste this but change position, change the motion to random

    if (direction2 == 0)
    {
      player2_x+=4;
      frame2++;
      if (frame2>=35) frame2=0;
    }
    if (player2_x >= 570)
    {
      direction2=1;
    }
    if (direction2 == 1)
    {
      player2_x+=-4;
      frame2++;
      if (frame2>=35) frame2=0;
    }
    if (player2_x<=1)
    {
      direction2=0;
    }

    if (direction3 == 0)
    {
      player3_x+=4;
      frame3++;
      if (frame3>=35) frame3=0;
    }
    if (player3_x >= 570)
    {
      direction3=1;
    }
    if (direction3 == 1)
    {
      player3_x+=-4;
      frame3++;
      if (frame3>=35) frame3=0;
    }
    if (player3_x<=1)
    {
      direction3=0;
    }
    {

      float left2=frame2/35;
      float right2=(frame2+1)/35;
      if (direction2==1)
      {
        float temp2=left2;
        left2=right2;
        right2=temp2;
      }
      pushMatrix();                     
      translate(player2_x, 300);
      beginShape();                    
      texture(player2);
      vertex( 0, 0, left2, 0);    
      vertex(124, 0, right2, 0);
      vertex(124, 124, right2, 1);
      vertex( 0, 124, left2, 1);
      endShape(CLOSE);
      popMatrix();
    }
    {

      float left3=frame3/35;
      float right3=(frame3+1)/35;
      if (direction3==1)
      {
        float temp3=left3;
        left3=right3;
        right3=temp3;
      }
      //I used the same code for the first enemy while changing some variables
      pushMatrix();                     
      translate(player3_x, 300);
      beginShape();                    
      texture(player2);
      vertex( 0, 0, left3, 0);    
      vertex(124, 0, right3, 0);
      vertex(124, 124, right3, 1);
      vertex( 0, 124, left3, 1);
      endShape(CLOSE);
      popMatrix();
    }


    {

      fill(255,128,0);
      textFont(font);
      text("Score:"+Points, 80, 20);
      fill(255, 0, 0);
      text("Health:"+Health, 555, 20);
      fill(#F77407);
      text("Kira", 300, 25);
      fill(#F70509);
      if (Health<1)
      {
        stage=3;
      }
      if (player_x >=570)
      {
        player_x=1;
      }
      if (player_x <= 0)
      {
        player_x=550;
      }
      if ((player2_x+30 - player_x+30) >=0 && player2_x < player_x)
      {
        Health=Health-1;
      } else if ((player_x+30 - player2_x+30) >=0 && player_x < player2_x)
      {
        Health=Health-1;
      }
      if ((player3_x+30 - player_x+30) >=0 && player3_x < player_x)
      {
        Health=Health-1;
      } else if ((player_x+25 - player3_x+25) >=0 && player_x < player3_x)
      {
        Health=Health-1;
      }
      if (quit_flag==1)                
      {
        musicplayer=minim.loadFile("Gameover.wav"); //from freesound.org i downloaded it from their website
        musicplayer.play();
        delay(3000);
        exit();
      }
      if (Health<0) {
        quit_flag=1;
        menu=loadImage("go.jpg");//from https://www.google.com/search?q=game+over+640x480&tbm=isch&hl=en&sa=X&ved=2ahUKEwiA2PeKrcHtAhWYZBUIHRPwDCkQBXoECAEQLA&biw=1263&bih=610#imgrc=DRv9TPCmhAKF8M
        background(menu);
        textFont(font);
        fill(255, 255, 255);
        text("You Have Died, Please Exit The Game" , 300, 50);
        fill(81,255,0);
        text("Your Highest Score Is: " + Points, 300, 400);
      }
    }
    if ((Health<50 && Health>=40)) {
      fill(255,128,0);
      text("Final form!", 520, 140);
    }

    if ((Health<=20) && Health>=1)
    {
      fill(255, 0, 0);
      text("High Damage!", 200, 140);
    }
    // this was to make my character move
    if (keyPressed==true)
    {
      if (keyCode==RIGHT)
      {
        // Do the exact same except no keyPressed and do it in draw file and call it direction 2/3/4 etc
        direction=1;
        player_x+=8;
        frame++;
        if (frame>=4) frame=0;
        player=loadImage("Untitled.png"); //from xenosheet which i downloaded from (http://opengameart.org/content/xeon-ultimate-smash-friends) which was stated in my references
      }
      if (Health<60) 
      {
        frame++;
        if (frame>=4) frame=0;
        player=loadImage("SuperMode.png"); //its just an upgraded version from the same site i got the original sprites 
      }
      if (keyCode==LEFT)
      {
        direction=0;
        player_x-=8;
        frame++;
        if (frame>=4) frame=0;
        player=loadImage("Untitled.png"); //from xenosheet which i downloaded from (http://opengameart.org/content/xeon-ultimate-smash-friends)
      }
      if (Health<60) 
      {
        frame++;
        if (frame>=4) frame=0;
        player=loadImage("SuperMode.png");// from the same website i got the "untitled" sprite from as it is just an upgraded version of the sprite
      }
      if (key == ' ')
      {
        player=loadImage("Melee.png"); //from the saame website i got the "untitled" image as it is an upgraded versiopn of the sprite
        musicplayer=minim.loadFile("electriccurrent.wav"); //from freesound.org i downloaded it from their website
        musicplayer.play();
        frame++;
        if (frame>=4) frame=0;
        //for the power up
        if (Health<60) 
        {
          frame++;
          if (frame>=4) frame=0;
          player=loadImage("SuperAttack.png"); // from the same website i got the "untitled" image as it is the same sprite but upgraded
          musicplayer=minim.loadFile("electriccurrent.wav"); //from freesound.org i downloaded it from their website
          musicplayer.play();
        }
        if ((player2_x+55 - player_x+55) > -20 && player2_x < player_x)
        {
          musicplayer=minim.loadFile("Damage.mp3"); //from freesound.org i downloaded it from their website
          musicplayer.play();
          enemy=enemy-10; 
          //println(enemy); //this was just for test purposes
        } else if ((player_x+55 - player2_x+55) > -20 && player_x < player2_x)
        {
          musicplayer=minim.loadFile("Damage.mp3");//from freesound.org i downloaded it from their website
          musicplayer.play();
          enemy=enemy-10;
          // println(enemy); //this was just for test purposes
        }
        if (enemy==0)
        {
          musicplayer=minim.loadFile("dyingrobot.wav"); //from freesound.org i downloaded it from their website
          musicplayer.play();
          Points=Points+10;
          player2_x = random(0, 500);
          enemy=150;
          Health=Health+15;
          musicplayer=minim.loadFile("Healthup.wav"); //from freesound.org i downloaded it from their website
          musicplayer.play();

          if ((player3_x+55 - player_x+55) > -20 && player3_x < player_x)
          {
            musicplayer=minim.loadFile("Damage.mp3"); //from freesound.org i downloaded it from their website
            musicplayer.play();
            enemy2=enemy2-10; 
          } else if ((player_x+55 - player3_x+55) > -20 && player_x < player3_x)
          {
            musicplayer=minim.loadFile("Damage.mp3"); //from freesound.org i downloaded it from their website
            musicplayer.play();
            enemy2=enemy2-10;
          }
          if (enemy2==0)
          {
            musicplayer=minim.loadFile("dyingrobot.wav"); //from freesound.org i downloaded it from their website
            musicplayer.play();
            Points=Points+10;
            player3_x = 0;
            enemy=150;
            Health=Health+15;
            musicplayer=minim.loadFile("Healthup.wav"); //from freesound.org i downloaded it from their website
            musicplayer.play();
          }
          if (Points<30) {
            speed=speed+1;
          }
        }
      }
    }
  }
}
