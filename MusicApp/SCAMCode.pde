float imageScamP1, imageScamQ1, imageWidthX1, imageHeightY1  ;
void bruh () {
  //Animation Images 
  imageScamP1 = X1Width*2/6 ;
  imageScamQ1 = X1Height*2/6 ;
  imageWidthX1 = X1Width*1/2 ;
  imageHeightY1 = X1Height*1/2 ;
  
  //TINT ( Value??> )
  tint ( 100 ) ;
  // If Statement
  if (songList[1].isPlaying () ) {
    image ( Image,  BackgroundX2,  BackgroundY2,  BackgroundWidth,  BackgroundHeight ) ;
  noTint () ;
  image ( Image, imageScamP1, imageScamQ1, imageWidthX1, imageHeightY1 ) ;
  } else if ( songList[0].isPlaying () ) {
    image ( JKT48Img,  BackgroundX2,  BackgroundY2,  BackgroundWidth,  BackgroundHeight ) ;
  noTint ( ) ;
  image ( JKT48Img, imageScamP1, imageScamQ1, imageWidthX1, imageHeightY1 ) ;
  } else if ( songList[2].isPlaying () ) {
    image ( YoasobiImg,  BackgroundX2,  BackgroundY2,  BackgroundWidth,  BackgroundHeight ) ;
   noTint ( ) ;
   image ( YoasobiImg, imageScamP1, imageScamQ1, imageWidthX1, imageHeightY1 ) ;
  } else if ( songList[3].isPlaying () ) {
    image ( YSBTrialImg,  BackgroundX2,  BackgroundY2,  BackgroundWidth,  BackgroundHeight ) ;
   noTint ()  ;
   image ( YSBTrialImg, imageScamP1, imageScamQ1, imageWidthX1, imageHeightY1 ) ;
 }
} //END SCAMCode for ur Page LOL
