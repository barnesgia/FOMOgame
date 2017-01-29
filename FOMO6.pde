int screenNumber = 0; //splash screen
float fr=20;//framerate
float fri=0.05; //frame rate increase rate

// scores
int score;
int fbscore;//fb = facebook related
int twscore; //tw = twitter related
int igscore;//ig = instagram related
int snscore;//sn = snapchat related
int plevel;

//fail
boolean bfl= false;
String fl = "You failed at collecting likes";///like reached bottom of screen=gameover
String postfail="Your social media presesnce is too unbalanced, spread the posts around better!";///all the posts of one social media type were skipped=gameover
int rh =50;//row height

///falling likes
int ballSize = 20;
boolean click = false;
 
 //gameOver
int gameOver = 0;

 ///post positions
int sfbx = -10000;//reset position upper limit
int stwx = -10000;
int sigx = 11650;
int ssnx = 11650;
int rstchg = 50;//reset change=^frequency of posts
int getlikeX() {
    return int(random(200,1450));
  }
int getRandomY(){
 return int (random(200,850)); 
 }
int getfbX(){
 return int (random(sfbx,0)); 
 }
int gettwX(){
 return int (random(stwx,0)); 
 }
int getigX(){
 return int (random(1650,sigx)); 
 }
int getsnX(){
 return int (random(1650,ssnx)); 
}
  int[] likex = { getlikeX(),getlikeX(),getlikeX(),getlikeX(),getlikeX(), };
  int[] likey = { 100, 100, 100, 100, 100 };
  int[] fbx={getfbX(),getfbX(),getfbX(),getfbX(),getfbX(),getfbX()};
  int[] fby={getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY()};
  int[] twx={gettwX(),gettwX(),gettwX(),gettwX(),gettwX(),gettwX()};
  int[] twy={getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY()};
  int[] igx={getigX(),getigX(),getigX(),getigX(),getigX(),getigX()};
  int[] igy={getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY()};
  int[] snx={getsnX(),getsnX(),getsnX(),getsnX(),getsnX(),getsnX(),};
  int[] sny={getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY()}; 
  
 //images 
  PImage like;
  PImage phone;
  PImage newsfeed;
  PImage newsfeed2;
  PImage tabs;
  PImage fb;
  PImage twitter;
  PImage snap;
  PImage insta;
  PImage intro;
  PImage over;
  //fb posts
  PImage someecard;//fb0
  PImage attention;//fb1
  PImage bernie;//fb2
  PImage hbd;//fb3
  PImage lifeEvent;//fb4
  PImage baby;//fb5
  //twitter posts
  PImage caps;//tw0
  PImage harambe;//tw1
  PImage hashtags;//tw2
  PImage metaphor;//tw3
  PImage onion;//tw4
  PImage thoughtsPrayers;//tw5
  //insta posts
  PImage beach;//ig0
  PImage foodPorn;//ig1
  PImage lattae;//ig2
  PImage motivation;//ig3
  PImage nails;//ig4
  PImage planeWing;//ig5
  //smap posts
  PImage concert;//sn0
  PImage filter;//sn1
  PImage nudes;//sn2
  PImage party;//sn3
  PImage screenshot;//sn4
  PImage titanic;//sn5
  
//////dimensions
//like
int lw = 50 ;
int lh = 43; 
//fb
int [] fbw = {300,380,300,300,350,219};
int [] fbh = {167,97,265,112,107,299};
//twitter
int [] tww ={300,319,310,300,350,450};
int [] twh = {132,63,66,96,219,67};
//insta 
int []igw = {300,300,300,300,228,300};
int [] igh = {193,191,203,191,299,144};
//snap 
int [] snw = {184,168,177,169,200,120};
int [] snh = {300,300,300,300,300,300};
int sn1w= 62;

//resartbutton
int rstbtnw= 300;//width
int rstbtnh=100;//height

 //logos
int logow = 150;//width
int logoh = 150;//height
int logox1 = 25;//left logos x pos
int logox2 = 1450;//right logos x pos
int logoy1 = 25;//top logos y pos
int logoy2 = 850;//bottom logos y pos

//notification box
int nw = 50;//width
int nh=40;//height

//backgroundstuff
float ny1 = 0;//1st panel starting pos
float  ny2= 3150;//2nd panel starting pos
float speedn =1;

///how far was post dragged from origional position?
int fbbdifx[]={0,0,0,0,0,0};
int fbbdify[]={0,0,0,0,0,0};
int twbdifx[]={0,0,0,0,0,0};
int twbdify[]={0,0,0,0,0,0};
int igbdifx[]={0,0,0,0,0,0};
int igbdify[]={0,0,0,0,0,0};
int snbdifx[]={0,0,0,0,0,0};
int snbdify[]={0,0,0,0,0,0};

//hover?
 boolean fbover[]={false,false,false,false,false,false};
 boolean twover[]={false,false,false,false,false,false};
 boolean igover[]={false,false,false,false,false,false};
 boolean snover[]={false,false,false,false,false,false};
 
 //hover && mousePressed = locked in and will move with mouse
 boolean fblocked[]={false,false,false,false,false,false};
 boolean twlocked[]={false,false,false,false,false,false};
 boolean iglocked[]={false,false,false,false,false,false};
 boolean snlocked[]={false,false,false,false,false,false};
  
 void setup() { 
   size (1650, 1050);
   frameRate(fr);
   
   //loading EVERY IMAGE EVER
   phone = loadImage("phone.png");
   like = loadImage("like.png");
   newsfeed = loadImage("bg.png");
   newsfeed2 = loadImage("bg.png");
   tabs = loadImage("justTabs.PNG");
   fb= loadImage("facebookLogo.png");
   twitter=loadImage("twitterLogo.png");
   insta=loadImage("instaLogo.png");
   snap = loadImage("snapLogo.png");
   intro=loadImage("openingPage.png");
   someecard=loadImage("someecard.jpg");
   attention=loadImage("attention.PNG");
   bernie=loadImage("bernie.PNG");
   hbd=loadImage("hbd.PNG");
   lifeEvent=loadImage("lifeEvent.PNG");
   baby=loadImage("baby.PNG");
   caps=loadImage("caps.PNG");
   harambe=loadImage("harambe.PNG");
   hashtags=loadImage("hashtags.PNG");
   metaphor=loadImage("metaphor.jpeg");
   onion=loadImage("onion.PNG");
   thoughtsPrayers= loadImage("thoughtsPrayers.PNG");
   beach= loadImage("beach.PNG");
   foodPorn=loadImage("foodPorn.PNG");
   lattae=loadImage("lattae.PNG");
   motivation=loadImage("motivation.PNG");
   nails=loadImage("nails.PNG");
   planeWing=loadImage("planeWing.PNG");
   concert=loadImage("concert.PNG");
   filter=loadImage("filter.PNG");
   nudes=loadImage("nudes.PNG");
   party=loadImage("party.PNG");
   screenshot=loadImage("screenshot.PNG");
   titanic=loadImage("titanic.PNG");
   over=loadImage("gameOver.jpg");
  }
  
void draw(){
  SwitchScreens(); 
}

//////startscreen
void startScreen(){
  image(tabs,0,0);
  image(intro,0,100);
}
 
////switch screens
void keyPressed(){
 if(screenNumber>=2){
    restart();
    setup();
 }else if (screenNumber==0){
   screenNumber=1; 
 }
}

void SwitchScreens(){
  if (screenNumber == 1){
   game();
  }
  else if (screenNumber == 2){
    gameOverScreen();
  }
  else if(screenNumber ==0){
   startScreen(); 
  }
}

//////////////////Game///////////////////////////////////
void game(){
  //background
   backgroundOneRepeat();
   backgroundTwoRepeat();
     ny1-=speedn;
     ny2-=speedn;
   image(newsfeed,0,ny1);
   image(newsfeed2,0,ny2);
   image(tabs,0,0);
//logos
   image(fb,logox1,logoy1);
   image(insta,logox1,logoy2);
   image(twitter,logox2, logoy1);
   image(snap,logox2,logoy2);
    fbnotes();
    twnotes();
    ignotes();
    snnotes();
    facebookPosts();
    twitterPosts();
    instaPosts();
    snapPosts();
    reset();
    falling();
    phoneCursor();
    gameFinish();
      if(click){
        gun(mouseX, mouseY);
        click = false;
      }  
}

//notification boxes
void fbnotes(){
   noStroke();
   fill(#D81F1F);
   rect(logox1+(logow*.75),logoy1-(logoh*.05),nw, nh);
   textSize(20);
   fill(255);
   text(fbscore,logox1+(logow*.82), logoy1+20);
}

void twnotes(){
   noStroke();
   fill(#D81F1F);
   rect(logox2+(logow*.75),logoy1-(logoh*.05),nw, nh);
   textSize(20);
   fill(255);
   text(twscore,logox2+(logow*.82), logoy1+20);
}

void ignotes(){
   noStroke();
   fill(#D81F1F);
   rect(logox1+(logow*.75),logoy2-(logoh*.05),nw, nh);
   textSize(20);
   fill(255);
   text(igscore,logox1+(logow*.82), logoy2+20);
}

void snnotes(){
   noStroke();
   fill(#D81F1F);
   rect(logox2+(logow*.75),logoy2-(logoh*.05),nw, nh);
   textSize(20);
   fill(255);
   text(snscore,logox2+(logow*.82), logoy2+20);
}

//cursor
void phoneCursor(){
  noCursor();
  image(phone, mouseX-20, mouseY-37); 
}

//logo outlines
void fbbox(){
  noFill();
  stroke(5,122,224);
  strokeWeight(4);
  rect(logox1,logoy1,logow,logoh); 
}

void twbox(){
  noFill();
  stroke(5,122,224);
  strokeWeight(4);
  rect(logox2,logoy1,logow,logoh);
}

void igbox(){
  noFill();
  stroke(5,122,224);
  strokeWeight(4);
  rect(logox1,logoy2,logow,logoh); 
}

void snbox(){
  noFill();
  stroke(5,122,224);
  strokeWeight(4);
  rect(logox2,logoy2,logow,logoh);
}

/////posts
void facebookPosts(){
 for(int i=0; i<6; i++){
   image(someecard,fbx[0]++,fby[0]);
   image(attention,fbx[1]++,fby[1]);
   image(bernie,fbx[2]++,fby[2]);
   image(hbd,fbx[3]++,fby[3]);
   image(lifeEvent,fbx[4]++,fby[4]);
   image(baby,fbx[5]++,fby[5]);
   if(mouseX>fbx[i] && mouseX<fbx[i]+fbw[i] &&mouseY>fby[i] && mouseY<fby[i]+fbh[i]){
      fbover[i]=true;
   } else{
      fbover[i]=false;
   }
  }
}

void twitterPosts(){
 for(int i=0;i<6;i++){
   image(caps,twx[0]++,twy[0]);
   image(harambe,twx[1]++,twy[1]);
   image(hashtags,twx[2]++,twy[2]);
   image(metaphor,twx[3]++,twy[3]);
   image(onion,twx[4]++,twy[4]);
   image(thoughtsPrayers,twx[5]++,twy[5]);
   
   if(mouseX>twx[i] && mouseX<twx[i]+tww[i] &&mouseY>twy[i] && mouseY<twy[i]+twh[i]){
      twover[i]=true;
    }else{
      twover[i]=false;
    }
 }
}

void instaPosts(){
  for(int i=0;i<6;i++){
    image(beach,igx[i]--,igy[i]);
    image(foodPorn,igx[1]--,igy[1]);
    image(lattae,igx[2]--,igy[2]);
    image(motivation,igx[3]--,igy[3]);
    image(nails,igx[4]--,igy[4]);
    image(planeWing,igx[5]--,igy[5]);
    if(mouseX>igx[i] && mouseX<igx[i]+igw[i] &&mouseY>igy[i] && mouseY<igy[i]+igh[i]){
      igover[i]=true;
    } else{
      igover[i]=false;
    }
  }
}

void snapPosts(){
  for(int i=0;i<6;i++){
     image(concert,snx[i]--,sny[i]);
     image(filter,snx[1]--,sny[1]);
     image(nudes,snx[2]--,sny[2]);
     image(party,snx[3]--,sny[3]);
     image(screenshot,snx[4]--,sny[4]);
     image(titanic,snx[5]--,sny[5]);
     if(mouseX>snx[i] && mouseX<snx[i]+snw[i] &&mouseY>sny[i] && mouseY<sny[i]+snh[i]){
        snover[i]=true;
     } else{
        snover[i]=false;
     }
  }
}

///grab post
void mousePressed(){
  click = true;
  for(int i=0;i<6;i++){
    //fb
     if(fbover[i]){
        fblocked[i]=true; 
     }else{
      fblocked[i]=false; 
     }
   
     fbbdify[i]=mouseX-fbx[i];
     fbbdify[i]=mouseY-fby[i];  
     
    //tw
     if(twover[i]){
      twlocked[i]=true; 
     }
     else{
      twlocked[i]=false; 
     }
     twbdify[i]=mouseX-twx[i];
     twbdify[i]=mouseY-twy[i];
     
     //ig  
     if(igover[i]){
      iglocked[i]=true; 
     }
     else{
      iglocked[i]=false; 
     }
     igbdify[i]=mouseX-igx[i];
     igbdify[i]=mouseY-igy[i];
     
    //sn
     if(snover[i]){
      snlocked[i]=true; 
     }
     else{
      snlocked[i]=false; 
     }
     snbdify[i]=mouseX-snx[i];
     snbdify[i]=mouseY-sny[i];
  }
}

  ///movepost
  void mouseDragged(){
    for(int i=0;i<6;i++){
      if(fblocked[i]){
      fbx[i]=mouseX-fbbdifx[i];
      fby[i]=mouseY-fbbdify[i];
      fbbox();
     } 
     
     if(twlocked[i]){
      twx[i]=mouseX-twbdifx[i];
      twy[i]=mouseY-twbdify[i];
      twbox();
     } 
     
     if(iglocked[i]){
      igx[i]=mouseX-igbdifx[i];
      igy[i]=mouseY-igbdify[i];
      igbox();
     }
    
     if(snlocked[i]){
      snx[i]=mouseX-snbdifx[i];
      sny[i]=mouseY-snbdify[i];
      snbox();
     }
    }  
  }
  
  ///drop post
  void mouseReleased(){
   for(int i=0;i<6;i++){ 
     fblocked[i]=false; 
     twlocked[i]=false;
     iglocked[i]=false;
     snlocked[i]=false;
   }
  }
 
 ///reset post
 void reset(){
   for(int i=0; i<6; i++){
     if(fbx[i]>0 && fbx[i]<200 && fby[i]>0 && fby[i]<200){
      fbx[i]=getfbX();
      fby[i]=getRandomY();
      fbscore=fbscore+1;
      sfbx=sfbx-rstchg;
      fr=fr+fri;
      fblocked[i]=false; 
     }
   }
   for(int i=0;i<6;i++){
     if(twx[i]>1450 && twx[i]<1650 && twy[i]>0 && twy[i]<200){
      twx[i]=gettwX();
      twy[i]=getRandomY();
      twscore=twscore+1;
      stwx=stwx-rstchg;
      fr=fr+fri;
   twlocked[i]=false;
     }
   }
   for(int i=0;i<6;i++){
     if(igx[i]>0 && igx[i]<200 && igy[i]>850 && igy[i]<1050){
      igx[i]=getigX();
      igy[i]=getRandomY();
      igscore=igscore+1;
      sigx=sigx-rstchg;
      fr=fr+fri;
      iglocked[i]=false;
     }
   }
   for(int i=0;i<6;i++){
     if(snx[i]>1450 && snx[i]<1650 && sny[i]>850 && sny[i]<1050){
      snx[i]=getsnX();
      sny[i]=getRandomY();
      snscore=snscore+1;
      ssnx=ssnx-rstchg;
      fr=fr+fri;
      snlocked[i]=false;
     }
   }
 }
 
  //like stuff
  void falling(){   
    for (int i=0; i<5; i++){
      image(like,likex[i], likey[i]++);
    }
  }
  
  void gun(int shotX, int shotY) {
    boolean strike = false;
    for (int i = 0; i < 5; i++) {
      if((shotX >= (likex[i])) && (shotX <= (likex[i]+lw)) && (shotY >=(likey[i]))&&(shotY<=(likey[i]+lw))) {
        strike = true;
        image(like,likex[i], likey[i]);
        likex[i] = getlikeX();
        likey[i] = 100;
      // scoreing stuff
        score++;
        fr=fr+fri;
      }    
      if(strike == false) {
        line(mouseX, 565, mouseX, 0);
      }  
    }
 }

  ///////moving background
  void backgroundOneRepeat(){
  if(ny1==-3150){
    ny1=3150;
    ny1-=1;
  } 
 }
 
 void backgroundTwoRepeat(){
  if(ny2==-3150){
     ny2=3150; 
     ny2-=1;
  }
 }

//////losing
  void gameFinish() {
    for (int i=0; i< 5; i++){
      if(likey[i]>=1050){
        bfl=true;
        gameOverScreen();
        screenNumber=screenNumber+1;
       }
    }
    if(fbx[0]>1650 && fbx[1]>1650 && fbx[2]>1650 && fbx[3]>1650 && fbx[4]>1650 && fbx[5]>1650){
        screenNumber=screenNumber+1;
        gameOverScreen();
     }
      if(twx[0]>1650 && twx[1]>1650 && twx[2]>1650 && twx[3]>1650 && twx[4]>1650 && twx[5]>1650){
        screenNumber=screenNumber+1;
        gameOverScreen();
     }
      if(igx[0]<0-igw[0] && igx[1]<0-igw[1] && igx[2]<0-igw[2] && igx[3]<0-igw[3] && igx[4]<0-igw[4] && igx[5]<0-igw[5]){
        gameOverScreen();
        screenNumber=screenNumber+1;
        
     }
      if(snx[0]<0-snw[0] && snx[1]<0-snw[1] && snx[2]<0-snw[2] && snx[3]<0-snw[3] && snx[4]<0-snw[4] && snx[5]<0-snw[5]){
        gameOverScreen();
        screenNumber=screenNumber+1;
     }
  }

void gameOverScreen(){
    plevel=score+fbscore +twscore+igscore+snscore;
    image(over,0,0);
    fill(255);
    textAlign(CENTER);
    textSize(36);
      if(bfl){
        text(fl, width/2, height/2-(7*rh));
       } else{
          text(postfail, width/2, height/2-(7*rh)); 
       }
    text("Wow! You have:", width/2, height/2-(6*rh));
    text(fbscore, width/3, height/2-(5*rh));
    text("facebook friends", width/2, height/2-(5*rh));
    text(twscore, width/3, height/2-(4*rh));
    text("twitter followers", width/2, height/2-(4*rh));
    text(igscore, width/3, height/2-(3*rh));
    text("instagram followers", width/2, height/2-(3*rh));
    text(snscore, width/3, height/2-(2*rh));
    text("snapchat friends", width/2, height/2-(2*rh));
    text(score, width/3, height/2-rh);
    text("likes", width/2, height/2-(rh));
    text (plevel, width/3, height/2);
    text("people love and adore you", width/2, height/2);
    text("Don\'t you feel popular?!", width/2, height/2+rh);
    text("But how many real experiences did you miss out on in the process?!", width/2, height/2+(2*rh));
    text("Is this really happiness? Who knows?", width/2, height/2+(3*rh));
    text("No one knows anything anymore!", width/2, height/2+(4*rh)); 
    text("What even is reality?", width/2, height/2+(5*rh));
    text("Who cares? Christina just posted a new cat video!!!", width/2, height/2+(6*rh));
    text("Go like/fav/share it now! OR ELSE!!!!!!" ,width/2, height/2+(7*rh));    
    fill(255);
    text("Press SPACE to restart", width/2, height/2+(9*rh));
    cursor();
}

void restart(){
  //resetting values
  screenNumber=0;
  fr=20;
  fbscore=0;
  twscore=0;
  igscore=0;
  snscore=0;
  plevel=0;
  sfbx=-10000;
  stwx=-10000;
  sigx=11650;
  ssnx=11650;
  //fbbdifx[]={0,0,0,0,0,0};
  //fbbdify[]={0,0,0,0,0,0};
  //twbdifx[]={0,0,0,0,0,0};
  //twbdify[]={0,0,0,0,0,0};
  //igbdifx[]={0,0,0,0,0,0};
  //igbdify[]={0,0,0,0,0,0};
  //snbdifx[]={0,0,0,0,0,0};
  //snbdify[]={0,0,0,0,0,0};
  //likex[]={getlikeX(),getlikeX(),getlikeX(),getlikeX(),getlikeX(),getlikeX()};
  // likey=100;
  //fbx[]={getfbX(),getfbX(),getfbX(),getfbX(),getfbX(),getfbX()};
  // twx[]={gettwX(),gettwX(),gettwX(),gettwX(),gettwX(),gettwX()};
  // igx[]={getigX(),getigX(),getigX(),getigX(),getigX(),getigX()};
  //snx[]={getsnX(),getsnX(),getsnX(),getsnX(),getsnX(),getsnX()};
  //fby[]={getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY()};
  //twy[]={getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY()};
  //igy[]={getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY()};
  //sny[]={getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY(),getRandomY()};
}