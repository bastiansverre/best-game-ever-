//leuk spel
//als hij het niet doet, klik dan 1 keer
//bom werkt alleen in de lucht een op het gras
//pijltje naar links is naar links.
//pijltje naar rechts is naar rechts.
//pijltje naar beneden is bukken (voor de draak).
//pijltje naar boven is springen (je kan vliegen, net als flappybird).
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer muziek;
PImage don;
PImage c;
PImage b;
PImage a;
PImage d;
PImage e;
PImage f;
PImage h;
PImage z;
PImage w;
PImage qw;
PImage gras;
PImage plank;
boolean r = false;
boolean l = false;
boolean s = false;
float ispauze; 
float isgeenpauze = 1;
float x = 60; 
float y = 580;
float xb = 1400; 
float xv = 1800; 
float xa = 2400;
float xe = 2000;
float yf = -100;
float xh = 1400;
float xz = 1550;
float xw = -50;
float yqw = 1500;
int score = 0;
void setup() {
  size(1400, 750);
  textSize(32);
  don = loadImage("don.png");
  don.resize(50, 80);
  c = loadImage("c.gif");
  c.resize(40, 40);
  b = loadImage("b.png");
  b.resize(50, 50);
  a = loadImage("a.png");
  a.resize(50, 50);
  e = loadImage("e.png");
  e.resize(40, 40);
  f = loadImage("f.png");
  f.resize(60, 60);
  h = loadImage("h.gif");
  h.resize(35, 35);
  z = loadImage("z.png");
  z.resize(50, 50);
  w = loadImage("w.gif");
  w.resize(50, 50);
  qw = loadImage("qw.gif");
  qw.resize(150, 150);
  gras = loadImage("gras.png");
  gras.resize(450, 80);
  plank = loadImage("plank.png");
  plank.resize(200, 80);
  minim = new Minim(this);
  muziek = minim.loadFile("Wie is de Mol_ Muziek Medley.mp3", 2048);
  muziek.loop();
}
void tekenMonsters()
{
  image(c, xb, 650);
  image(b, xv, 630);
  if (score > 15)
  {
    image(a, xa, 630);
  }
  if (score > 35)
  {
    image(e, xe, 575);
  }
  if (score > 50)
  {
    image(f, 700, yf);
  }
  image(h, xh, 480);
  image(z, xz, 300);
  image(w, xw, 300);
  if (score > 500)
  {
    image(qw, yqw, 350);
  }
}
void draw() {
  background(0, 0, 255);
  image(gras, 575, 500);
  image(plank, 300, 350);
  fill(100, 200, 150);
  tekenMonsters();
  image(don, x, y); 
  line(0, 675, 1400, 675);
  fill(0, 233, 69);
  rect(0, 675, 1400, 75);
  fill(21, 74, 40);
  rect(0, 0, 1400, 150);
  fill(255, 255, 255);
  text("p = weg", 200, 50);
  text("o = opnieuw", 200, 100);
  text("i = pauze", 500, 50);
  text("score: " + score, 1000, 50);
  textSize(32);
  text("u = play", 500, 100);
  if (ispauze == 1)
  {
  text("pauze, maar je kan bewegen", 600, 400);
  }
  if (x > 200)
  {
    stroke(255, 80, 90);
    line(199, 0, 199, 675);  
    line(1201, 0, 1201, 675);
  }
  if (x <= 199)
  {
    x = x + 20;
  }
  if (x >= 1201)
  {
    x = x - 20;
  }
  if (r && x < 1300)
  {
    x = x + 6;
  }
  if (l && x > 10)
  {
    x = x -6;
  } 
  if (y < 600)
  {
    y = y + 5.5;
  }
  if (isgeenpauze == 1)
  {
   ispauze = 0;
   xb = xb -2;
   xv = xv -3;
   xa = xa -7;
   xe = xe -5;
   yf = yf +6;
   xh = xh -4;
   xw = xw +6;
   xz = xz -6;
  }
  if (ispauze == 1)
  {
   isgeenpauze = 0;
   xb = 0;
   xv = 0;
   xa = 0;
   xe = 0;
   yf = 0;
   xh = 1400;
   xw = 1400;
   xz = 0;
   yqw = -100;
  }
  
  if(score > 500 && yqw < 1600)
  {
    yqw = yqw -8;
  }
  
  if (yqw < 1400 && yqw > 0)
  {
   xb = 0;
   xv = 0;
   xa = 0;
   xe = 0;
   yf = 0;
   xh = 1400;
   xw = 1400;
   xz = 0;
  }
  
  //vijand c
  if (xb < x + 40 && xb > x && y > 560)
  {
    exit();
  }
  if (xb < 0)
  {
    xb = xb + 1400;
    score = score + 1;
  }
  //vijand b
  if (xv < x + 50 && xv > x && y > 560)
  {
    exit();
  }
  if (xv < 0)
  {
    xv = xv + 1500;
    score = score + 1;
  }
  //vijand a
  if (xa < x + 50 && xa > x && y > 560 && score > 10)
  {
    exit();
  }
  if (xa < 0 && score > 10)
  {
    xa = xa + 2500;
    score = score + 1;
  }
  //vijand e
  if (xe < x + 50 && xe > x && y > 540 && y < 620 && score > 10)
  {
    exit();
  }
  if (xe < 0 && score > 25)
  {
    xe = xe + 1400;
    score = score + 1;
  }
  //vijand f
  if (x < 750 && x > 650 && yf < 600 && yf > 500 && y < 600 && y > 500 && score > 50)
  {
    exit();
  }
  if (yf > 750 && score > 50)
  {
    yf = yf - 750;
    score = score + 1;
  }
  //vijand h
  if (xh < x + 50 && xh > x && y > 490 && y < 585)
  {
    exit();
  }
  if (xh < 0)
  {
    xh = xh + 1500;
    score = score + 1;
  }
  //vijand w
  if (xw < x + 50 && xw > x && y > 300 && y < 400)
  {
    exit();
  }
  if (xw > 1400)
  {
    xw = xw+ - 1450;
    score = score + 2;
  }
  if ( x > 575 && x < 1025 && y < 600 && y > 500)
  {
    y = 500;
  }
  if ( x > 300 && x < 500 && y < 400 && y > 300)
  {
    y = 300;
  }
  //vijand z
  if (xz < x + 50 && xz > x && y > 300 && y < 400)
  {
    exit();
  }
  if (xz < -400)
  {
    xz = 1450;
    score = score + 2;
  }
  if ( x > 575 && x < 1025 && y < 600 && y > 500)
  {
    y = 500;
  }
  if ( x > 300 && x < 500 && y < 400 && y > 300)
  {
    y = 300;
  } 
  //vijand qw 1baas
  if (yqw > x - 50 && yqw < x + 100 && y < 400 && y > 325)
  {
    exit();
  }
  if (yqw < -200)
  {
    yqw = 1500;
    score = score + 2;
  }
  if (x < yqw + 140 && x > yqw + 30 && y < 275 && y > 200)
  {
    yqw = yqw -0;
    yqw = 1800;
  }
}
void keyPressed() {
  if (key == ' ')
  {
    s = true;
  }
  if (keyCode == RIGHT)
  {
    r = true;
  }
  if (keyCode == LEFT)
  {
    l = true;
  }
  if (keyCode == UP && y >= 225)
  {
    y = y -150;
  }
  if (keyCode == DOWN && y >= 580)
  {
    y = y + 50;
  }
  //spelopties
  if (keyCode == 'P')
  {
   exit(); 
  }
  if (keyCode == 'O')
  {
   x = 60; 
   y = 580;
   xb = 1400; 
   xv = 1800; 
   xa = 2400;
   xe = 2000;
   yf = -100;
   xh = 1400;
   xz = 1550;
   xw = -50;
   score = 0;
  }
  if (keyCode == 'I')
  {
    ispauze = 1;
    isgeenpauze = 0;
  }
    if (keyCode == 'U')
  {
    ispauze = 0;
    isgeenpauze = 1;
  }
  //cheats     
  if (keyCode == 'Z')
  {
    xa = 2780;
  }
  if (keyCode == 'X')
  {
    xe = 2000;
  }
  if (keyCode == 'C')
  {
    score = score + 100;
  }
  if (keyCode == 'V')
  {
    score = score + 1000;
  }
  if (keyCode == 'B')
  {
    y = y - 350;
  }
  if (keyCode == 'N')
  {
    x = x - 250;
  }    
  if (keyCode == 'M')
    x = x + 250;
}

void keyReleased()
{
  if (keyCode == RIGHT)
  {
    r = false;
  }
  if (keyCode == LEFT)
  {
    l = false;
  }
}