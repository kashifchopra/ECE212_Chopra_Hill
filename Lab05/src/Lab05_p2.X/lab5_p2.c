/* 
 * File:   lab5_p1.c
 * Author: choprak
 *
 * Created on December 7, 2023, 1:36 PM
 */

#include "ece212.h"
int main() {
 ece212_lafbot_setup();
 

 
 while(1){
     
     LFORWARD = 0x7fff;
     RFORWARD = 0x7fff;
     RBACK = 0;
     LBACK = 0;
     delayms(500);
     
     LFORWARD = 0;
     RFORWARD = 0;
     RBACK = 0;
     LBACK = 0;
     delayms(1000);
    
     LFORWARD = 0;
     RFORWARD = 0;
     RBACK = 0x7fff;
     LBACK = 0x7fff;
     delayms(500);
     
     LFORWARD = 0;
     RFORWARD = 0;
     RBACK = 0;
     LBACK = 0;
     delayms(1000);
 }
 return (EXIT_SUCCESS);
}