//Library: use Sketch / Import Library / Minim

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//
//Global Variables
File musicFolder, soundEffectFolder ;
Minim minim ; //creates object to acces all functions
int numberOfSongs = 3, numberOfSoundEffects = 0, currentSong = 0 ; //Number of FILES in folder, OS to count
AudioPlayer[] playList = new AudioPlayer[numberOfSongs]; //song is now similar to song1
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs]; //same as above
AudioPlayer[] soundEffects = new AudioPlayer[numberOfSoundEffects]; //song is now similar to song1PFont generalFont;
color blue = #379BDB ;
PFont generalFont ; 
PFont buttonFont ;
//Color hoverOverColour=resetColour ;
Boolean stopBoolean=false, pauseBoolean=false, changeState=false ;

//

int appWidth, appHeight ;
float backgroundImage1, backgroundImage2, backgroundImageWidth, backgroundImageHeight ;
float button1X, button1Y, buttonSide, smallerDimension ;
PImage pictureImage ;
String title = "World Tour", footer = "Encore" ;

//Button 

//
void setup() {
  fullScreen () ;
  appWidth = width ;
  appHeight = height ;
  //Ternary Operator
  smallerDimension = (appWidth >= appHeight) ? appHeight : appWidth;
  println( "Smaller Dimension is", smallerDimension);
  
  //Display Algorithm
  
  minim = new Minim(this) ; //load from data directory, loadFile should also load from
  
  //BUTTON SETUP
  
  //END  BUTTON
  
  //Music File Load
  String relativeMusicPathway = "FreeWare/MusicDownload/" ;
  String absoluteMusicPath = sketchPath( relativeMusicPathway ); //Absolute Path
  musicFolder = new File(absoluteMusicPath);
  int musicFileCount = musicFolder.list().length;
  File[] musicFiles = musicFolder.listFiles(); //String of Full Directies
  String[] songFilePathway = new String[musicFileCount];
  for ( int i = 0; i < musicFiles.length; i++ ) {
  songFilePathway[i] = ( musicFiles[i].toString() );
  
  }
  //RE-EXECUTE PLAYLIST POPULATION
  
  numberOfSongs = musicFileCount; //Placeholder Only, reexecute lines after fileCount Known
  playList = new AudioPlayer[numberOfSongs]; //song is now similar to song1
  printArray(playList);
  playListMetaData = new AudioMetaData[numberOfSongs]; //same as above
  for ( int i=0; i<musicFileCount; i++ ) {
    printArray(playList) ;
    playList[i]= minim.loadFile( songFilePathway[i] ) ;
    playListMetaData[i] = playList[i].getMetaData( ) ;
    
  } //End Music Load
  //
  
  //MUSIC LOADS
  String relativeSoundPathway = "FreeWare Music/SoundEffect/" ; //Relative Path
  String absoluteSoundPath = sketchPath( relativeSoundPathway ) ; //Absolute Path
  soundEffectFolder = new File(absoluteSoundPath) ;
  int soundEffectFileCount = soundEffectFolder.list().length;
  File [ ] soundEffectFiles = soundEffectFolder.listFiles() ; //String of Full Directies
  String [ ] soundEffectFilePathway = new String[soundEffectFileCount] ;
  for ( int i = 0; i < soundEffectFiles.length; i++ ) {
  soundEffectFilePathway[i] = ( soundEffectFiles[i].toString( ) ) ;
    
  } 
  
  //Re-execute Playlist Population, similar to DIV Population
  numberOfSoundEffects = soundEffectFileCount ; //Placeholder Only, reexecute lines after fileCount Known
  soundEffects = new AudioPlayer[ numberOfSoundEffects ] ; //song is now similar to song1
  for ( int i=0; i<soundEffectFileCount; i++ ) {
  soundEffects[i]= minim.loadFile( soundEffectFilePathway [ i ] ) ;
    
  } //End Music Load
  
  generalFont = createFont ("Agbalumo Regular", 60) ; //Must also Tools / Create Font / Find Font / Do Not Press "OK"
  //
  //Random Start with any song in playList
  //Example of Population, random style
  currentSong = int ( random(0, numberOfSongs-1) ) ; //casting truncates the decimal
  //println("Random Start", currentSong);
  //
  playList[currentSong].play ( ) ;
  

  
  // println ( path ) ;
  //
  //song1.loop(0) ;
  //Meta Data Println Testing <
  //FOR Prototyping, Println all information to the console FIRST!!!
  //Verifying Meta Data, 18 Println's
 
  //Population

  
  //Divs
  
  rect( backgroundImage1, backgroundImage2, backgroundImageWidth, backgroundImageHeight ) ;
  buttonSide = smallerDimension/2-sqrt ( sq ( smallerDimension/2 ) /2 ) ;
  button1X = backgroundImage1 ;
  button1Y = backgroundImage2 ;
  rect( button1X, button1Y, buttonSide, buttonSide );
  println ( backgroundImage1, smallerDimension, smallerDimension/2, sq( smallerDimension/2 ), sq( smallerDimension/2 ) /2, sqrt( sq( smallerDimension/2 ) /2 ), smallerDimension/2-sqrt(sq(smallerDimension/2)/2) );
  buttonFont = createFont ( "Cambria", 70 ) ;
  
  // This is Images DUDE
  
  backgroundImage1 = appWidth*0;
  backgroundImage2 = appHeight*0 ;
  backgroundImageWidth = appWidth-1 ;
  backgroundImageHeight = appHeight-1;
  String imagesPath = "../Images/ImagesUsed/" ;
  String YoasobiImage = "Yoasobi3.jpg" ;
  pictureImage = loadImage ( imagesPath + YoasobiImage ) ;
  
  //
  /*
  
  xTitle = appWidth*1/4 ;
  yTitle = appHeight*1/10 ;
  widthTitle = appWidth*1/2 ;
  heightTitle = appHeight*2/10 ;
  xFooter = xTitle ;
  yFooter = appHeight*7/10 ;
  widthFooter = widthTitle ;
  heightFooter = heightTitle ;
  */
  //
  //DIVs
  /*rect ( backgroundImage1, backgroundImage2, backgroundImageWidth, backgroundImageHeight ) ;
  titleFont = createFont ( "Agbalumo Regular", 55 ) ;
  footerFont = createFont ( "LiSu", 55 ) ;
  String [] fontList = PFont.list () ;
  printArray ( fontList ) ;
  */

 
} //End setup


//
void draw() {
  //IMAGES
  
  background (255) ;
  image ( pictureImage, backgroundImage1, backgroundImage2, backgroundImageWidth, backgroundImageHeight ) ;
  //
  //TEXT
   rect (  width*1/4, height*0, width*1/2, height*1/10 ) ;
  fill( blue ) ; //INK
  textAlign ( CENTER, CENTER ) ;
  int size = 60 ;
  textFont ( generalFont, size) ;
  text ( width*1/4, height*0, width*1/2, height*1/10 ) ; //Mistake 
  fill ( 255 ) ;
  //END TEXT
  //
  
  //BUTTON SETUP DRAW
  
  //NOTE : logical operators could be nested IFs
  //NOTE : Looping Function
  /*if ( playList[currentSong]() && song[0].loopCount () !=-1 ) println ("there are", song[0].loopCount (), "loops left." ) ; 
  if ( playList[currentSong] () && song[0].loopCount () ==-1 ) println ("Looping infinitely" ) ; 
  if ( playList[currentSong] () && song[0].isLooping ()      ) println ("Play Once") ;
  println ( "Song Position", song[0].position(), "Song Lenght", song[0].length () );
  */
  //
  
  //AutoPlay, next songs
  
   if ( playList[currentSong].isPlaying() ) {
    //println("hereD1", playList[currentSong].isPlaying(), stopBoolean, pauseBoolean, changeState);
    if ( stopBoolean==true || pauseBoolean==true ) {
      //changeState=true;
      playList[currentSong].pause();
      //println("hereD2", playList[currentSong].isPlaying(), stopBoolean, pauseBoolean, changeState);
    }
    if ( stopBoolean==true ) playList[currentSong].rewind();
  } else {
    //println("hereD3", playList[currentSong].isPlaying(), stopBoolean, pauseBoolean, changeState);
    if ( changeState==false ) {
      playList[currentSong].rewind();
      if (currentSong==numberOfSongs-1) {
        currentSong=0;
      } else {
        currentSong = currentSong + 1; //currentSong--; currentSong-=1}
      }
      playList[currentSong].play();
      //println("hereD4", playList[currentSong].isPlaying(), stopBoolean, pauseBoolean, changeState);
    }
    if ( stopBoolean==false && pauseBoolean==false && changeState==true ) {
      playList[currentSong].rewind();
      playList[currentSong].play();
      changeState=false;
      //println("hereD5", playList[currentSong].isPlaying(), stopBoolean, pauseBoolean, changeState);
    }
    if ( pauseBoolean==false && stopBoolean==false  && changeState==true) {
      playList[currentSong].play();
      changeState=false;
    }
  }//Debugging Fast forward
} //End draw
//
void keyPressed() {
  
  if ( soundEffects[2].position()!=0 ) soundEffects[2].rewind();
  soundEffects[2].play();
  println ( "herek1", playList[currentSong].isPlaying(), pauseBoolean );
  //
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
    println ( "JKT48NewEra", playList[currentSong].isPlaying(), pauseBoolean, stopBoolean, changeState );
  }
  //
  //Simple STOP Behaviour: ask if .playing() & .pause() & .rewind(), or .rewind()
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
  //Simple NEXT and PREVIOUS
  if ( key==CODED && keyCode==LEFT ) { //Previous
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause();
      playList[currentSong].rewind();
      if (currentSong==0) {
        currentSong=numberOfSongs-1;
      } else {
        currentSong = currentSong - 1; //currentSong--; currentSong-=1}
      }
    }
    println(currentSong);
    playList[currentSong].play();
  } //End Previous
  if ( key==CODED && keyCode==RIGHT ) { //NEXT
 
  } //End NEXT
  
  //Ignore LOL its Broken just Act Is not there
  //
  /* Broken KeyBinds for sure
   //
   if ( key>='1' || key<='9' ) { //Loop Button, previous (key=='1' || key=='9')
   //Note: "9" is assumed to be massive! "Simulate Infinite"
   String keystr = String.valueOf(key);
   //println(keystr);
   int loopNum = int(keystr); //Java, strongly formatted need casting
   song[0].loop(loopNum); //Parameter is number of repeats
   //
   }
   if ( key=='L' || key=='l' ) song[0].loop(); //Infinite Loop, no parameter OR -1
   //
   if ( key=='M' || key=='m' ) { //MUTE Button
   //MUTE Behaviour: stops electricty to speakers, does not stop file
   //NOTE: MUTE has NO built-in PUASE button, NO built-in rewind button
   //ERROR: if song near end of file, user will not know song is at the end
   //Known ERROR: once song plays, MUTE acts like it doesn't work
   if ( song[0].isMuted() ) {
   //ERROR: song might not be playing
   //CATCH: ask .isPlaying() or !.isPlaying()
   song[0].unmute();
   } else {
   //Possible ERROR: Might rewind the song
   song[0].mute();
   }
   } //End MUTE
   //
  */
  
} //End keyPressed

//
void mousePressed() {
  //BUTTON MOUSEPRESSED
   if (mouseX>button1X && mouseX<button1X+buttonSide && mouseY>button1Y && mouseY<button1Y+buttonSide) stopBoolean=true; 
  



 




} //End mousePressed
//
//End MAIN Program
