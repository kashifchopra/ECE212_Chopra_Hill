/* 
 * File:   lab5_p1.c
 * Author: choprak
 *
 * Created on December 7, 2023, 1:36 PM
 */

#include "ece212.h"
int main() {
 ece212_setup();
 
 int flip = 1; 
 
 while(1){
     
     if(BTN11){
         
         if(flip ==0){
             flip = 1;
         } else{
             flip = 0;
         }
     }  

     
     if(flip == 1){
           delayms(300);
     writeLEDs(0b1000);
     delayms(300);
     writeLEDs(0b0100);
     delayms(300);
     writeLEDs(0b0010);
     delayms(300);
     writeLEDs(0b0001);
    
     } else {
     delayms(300);
     writeLEDs(0b0001);
     delayms(300);
     writeLEDs(0b0010);
     delayms(300);
     writeLEDs(0b0100);
     delayms(300);
     writeLEDs(0b1000);
     }
      
 
     
     
 }
 return (EXIT_SUCCESS);
}