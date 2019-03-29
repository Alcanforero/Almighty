import arb.soundcipher.*;
import processing.sound.*;

int acompPointer = -1;
boolean flag = true;
int cirtam = 50;

color sun, mountain, sky, ground, stars;
int mode = 0;
int ang = 0;

SoundFile score;
FFT fft;
int bands = 128;
float[] sum = new float[bands];
int scale = 100;
float barWidth;

SoundCipher pianoLeft = new SoundCipher(this);
SoundCipher string = new SoundCipher(this);
SoundCipher bombo = new SoundCipher(this);
SoundCipher hihat = new SoundCipher(this);

ArrayList<chord> pianoLeftScore = new ArrayList<chord>();
ArrayList<chord> stringScore = new ArrayList<chord>();

void setup() {
  size(640, 360);
  background(255);
  noStroke();
  
  barWidth = width/float(bands);
  
  score = new SoundFile(this, "score.mp3");
  fft = new FFT(this, bands);
  fft.input(score);
  
  frameRate(16);
  pianoLeft.instrument(0);
  string.instrument(49);
  bombo.instrument(116);
  hihat.instrument(117);
  loadScore();
  
  sun = color(0,0,0);
}

void draw() {
  paintAlmighty();
  playAlmighty(); //<>//
}

void paintAlmighty() {
  if (mode>=0) {
    background(255);
    
    if (mode>=2) {
        fill(sky);
        rect(0,0,width,height-60);
        fill(ground);
        rect(0,height-60,width,60);
    }
    if (mode>=1) {
      fill(sun);
      ellipse(500, 80, cirtam, cirtam);
      cirtam = 70;
    }
    
    if (mode>=4) {
       fill(stars);
       pushMatrix();
       translate(0,ang);
       rect(50,160,10,10);
       rect(100,130,10,10);
       rect(150,50,10,10);
       rect(200,200,10,10);
       rect(250,120,10,10);
       rect(300,80,10,10);
       rect(350,70,10,10);
       rect(400,160,10,10);
       rect(450,190,10,10);
       rect(500,150,10,10);
       rect(550,60,10,10);
       popMatrix();
    }
      
    if (mode>=3) {
       fft.analyze();  
       fill(mountain);
       for (int i = 0; i < bands; i++) {
         sum[i] += (fft.spectrum[i] - sum[i]) * 0.2;
         rect(i*barWidth, height-60, barWidth, -sum[i]*height*scale);
       }
     }    
  }
}

void playAlmighty() {
  // Solo bombo
  if(frameCount%8 == 0 && frameCount>8) {
    bombo.playNote(34,120,8);
    cirtam = 80;
    if (mode==0) mode=1;
  }
  
  if (frameCount>32) {
    // Piano mano izquierda
    if(frameCount%16 == 0) {
      if (mode==1) mode = 2;
      
      if (sky==color(176,224,230)) {
        sky = color(25,25,112);
        ground = color(128,0,128);
        sun = color(230,230,250);
        mountain = color(139,0,139);
        stars = color(176,224,230);
      }
      else {
        sky = color(176,224,230);
        ground = color(210,105,30);
        sun = color(255,215,0);
        mountain = color(205,133,63);
        stars = color(255);
      }
      if (acompPointer >= pianoLeftScore.size()-1) { acompPointer = 0; }
      else { acompPointer++; }
      
      pianoLeft.playChord(pianoLeftScore.get(acompPointer).getChord(), 40, 8);
    }
    
    // Piano mano derecha
    if (frameCount>=178 && !score.isPlaying()) {
        if (mode==2) mode=3;
        score.loop();
    }
    
    // Cuerdas
    if(frameCount>288) {
      if(frameCount%16 == 0) {
        if (mode==3) mode=4;
        string.playChord(stringScore.get(acompPointer).getChord(), 40, 8);
      }
    }
    
    // Timbales a modo de HiHat
    if(frameCount>300) {      
      if(frameCount%4 == 0) {
        hihat.playNote(70,60,8);
        if (stars==color(255)) {
          ang-=5;
        } else {
          ang+=5;
        }
      }
    }
  }
}

class chord {
  float[] pitches = new float[3];
  
  chord(int n1, int n2, int n3) {
    pitches[0] = n1;
    pitches[1] = n2;
    pitches[2] = n3;
  }
  
  float[] getChord() {
    return pitches;
  }
}

void loadScore() {
  pianoLeftScore.add(new chord(53,57,60));
  pianoLeftScore.add(new chord(52,55,60));
  pianoLeftScore.add(new chord(50,55,59));
  pianoLeftScore.add(new chord(52,57,60));
  
  stringScore.add(new chord(65,69,72));
  stringScore.add(new chord(64,67,72));
  stringScore.add(new chord(62,67,71));
  stringScore.add(new chord(64,69,72));
}
