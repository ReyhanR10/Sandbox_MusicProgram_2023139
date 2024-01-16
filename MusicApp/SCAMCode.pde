Float imageScamX1, imageScamY1, imageWidthX1, imageHeightY1  ;
void Scam () {
  imageScamX1 = X1Width*2/7 ;
  imageScamY1 = X1Height*2/7 ;
  imageWidthX1 =X1Width*2/4 ;
  imageHeightY1 = X1Height*2/4 ;
  //TINT ( Value??> )
  tint ( 100 ) ;
  // If Statement
  if (songList[0].isPlaying () ) {
    image ( Image,  BackgroundX2,  BackgroundY2,  BackgroundWidth,  BackgroundHeight ) ;
  noTint () ;
  image ( Image, imageScamX1, imageScamY1, imageWidthX1, imageHeightY1 ) ;
  } else if ( songList[1].isPlaying () ) {
    image ( JKT48Img,  BackgroundX2,  BackgroundY2,  BackgroundWidth,  BackgroundHeight ) ;
  noTint ( ) ;
  image ( JKT48Img, imageScamX1, imageScamY1, imageWidthX1, imageHeightY1 ) ;
  } else if ( songList[2].isPlaying () ) {
    image ( YoasobiImg,  BackgroundX2,  BackgroundY2,  BackgroundWidth,  BackgroundHeight ) ;
   noTint ( ) ;
   image ( YoasobiImg, imageScamX1, imageScamY1, imageWidthX1, imageHeightY1 ) ;
  } else if ( songList[3].isPlaying () ) {
    image ( YSBTrialImg,  BackgroundX2,  BackgroundY2,  BackgroundWidth,  BackgroundHeight ) ;
   noTint ()  ;
   image ( YSBTrialImg, imageScamX1, imageScamY1, imageWidthX1, imageHeightY1 ) ;
 }
 
} //END SCAMCode
