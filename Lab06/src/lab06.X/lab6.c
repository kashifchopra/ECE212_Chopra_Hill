/* 
 * File:   lab6.c
 * Author: choprak
 *
 * Created on December 14, 2023, 7:39 PM
 */

#include "ece212.h"

int main() {
 // add needed variables here
 // set initial speed and direction (straight)
    
    ece212_lafbot_setup();
    
    int l = 0;
    int r = 0;
    
    delayms(20); 
            
    //set initial speed and direction: 
            
 
 while(1){
 // sample input sensors and determine if on track
 // if not, alter wheel speeds to try to correct
 // delay for some amount of time before repeating

     l = (analogRead(LEFT_SENSOR) > 350);
     r = (analogRead(RIGHT_SENSOR) > 350);
     
     
   
      //case: left sensor over black -> reduce left speed compared to right till left becomes over white 
     if(l){         
            RBACK = 0;
            LBACK = 0;
            RFORWARD = 0xffff;
            LFORWARD = 0x1fff;
     } else if(r){   //case: right sensor over black -> reduce right speed compared to left till left becomes over white 
            RBACK = 0;
            LBACK = 0;
            RFORWARD = 0x1fff;
            LFORWARD = 0xffff;
     } else if(l&&r){ //case: if both l and r are sensing white: (0.8V ish) - keep going straight 
            
            RFORWARD = 0x1fff;
            LFORWARD = 0x1fff;
            RBACK = 0;
            LBACK = 0;
     }else{                          
           
            RFORWARD = 0xffff;
            LFORWARD = 0xffff;
            RBACK = 0;
            LBACK = 0;
     }
     delayms(2);
 }
 return (EXIT_SUCCESS);
}