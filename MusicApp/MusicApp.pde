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
int numberOfSong = 3, numberOfSoundEffects  ; //Number of FILES in folder, OS to count
int currentSong = 0 ;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs]; //song is now similar to song1
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs]; //same as above
AudioPlayer[] soundEffects = new AudioPlayer[numberOfSoundEffects]; //song is now similar to song1PFont generalFont;
PFont generalFont ; 
color blue = #379BDB ;
PFont buttonFont ;
//

int appWidth, appHeight ;
float backgroundImage1, backgroundImage2, backgroundImageWidth, backgroundImageHeight ;
float button1X, button1Y, buttonSide ;
float smallerDimension ;
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
  minim = new Minim(this) ; //load from data directory, loadFile should also load from
  
  //BUTTON SETUP
 
   
  //END  BUTTON
  
  String pathway = "../FreeWare/MusicDownload/" ;
  String Yoasobi = "YOASOBI2.mp3" ;
  String extension = ".mp3" ;
 // println ( path ) ;
  song[0] = minim.loadFile( pathway + Yoasobi );
  
  songMetaData[0] = song[0].getMetaData ( ) ;
  generalFont = createFont( "Agbalumo Regular", 55 ) ; 
  //
  //song1.loop(0) ;
  //Meta Data Println Testing <
  //FOR Prototyping, Println all information to the console FIRST!!!
  //Verifying Meta Data, 18 Println's
 
 
  //Population
  backgroundImage1 = appWidth*0 ;
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
  buttonFont = createFont ( "Cambria", 70 ) ;
  //
  //DIVs
  /*rect ( backgroundImage1, backgroundImage2, backgroundImageWidth, backgroundImageHeight ) ;
  titleFont = createFont ( "Agbalumo Regular", 55 ) ;
  footerFont = createFont ( "LiSu", 55 ) ;
  String [] fontList = PFont.list () ;
  printArray ( fontList ) ;
  */
buttonSide = smallerDimension/2-sqrt ( sq ( smallerDimension/2 ) /2 ) ;
button1X = backgroundImage1 ;
button1Y = backgroundImage2 ;
rect( button1X, button1Y, buttonSide, buttonSide );
println ( backgroundImage1, smallerDimension, smallerDimension/2, sq( smallerDimension/2 ), sq( smallerDimension/2 ) /2, sqrt( sq( smallerDimension/2 ) /2 ), smallerDimension/2-sqrt(sq(smallerDimension/2)/2) );
} //End setup


//
void draw() {
  //IMAGES
  background (255) ;
  image ( pictureImage, backgroundImage1, backgroundImage2, backgroundImageWidth, backgroundImageHeight ) ;
  //
  //TEXT
  /*fill ( white ) ; //INKK
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
  */
  
  
  //  songMetaData1.title() 
  rect (  width*1/4, height*0, width*1/2, height*1/10 ) ;
  fill( blue ) ; //INK
  textAlign ( CENTER, CENTER ) ;
  int size = 60 ;
  textFont ( generalFont, size) ;
  text (  songMetaData[0].title(), width*1/4, height*0, width*1/2, height*1/10 ) ;
  fill ( 255 ) ;
  
  //BUTTON SETUP DRAW
  
  
  //NOTE : logical operators could be nested IFs
  //NOTE : Looping Function
  if ( playList[currentSong]() && song[0].loopCount () !=-1 ) println ("there are", song[0].loopCount (), "loops left." ) ; 
  if ( playList[currentSong] () && song[0].loopCount () ==-1 ) println ("Looping infinitely" ) ; 
  if ( playList[currentSong] () && song[0].isLooping ()      ) println ("Play Once") ;
  println ( "Song Position", song[0].position(), "Song Lenght", song[0].length () );
  
  //
  //Debugging Fast forward
} //End draw
//
void keyPressed() {
  
  if (key == 'T' || key == 't') song[0].play () ;
  //
  if (key >= '1' || key <= '9') { //FOR loop button, previous : ( key =='1' || key=='9' )
  //= 9 equal to massive or Infinite
     String keystring = String.valueOf(key) ;
     println (keystring) ;
     int loopNum = int (keystring) ; //JAVA, strongly formatted need caasting 
     song[0].loop(loopNum) ; //Parameter is number of Repeat for music
     //
     //
     
  }
  if ( key == 'P' || key == 'p' ) song[0].loop () ;
  //
  //
  if ( key=='M' || key=='m' ) { //Muted Button
    
  if ( song[0].isMuted () ) {
    song[0].unmute ( ) ;
    
  } else {
    //If the song is not playing, it should be rewound to the beginning
    //Possible ERROR : MUTED BUT NOTHING CHANGED
    song[0].mute () ;
     }
  } //End Muted button 
  //
  //Built-in question .isPlaying ();
  //POSSIBLE ERROR : FF Rewinds to parameter milliseconds from song started 
  //HOW DOES THIS GET TO BE A TRUE FF AND FR BUTTON
  if ( key == 'F' || key == 'f' ) song[0].skip (1000) ; // skip forward 1 sec = 1000 milliseconds
  if ( key == 'R' || key == 'r' ) song[0].skip (-1000) ; //skip backward  1 sec = 1000 milliseconds
  
  //Stop or Pause BUTTON
  
  if ( key == 'S' || key == 's' ) {
    if (song[0].isPlaying () ) {
    song[0].pause () ; //AUTO, REWINDED ().
  } else {
    song[0].rewind () ; //Not Playing means song is paused or song position
    }
  } //End Stop BUTTON
  
  //Play Pause, see Caution of ReadMe.text
  if ( key =='Y' || key =='y' ) { //Pause for y = Pause Button
      if ( song[0].isPlaying () ) {
        song[0].pause () ;
      } else {
        song[0].play () ; //PARAMETER IS MILLI-SECONDS FROM START OF AUDIO // file to start of playing (i.e. 14000 will start 14 seconds into the song)
    }
  } //End Play Pause
  
} //End keyPressed

//
void mousePressed() {
  //BUTTON MOUSEPRESSED
   if (mouseX>button1X && mouseX<button1X+buttonSide && mouseY>button1Y && mouseY<button1Y+buttonSide) Playlist=true; 
  








} //End mousePressed
//
//End MAIN Program
