color Purple = #9829E3 ;
PImage PauseButton, FForward, Previous ;
//
void PPButton () {
  bruh () ;
  //
  //
  //
  if ( mouseX > (ABX-AYHeight/2 ) && mouseX < (ABX-AYHeight/2 ) +  BackgroundWidthXW && mouseY > ( GCY- AYHeight/2) && mouseY < + ( GCY- AYHeight/2) + BackgroundHeightXW ) {
    //INK >> TEXT / A HoverOver #Work also for Button Codes
    fill ( OceanBlue ) ;
    noStroke () ;
    ellipse ( BackgroundX3, BackgroundY3, BackgroundWidthXW, BackgroundHeightXW ) ;
  } else {
    noFill () ;
    noStroke () ;
    ellipse ( BackgroundX3, BackgroundY3, BackgroundWidthXW, BackgroundHeightXW ) ;
  }
  //
  //
  if ( mouseX > ( BBX-GFWidth/2 ) && mouseX < ( BBX-GFWidth/2 ) + GFWidth && mouseY > ( FCY-GFHeight/2 ) && mouseY < ( FCY-GFHeight/2 ) + GFHeight ) {
    fill ( Purple ) ; //INK
    noStroke () ;
    ellipse ( BBX, BackgroundY3, BackgroundWidthXW, BackgroundHeightXW ) ;
  } else {
    //RESET
    noFill () ;
    noStroke () ;
    ellipse ( BBX, BackgroundY3, BackgroundWidthXW, BackgroundHeightXW ) ;
  }
  //
  //
  FForward = loadImage  ( "../ButtonFunctions/FastForward.jpeg" ) ;
  Previous = loadImage ( "../ButtonFunctions/PreviousB2.png" ) ;
  PauseButton = loadImage ( "../ButtonFunctions/PauseButton.png" ) ;
  image ( FForward, BBX-( GFWidth/2 ), FCY-( GFHeight/2), GFWidth, GFHeight ) ;
  image ( Previous, ABX-( AYWidth/2 ), GCY-( AYHeight/2 ), AYWidth, AYHeight ) ;
  image ( PauseButton, BackgroundX3-( BackgroundWidthXW/2 ), BackgroundY3-( BackgroundHeightXW/2 ), BackgroundWidth, BackgroundHeight ) ;
} //END PPFBUTTON
