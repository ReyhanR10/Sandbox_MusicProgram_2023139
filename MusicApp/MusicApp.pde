//Library: use Sketch / Import Library / Minim

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//
//Global Variables

Minim minim ; //creates object to acces all functions
AudioPlayer song1 ; //creates "Play Lists" variable holding extensions ; WAV, AIFF, AU, MP3

//
//PFont titleFont ;
//color white = #FFFFFF ;
//color purple = #CA32D6 ;
int appWidth, appHeight ;
float backgroundImage1, backgroundImage2, backgroundImageWidth, backgroundImageHeight ;
PImage pictureImage ;
String title = "World Tour", footer = "Encore" ;
PFont titleFont, footerFont ;
color white=#FFFFFF, resetDefaultInk=#FFFFFF, purple=#CA32D6 ;
int sizeFont, size ;
float xTitle, yTitle, widthTitle, heightTitle ;
float xFooter, yFooter, widthFooter, heightFooter ;

//Button 


//
void setup() {
  size ( 800, 600 ) ;
  appWidth = width ;
  appHeight = height ;
  minim = new Minim(this) ; //load from data directory, loadFile should also load from
  
  //BUTTON SETUP
 
  
  //END  BUTTON
  
  String pathway = "../FreeWare/MusicDownload/" ;
  String Yoasobi = "YOASOBI2.mp3" ;
  String extension = ".mp3" ;
  song1 = minim.loadFile( pathway + Yoasobi );
  //ttsong1.loop(0) ;
  //
  //Population
  backgroundImage1 = appWidth*0 ;
  backgroundImage2 = appHeight*0 ;
  backgroundImageWidth = appWidth-1 ;
  backgroundImageHeight = appHeight-1;
  String imagesPath = "../Images/ImagesUsed/" ;
  String YoasobiImage = "Yoasobi3.jpg" ;
  pictureImage = loadImage ( imagesPath + YoasobiImage ) ;
  //
  //Text
  xTitle = appWidth*1/4 ;
  yTitle = appHeight*1/10 ;
  widthTitle = appWidth*1/2 ;
  heightTitle = appHeight*2/10 ;
  xFooter = xTitle ;
  yFooter = appHeight*7/10 ;
  widthFooter = widthTitle ;
  heightFooter = heightTitle ;
  //
  //DIVs
  rect ( backgroundImage1, backgroundImage2, backgroundImageWidth, backgroundImageHeight ) ;
  titleFont = createFont ( "Agbalumo Regular", 55 ) ;
  footerFont = createFont ( "LiSu", 55 ) ;
  String [] fontList = PFont.list () ;
  printArray ( fontList ) ;

} //End setup


//
void draw() {
  //IMAGES
  background (255) ;
  image ( pictureImage, backgroundImage1, backgroundImage2, backgroundImageWidth, backgroundImageHeight ) ;
  //
  //TEXT
  fill ( white ) ; //INKK
  textAlign ( CENTER, TOP ) ; 
  size = 60 ;
  textFont (titleFont, size ) ;
  text (  title, xTitle, yTitle, widthTitle, heightTitle ) ;
  fill ( purple ) ; //INKK
  textAlign ( CENTER, BOTTOM ) ;
  size = 120 ;
  textFont ( footerFont, size ) ;
  text ( footer, xFooter, yFooter, widthFooter, heightFooter ) ;
  fill ( resetDefaultInk ) ;
  //END TEXT
  //
  //BUTTON SETUP DRAW
  
  
  //NOTE : logical operators could be nested IFs
  //NOTE : Looping Function
  if ( song1.isLooping () && song1.loopCount () !=-1 ) println ("there are", song1.loopCount (), "loops left." ) ; 
  if ( song1.isLooping () && song1.loopCount () ==-1 ) println ("Looping infinitely" ) ; 
  if ( song1.isPlaying () && song1.isLooping ()      ) println ("Play Once") ;
  println ( "Song Position", song1.position(), "Song Lenght", song1.length () );
  
  //
  //Debugging Fast forward
} //End draw
//
void keyPressed() {
  
  if (key == 'T' || key == 't') song1.play () ;
  //
  if (key >= '1' || key <= '9') { //FOR loop button, previous : ( key =='1' || key=='9' )
  //= 9 equal to massive or Infinite
     String keystring = String.valueOf(key) ;
     println (keystring) ;
     int loopNum = int (keystring) ; //JAVA, strongly formatted need caasting 
     song1.loop(loopNum) ; //Parameter is number of Repeat for music
     //
     //
     
  }
  if ( key == 'P' || key == 'p' ) song1.loop () ;
  //
  //
  if ( key=='M' || key=='m' ) { //Muted Button
    
  if ( song1.isMuted () ) {
    song1.unmute ( ) ;
    
  } else {
    //If the song is not playing, it should be rewound to the beginning
    //Possible ERROR : MUTED BUT NOTHING CHANGED
    song1.mute () ;
     }
  } //End Muted button 
  //
  //Built-in question .isPlaying ();
  //POSSIBLE ERROR : FF Rewinds to parameter milliseconds from song started 
  //HOW DOES THIS GET TO BE A TRUE FF AND FR BUTTON
  if ( key == 'F' || key == 'f' ) song1.skip (1000) ; // skip forward 1 sec = 1000 milliseconds
  if ( key == 'R' || key == 'r' ) song1.skip (-1000) ; //skip backward  1 sec = 1000 milliseconds
  
  //Stop or Pause BUTTON
  
  if ( key == 'S' || key == 's' ) {
    if (song1.isPlaying () ) {
    song1.pause () ; //AUTO, REWINDED ().
  } else {
    song1.rewind () ; //Not Playing means song is paused or song position
    }
  } //End Stop BUTTON
  
  //Play Pause, see Caution of ReadMe.text
  if ( key =='Y' || key =='y' ) { //Pause for y = Pause Button
      if ( song1.isPlaying () ) {
        song1.pause () ;
      } else {
        song1.play () ; //PARAMETER IS MILLI-SECONDS FROM START OF AUDIO // file to start of playing (i.e. 14000 will start 14 seconds into the song)
    }
  } //End Play Pause
  
} //End keyPressed

//
void mousePressed() {
  //BUTTON MOUSEPRESSED
  








} //End mousePressed
//
//End MAIN Program
