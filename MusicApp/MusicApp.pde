import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
//
File musicFolder ;
File SoundEffectFolder ; //Class forc java.io.* Library
Minim minim ; //creates object to access all function that available
int numberOfSongs = 3, numberOfSoundEffects = 0, currentSong = 0, currentEffect = 0 ;
AudioPlayer[] songList = new AudioPlayer[numberOfSongs] ; //song is now similar to song1
AudioMetaData[] songListMetaData = new AudioMetaData[numberOfSongs] ; //same as above
AudioMetaData[] soundEffectMetaData = new AudioMetaData [numberOfSoundEffects] ;
AudioPlayer[] soundEffect = new AudioPlayer[ numberOfSoundEffects ] ;
//
int X1Width, X1Height ;
float BackgroundX1, BackgroundY1, BackgroundWidthXT, BackgroundHeightXT ;
float BackgroundX2, BackgroundY2, BackgroundWidth, BackgroundHeight ;
float BackgroundX3, BackgroundY3, BackgroundWidthXW, BackgroundHeightXW ;
PFont generalFont ;
color OceanBlue=#3026D1 ;
Boolean AnimationB = false ;
PImage Image, JKT48Img, YoasobiImg, YSBTrialImg ;
//String tittle for songListMetaData[currenrSong].title () ; = Basically Title
String Imageing ;
String Images ;
int radius, radius2 ;
int ratio, ratio2 ;
float AXWidth, AXHeight ;
float ABX, BBX ;
float AYWidth, AYHeight ;
float GFWidth, GFHeight ;
float FCY, GCY ;
Boolean changeState=false, stopBoolean=false, pauseBoolean=false, startBoolean=false, pause=false, FBoolean=false, PBoolean=false;
//
void setup () {
  //size() or fullScreen() choose between both > for ur display Option.
  fullScreen () ;
  //Display for Algorithm
  AXWidth = +displayWidth ;
  AXHeight = +displayHeight ;

  //

  X1Width = displayWidth ;
  X1Height = displayHeight ;
  // Background Image Codes >>
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  //Music File To Load

  String SoundEffect = "FreeWare/SoundEffect/" ;
  String Pathway = "FreeWare/MusicDownload/" ;
  String extension = ".mp3"; //Type of the Music
  String pathsong = sketchPath (Pathway);
  String pathEffect = sketchPath (SoundEffect);
  musicFolder = new File(pathsong);
  int musicFileCount = musicFolder.list().length;
  File[] musicFiles = musicFolder.listFiles(); //String of Full Directies
  String[] songFilePathway = new String[musicFileCount];
  for ( int i = 0; i < musicFiles.length; i++ ) {
    songFilePathway[i] = ( musicFiles[i].toString() );
  }
  //Re-Execute songList Population, Simillar to DIVS type of Population >>
  numberOfSongs = musicFileCount; //Placeholder Only, reexecute lines after fileCount Known
  songList = new AudioPlayer[numberOfSongs]; //song is now similar to song1
  printArray(songList);
  songListMetaData = new AudioMetaData[numberOfSongs]; //same as above
  for ( int i=0; i<musicFileCount; i++ ) {
    printArray(songList);
    songList[i]= minim.loadFile( songFilePathway[i] );
    songListMetaData[i] = songList[i].getMetaData();
  } //End Music Load
  // sound effect
  /*
  effectFolder = new File(pathEffect);
   int effectAmount = effectFolder.list().length;
   File[] effectFiles = effectFolder.listFiles();
   String[] effectForward = new String[effectAmount];
   for (int i = 0;  i < effectFiles.length; i++ ) {
   effectForward[i] = (effectFiles[i].toString() );
   }
   numberOfSoundEffects = effectAmount;
   soundEffect = new AudioPlayer[numberOfSoundEffects];
   printArray(soundEffect);
   soundEffectMetaData = new AudioMetaData [numberOfSoundEffects];
   for ( int i=0; i<musicFileCount; i++ ) {
   soundEffect[i]=minim.loadFile(effectForward[i]);
   }
   */
  //
  propercode () ;
  //
  generalFont = createFont ( "Agbalumo Regular", 48 ) ;
  //
  // Backrgound DIVS Codes >>
  //
  String Path = "../Images/ImagesUsed/" ;
  Images = "Yoasobi.jpg" ;
  String JKT48 = "JKT48ZEE.jpg" ;
  String Yoasobi = "Yoasobi2.jpg" ;
  String ways = "Yoasobi3.jpg" ;
  String YSBTrial = "Yoasobi4.jpg" ;
  /*
 } else if ( songList[currentSong].isPlaying()) {
   image= "testing.jpg";
   }
   */
  Imageing = Images ;
  BackgroundX2 = X1Width*0 ;
  BackgroundHeight = X1Height*0 ;
  BackgroundWidth = X1Width-1 ;
  BackgroundHeight = X1Height-1 ;

  String JKT48Image = sketchPath ( Path + ways ) ;
  String PathImage = sketchPath ( Path + Imageing) ;
  String YoasobiImage = sketchPath ( Path + Yoasobi ) ;
  String YSBTrialImage = sketchPath ( Path + YSBTrial ) ;
  println ( "identify", PathImage ) ;
  JKT48Img =  loadImage ( JKT48Image ) ;
  Image =   loadImage ( Imageing ) ;
  YoasobiImg =  loadImage ( Yoasobi ) ;
  YSBTrialImg =  loadImage ( YSBTrial ) ;

  //
  BackgroundX1 = X1Width*1/4 ;
  BackgroundY1 = X1Height*0 ;
  BackgroundWidthXT = X1Width/2 ;
  BackgroundHeightXT = X1Height*3/10 ;
  //
  BackgroundX3 = X1Width *1/2-( BackgroundWidthXW/2 ) ;
  BackgroundY3 = X1Height*7/10 ;
  BackgroundWidthXW  = X1Width*1/15 *X1Height/X1Width ;
  BackgroundHeightXW = X1Height*1/15 ;
  //
  ABX = X1Width*3/8 ;
  BBX = X1Width*5/8 ;
  AYWidth = BackgroundWidthXW ;
  AYHeight = BackgroundHeightXW ;
  GFWidth =  BackgroundWidthXW ;
  GFHeight = BackgroundHeightXW ;
  FCY = BackgroundY3 ;
  GCY = BackgroundY3  ;
  //
  //repeat:  println("?", songMetaData1.?());
  //println("File Name", songListMetaData[0].fileName() ); //Data correct verify
  //
  //songList[currentSong].play();
}//End setup
//
void draw () {
  /*
  if (key=='P' || key=='p' ) {
   //image (josh, BX, BY, BW, BH);
   //josh = loadImage (path + image );
   }
   */
  //Note: logical operators could be nested IFs
  if ( songList[currentSong].isLooping() && songList[currentSong].loopCount()!=-1 ) println("there are", songList[currentSong].loopCount(), "loop left.");//
  if ( songList[currentSong].isLooping() && songList[currentSong].loopCount()==-1 ) println("looping lot.");
  if ( songList[currentSong].isPlaying() && songList[currentSong].isLooping() ) println("play -e^ipi");
  //
  //Trying to Debuging LOL
  println ( "Song position", songList[currentSong].position(), "Song length", songListMetaData[currentSong].length() );
  //
  //
  //text(songListMetaData[0].title(), BXT, BYT, BWT, BHT);
  fill(255) ;
  //
  PPButton () ;
  //
  fill(255) ;
  //rect(BackgroundX1, BackgroundY1, BackgroundWidthXT, BackgroundHeightXT ;);
  textAlign (CENTER, CENTER) ;
  int size = 60 ;
  fill(OceanBlue);
  textFont (generalFont, size);
  text(songListMetaData[currentSong].title(), BackgroundWidthXT, BackgroundHeightXT); //ERROR FIx later
  //autoplay for ur MUSIC PLAYER
  if ( songList[currentSong].isPlaying()==true ) {
    if ( stopBoolean==true || pauseBoolean==true ) {
      songList[currentSong].pause();
    }
    if ( stopBoolean==true ) songList[currentSong].rewind();
  } else {
    if ( changeState==false ) {
      songList[currentSong].rewind();
      if (currentSong==numberOfSongs-1) {
        currentSong=0;
      } else {
        currentSong = currentSong + 1; //currentSong--; currentSong-=1}
      }
      songList[currentSong].play();
    }
    songList[currentSong].play();
    if ( stopBoolean==false && pauseBoolean==false && changeState==true ) {
      songList[currentSong].play();
      changeState=false;
      //println("hereD5", songList[currentSong].isPlaying(), stopBoolean, pauseBoolean, changeState);
    }
    if ( pauseBoolean==false && stopBoolean==false  && changeState==true) {
      songList[currentSong].play();
      changeState=false;
    } else {
      if ( changeState==true ) {
        if (pauseBoolean==true && stopBoolean==false ) {
          if (songList[currentSong].isPlaying()) {
            songList[currentSong].pause();
          }
        }
      }
    }
  }
  //
  //
  /*
  if (songList[currentSong].isPlaying () ) {
   //Empty IF, TRUE
   } else {
   //currentSong at end of FILE
   songList[currentSong].rewind();
   //currentSong = currentSong+1;
   songList[currentSong].play();
   }
   */
  //
}//End draw
//
void keyPressed () {
  //broken for now but fix variable should fixed
  if ( key=='P' || key=='p' ) {
    changeState=true;
    if ( pauseBoolean==false ) {
      pauseBoolean=true;
      println("herek2", pauseBoolean);
    } else {
      pauseBoolean=false;
      println("herek3", pauseBoolean);
      //playList[currentSong].play();
    }
    if (  stopBoolean==true ) {
      stopBoolean=false;
    }
    println ( "herek4", songList[currentSong].isPlaying(), pauseBoolean, stopBoolean, changeState );
  }
  //
  if ( key=='S' | key=='s' ) {
    changeState=true;
    if ( stopBoolean == false ) {
      stopBoolean = true;
      //playList[currentSong].pause(); //auto .rewind()
    } else {
      stopBoolean = false;
      //playList[currentSong].rewind(); //Not Necessary
    }
  }
  /*
  if (key>='1' || key<='9' ) { //LoopButton
   String keystr = String.valueOf(key);
   println(keystr);
   int loopNum = int(keystr);
   if (key=='L' || key=='l' ) song[0].loop(loopNum-1);
   if (key=='M' || key=='m' ) {
   if ( songList[0].isMuted() ) {
   //ERROR: song might not be playing
   //ask if it (.isPlaying()) playing or (!.isPlaying())playin't
   song[0].unmute();
   } else {
   //possible error: might rewind the song
   song[0].mute();
   }//End mute
   }// stop the speaker
   }
   //song1.loop(0);
   //
   //
   if ( key=='F' || key=='f' ) song[0].skip(songMetaData[0].length()); //SKIP forward 1 second (1000) milisecond
   if ( key=='R' || key=='r' ) song[0].skip(songMetaData[0].length()*-1); // SKIP backward 1 second (-1000) milisecond
   //
   //Simple Stop behaviour: ask if .playing() & .pause() & .rewind(), or .rewind()
   if ( key=='S' || key=='s' ) {
   if ( song[0].isPlaying() ) {
   song[0].pause();
   } else {
   song[0].rewind();
   }
   }
   */
  //
  //Simple Pause behaviour: .pause() & hold .position(), then Play
  //
  if ( key==CODED && keyCode==DOWN ) { //Previous
    if ( songList[currentSong].isPlaying() ) {
      songList[currentSong].pause();
      songList[currentSong].skip(songListMetaData[currentSong].length()-songList[currentSong].position());
      if (currentSong==0) {
        currentSong=numberOfSongs - 1;
      } else {
        if (currentSong==0) {
          currentSong = currentSong + 1; //currentSong--; currentSong-=1}
        } else if (currentSong>(numberOfSongs-1))
          currentSong = 0;
        songList[currentSong].play();
      }
    }
    println(currentSong);
    songList[currentSong].play();
  }
  //
  if ( key==CODED && keyCode==UP ) { //Previous Keypressed
    if ( songList[currentSong].isPlaying() ) {
      songList[currentSong].pause();
      songList[currentSong].rewind();
      if (currentSong==0) {
        currentSong=numberOfSongs-1;
      } else {
        currentSong = currentSong - 1; //currentSong--; currentSong-=1}
      }
    }
    println(currentSong);
    songList[currentSong].play();
  } //End Previous
  //
  if (key=='Y' || key=='y') {
    if ( songList[currentSong].isPlaying()==true ) {
      songList[currentSong].pause();
    } else {
      songList[currentSong].play();
    }
  }
} //End keyPressed
//
void mousePressed () {
  if ( mouseX > (ABX-AYWidth/2) && mouseX < (ABX-AYWidth/2) + AYWidth && mouseY > (GCY-AYHeight/2) && mouseY < (GCY-AYHeight/2) + AYHeight) {
    PBoolean = true;
    if ( PBoolean = true) {
      if ( songList[currentSong].isPlaying() ) {
        songList[currentSong].pause();
        songList[currentSong].rewind();
        if (currentSong==3) {
          currentSong=numberOfSongs-1;
        } else {
          if (currentSong>(numberOfSongs-1)) {
            currentSong = currentSong - 1; //currentSong--; currentSong-=1}
          } else if (currentSong<(numberOfSongs-1))
            currentSong = 3;
          songList[currentSong].play();
        }
      }
      println(currentSong);
      songList[currentSong].play();
    }
  }
  //
  //
  //
  if ( mouseX > ( BBX-GFWidth/2 ) && mouseX < ( BBX-GFWidth/2 ) + GFWidth && mouseY > ( FCY-GFHeight/2 ) && mouseY < ( FCY-GFHeight/2 ) + GFHeight ) {
    FBoolean = true;
    if (FBoolean = true) {
      songList[currentSong].pause();
      songList[currentSong].skip(songListMetaData[currentSong].length()-songList[currentSong].position());
      if (currentSong==0) {
        currentSong=numberOfSongs - 1;
      } else {
        if (currentSong<(numberOfSongs-1)) {
          currentSong = currentSong + 1; //currentSong--; currentSong-=1}
        } else if (currentSong>(numberOfSongs-1))
          currentSong = 0;
        songList[currentSong].play();
      }
      println(currentSong);
      songList[currentSong].play();
    }
  }
  //
  //
  //
  if  ( mouseX > (ABX-AYHeight/2 ) && mouseX < (ABX-AYHeight/2 ) +  BackgroundWidthXW && mouseY > ( GCY- AYHeight/2) +  BackgroundHeightXW ) {
    pause=true;
    if (pause=true) {
      fill ( OceanBlue );
      noStroke ();
      ellipse ( BackgroundX3, BackgroundY3, BackgroundWidthXW, BackgroundHeightXW  );
      changeState=true;
      if ( pauseBoolean==false ) {
        pauseBoolean=true;
        println("herek2", pauseBoolean);
      } else {
        pauseBoolean=false;
        println("herek3", pauseBoolean);
        //songList[currentSong].play();
        noFill ();
        noStroke ();
        ellipse (BackgroundX3, BackgroundY3, BackgroundWidthXW, BackgroundHeightXW  );
      }
      if (  stopBoolean==true ) {
        stopBoolean=false;
      }
      println ( "The One", songList[currentSong].isPlaying(), pauseBoolean, stopBoolean, changeState );
    }
  }
} //End MOUSEPRESSED
//
//End YOUR MAIN PROGRAMMMMM!>>>>>>
