/**
 * @(#)Proj.pde
 * @subject CS171 Project
 * @author Dylon Di Ruscio
 * @version 1.00 2016/12/8
 
 Semester one first year project in processing to create any game of my liking. No real knowledge of programming, algorithms
 or data structures at the time of developing this.
 */
import ddf.minim.*;
Minim minim;
AudioPlayer player;
//variables declared for images used for background of each menu.
PImage startscreen, secondscreen, speed, memory, problem, speed1, speed2, game1, game2, bg, game, memory1, problem1;
//variable declared to hold the value of which each screen/menu is stored.
int stage, start, finish, time, screen, correct, score, highscore1=-1, m=0, last=0, time1, stage1, correct1 = 0, wrong = 0;
int x = int (random(2000, 10000));
String s;
String  vg = "Very Good!", g = "Good!", nb = "Not Bad!", b = "You Need More Practice!";
float z  = 0;
int done = 0, timezero = 0, flag = 0;
float highscore=100.00;
PFont font;
String [] array = new String[4];

void setup()
{
  stage = 1;
  screen = 1;
  stage1 = 1;

  size(1728, 972);

  minim = new Minim(this);

  //Assignment of each image to a variable 
  startscreen = loadImage("Images/MainMenu.jpg");
  secondscreen = loadImage("Images/SecondMenu.jpg");
  speed = loadImage("Images/speed.jpg");
  memory = loadImage("Images/memory.jpg");
  problem = loadImage("Images/problemsolving.jpg");
  speed1 = loadImage("Images/speedlevel1.jpg");
  speed2 = loadImage("Images/speed2.jpg");
  game1 = loadImage("Images/game1.jpg");
  game2 = loadImage("Images/game2.jpg");
  bg = loadImage("Images/game2.jpg");
  game = loadImage("Images/game1.jpg");
  memory1 = loadImage("Images/memory1.jpg");
  problem1 = loadImage("Images/problem1.jpg");
  font = loadFont("ArialRoundedMTBold-48.vlw");
  player = minim.loadFile("sound.mp3");

  array[0]= "What colour was the word 'RED'?";
  array[1]= "What colour was the word 'GREY'?";
  array[2]= "What colour was the word 'BLACK'?";
  array[3]= "What colour was the word 'PURPLE'?";
}
void draw() {

  player.play();
  //The following lines of code pairs each stage(screen/menu) with a corresponding image uploaded from above.
  if (stage==1) {
    image(startscreen, 0, 0, 1728, 972);
  }
  if (stage==2) {
    image(secondscreen, 0, 0, 1728, 972);
  }
  //if on speed menu
  if (stage==3) {
    image(speed, 0, 0, 1728, 972);
  }
  //if on memory menu
  if (stage==4) {
    image(memory, 0, 0, 1728, 972);
  }
  //if on problem solving menu 
  if (stage==5) {
    image(problem, 0, 0, 1728, 972);
  }
  //if on start of speed game one load bg image and reset variables to 0
  if (stage==6) {
    image(speed1, 0, 0, 1728, 972);
    flag = 0;
    done = 0;
    timezero = 0;
  }
  //if speed game 1 starts 
  if (stage==7){

    if (flag==0){
      timezero=millis();
      flag=1;
    }  // do on first visit

    image(game1, 0, 0, 1728, 972);

    //while the randomly generated time x has not been reached since starting this game => keep the box black
    if ((millis()-timezero)<x)
    { 
      fill(0, 0, 0);
      rect(700, 350, 250, 250);
      //variable to record time of game start 
      start = millis();
      
      // too early cheating....
      if (keyPressed==true) {
        textFont(font, 65);
        fill(255, 0, 0);
        text("You cheated, don't press key until box changes colour!", 530, 240);
      }
    }

    //lay(x); 
    //once the randomly generated time x has been reached change the box to colour red 
    else
    {
      fill(255, 0, 0);
      rect(700, 350, 250, 250);

      // valid key press
      if ((keyPressed==true)&&(done==0))
      {
        //variable to record time of game end
        finish=millis();
        //signals game over 
        done=1;
      }

      //if game over
      if (done==1)
      {
        //time in seconds you finished the game (finish time - start time)
        z = ((finish-start)/1000.0);
        s = "You solved it in "
          + (((finish-start)/1000.0)
          + " seconds.");
        textFont(font, 65);
        fill(0, 0, 0);
        textSize(65);
        text(s, 330, 740);
        //if you beat highscore record new highscore
        if (z<highscore) {
          highscore = z;
        }


        textFont(font, 65);
        fill(0, 0, 0);
        text("highscore = " + highscore, 530, 340);
      }


      //if you finished it in under .5 seconds print Very good!
      if ((z!=0) && (z<=0.50)){
        textFont(font, 65);
        fill(0, 0, 0);
        textSize(65);
        text(vg, 650, 870);
              
      }
      //if you finished it in between .5 and 1 second print Good!
      else if ((z>0.50) && (z<=1.00)){
        textFont(font, 65);
        fill(0, 0, 0);
        textSize(65);
        text(g, 725, 870);
      } 
      //if you finished it in between 1 and 1.5 seconds print Not bad!
      else if ((z>1.00) && (z<=1.50)){
        textFont(font, 65);
        fill(0, 0, 0);
        textSize(65);
        text(nb, 705, 870);
      } 
      //if you finished it in more than 1.5 seconds print You need more practice!
      else if (z>1.50) {
        textFont(font, 65);
        fill(0, 0, 0);
        textSize(65);
        text(b, 470, 870);
      } else {
      }
    }
  }

//if click into speed game 2 
  if (stage==8) {
    image(speed2, 0, 0, 1728, 972);
  }
  //speed game 2 empty atm
  if (stage==9) {
    image(game1, 0, 0, 1728, 972);
  }  
  //if memory game 1 load image about info on memory game 1
  if (stage==12) {
    image(memory1, 0, 0, 1728, 972);
  }
  //if start memory game 1 
  if (stage==13) {
    if (correct==0) {
      score = 0;
    } else if (correct==1) {
      score = 25;
    } else if (correct==2) {
      score = 50;
    } else if (correct==3) {
      score = 75;
    } else if (correct==4) {
      score = 100;
    }


//load image with words
    image(bg, 0, 0, 1728, 972);
    if (screen==1)
    {
      textFont(font, 65);
      fill(0, 0, 0);
      //press shift to continue to test
      text("Press Shift Key To Continue.", 800, 920);

      if (keyCode==SHIFT) {
        //last = millis();
        screen = 2;
      }
    }



    if (screen==2) {

      background(255);


     //once answer chosen move to next question 
      if (keyCode=='A'|keyCode=='a') {
        screen = 3;
        correct++;
      } else  if (keyCode=='B'|keyCode=='b') {
        screen = 3;
      } else  if (keyCode=='C'|keyCode=='c') {
        screen = 3;
      } else  if (keyCode=='D'|keyCode=='d') {
        screen = 3;
      } else {
      }


     //Text for "What colour was the word..."
      textFont(font, 65);
      fill(0, 0, 0);
      text(array[0], 230, 300);


//four rectangles containing four possible answers
      fill(255, 255, 0);
      rect(230, 410, 450, 200);
      fill(0, 255, 0);
      rect(230, 640, 450, 200);
      fill(0, 0, 255);
      rect(710, 410, 450, 200);
      fill(255, 0, 0);
      rect(710, 640, 450, 200);

      textFont(font, 65);
      fill(0, 0, 0);
      text('A', 255, 470);
      text('B', 735, 470);
      text('C', 255, 700);
      text('D', 735, 700);
    }


    if (screen==3) {
      background(255);
      textFont(font, 65);
      fill(0, 0, 0);
      text(array[1], 230, 300);

      //once answer chosen move to next question 
      if (keyCode=='E'|keyCode=='e') {
        screen = 4;
      } else  if (keyCode=='F'|keyCode=='f') {
        screen = 4;
      } else  if (keyCode=='G'|keyCode=='g') {
        screen = 4;
        correct++;
      } else  if (keyCode=='H'|keyCode=='h') {
        screen = 4;
      } else {
      }

//four rectangles containing four possible answers
      fill(0, 255, 0);
      rect(230, 410, 450, 200);
      fill(0, 0, 0);
      rect(230, 640, 450, 200);
      fill(255, 0, 0);
      rect(710, 410, 450, 200);
      fill(255, 255, 0);
      rect(710, 640, 450, 200);

      textFont(font, 65);
      fill(0, 0, 0);
      text('E', 255, 470);
      text('F', 735, 470);
      text('H', 735, 700);
      fill(255, 255, 255);
      text('G', 255, 700);
    }

    if (screen==4) {
      background(255);
      textFont(font, 65);
      fill(0, 0, 0);
      text(array[2], 230, 300);

      //once answer chosen move to next question 
      if (keyCode=='I'|keyCode=='i') {
        screen = 5;
      } else  if (keyCode=='J'|keyCode=='j') {
        screen = 5;
        correct++;
      } else  if (keyCode=='K'|keyCode=='k') {
        screen = 5;
      } else  if (keyCode=='L'|keyCode=='l') {
        screen = 5;
      } else if (keyCode==BACKSPACE) {
        screen = 3;
      } else {
      }

//four rectangles containing four possible answers
      fill(255, 165, 0);
      rect(230, 410, 450, 200);
      fill(0, 255, 0);
      rect(230, 640, 450, 200);
      fill(0, 0, 255);
      rect(710, 410, 450, 200);
      fill(255, 0, 0);
      rect(710, 640, 450, 200);

      textFont(font, 65);
      fill(0, 0, 0);
      text('I', 255, 470);
      text('J', 735, 470);
      text('K', 255, 700);
      text('L', 735, 700);
    }
    if (screen==5) {
      background(255);
      textFont(font, 65);
      fill(0, 0, 0);
      text(array[3], 230, 300);

//once answer chosen exam over
      if (keyCode=='M'|keyCode=='m') {
        screen = 6;
      } else  if (keyCode=='N'|keyCode=='n') {
        screen = 6;
      } else  if (keyCode=='O'|keyCode=='o') {
        screen = 6;
      } else  if (keyCode=='P'|keyCode=='p') {
        screen = 6;
        correct++;
      } else {
      }

//four rectangles containing four possible answers
      fill(255, 0, 0);
      rect(230, 410, 450, 200);
      fill(0, 0, 255);
      rect(230, 640, 450, 200);
      fill(0, 0, 0);
      rect(710, 410, 450, 200);
      fill(255, 165, 0);
      rect(710, 640, 450, 200);

      textFont(font, 65);
      fill(0, 0, 0);
      text('M', 255, 470);
      text('O', 255, 700);
      text('P', 735, 700);
      fill(255, 255, 255);
      text('N', 735, 470);
    }
    //once questions answered display score and previous highscore
    if (screen==6) {
      image(game, 0, 0, 1728, 972);
      textFont(font, 65);
      fill(0, 0, 0);
      text("You scored " + score + "% in the memory test.", 230, 300);
      text("Highscore = " + highscore1 + "%", 430, 700);
    }
    
    //Update highscore if needed
    if (score>highscore1) {
      highscore1 = score;
    }
  }
  //problem solving screen
  if (stage==18) {
    image(problem1, 0, 0, 1728, 972);
  }
  //Problem solving game 1 started
  if (stage==19) {
    background(255, 255, 255);

//The following code running the variable stage1 through values 1 to 8 provides the player with 8 different maths questions
//and 4 possible answers and it counts the amount of questions answered correctly and displays the final score at the end 
//and the highscore which will be updated if beaten
    if (stage1==1) {

      textFont(font, 65);
      fill(0, 0, 0);
      text("6 + 27 = ?", 725, 500);
      fill(255, 0, 0);
      text("A = 23               B = 33               C = 32", 270, 750);    

      if (keyCode=='A'|keyCode=='a') {
        stage1 = 2;
        wrong++;
      } else  if (keyCode=='B'|keyCode=='b') {
        stage1 = 2;
        correct1++;
      } else  if (keyCode=='C'|keyCode=='c') {
        stage1 = 2;
        wrong++;
      } else {
      }
    }


    if (stage1==2) {

      textFont(font, 65);
      fill(0, 0, 0);
      text("113 - 57 = ?", 725, 500);
      fill(255, 0, 0);
      text("D = 56               E = 58               F = 65", 270, 750);    

      if (keyCode=='D'|keyCode=='d') {
        stage1 = 3;
        correct1++;
      } else  if (keyCode=='E'|keyCode=='e') {
        stage1 = 3;
        wrong++;
      } else  if (keyCode=='F'|keyCode=='f') {
        stage1 = 3;
        wrong++;
      } else {
      }
    }
    if (stage1==3) {

      textFont(font, 65);
      fill(0, 0, 0);
      text("12 x 11 = ?", 725, 500);
      fill(255, 0, 0);
      text("G = 132               H = 144               I = 124", 270, 750); 

      if (keyCode=='G'|keyCode=='g') {
        stage1 = 4;
        correct1++;
      } else  if (keyCode=='H'|keyCode=='h') {
        stage1 = 4;
        wrong++;
      } else  if (keyCode=='I'|keyCode=='i') {
        stage1 = 4;
        wrong++;
      } else {
      }
    }
    if (stage1==4) {

      textFont(font, 65);
      fill(0, 0, 0);
      text("96 ÷ 8 = ?", 725, 500);
      fill(255, 0, 0);
      text("J = 9               K = 14               L = 12", 270, 750); 

      if (keyCode=='J'|keyCode=='j') {
        stage1 = 5;
        wrong++;
      } else  if (keyCode=='K'|keyCode=='k') {
        stage1 = 5;
        wrong++;
      } else  if (keyCode=='L'|keyCode=='l') {
        stage1 = 5;
        correct1++;
      } else {
      }
    }
    if (stage1==5) {

      textFont(font, 65);
      fill(0, 0, 0);
      text("(8 x 2) + 17 = ?", 725, 500);
      fill(255, 0, 0);
      text("M = 227               N = 272               O = 33", 270, 750); 

      if (keyCode=='M'|keyCode=='m') {
        stage1 = 6;
        wrong++;
      } else  if (keyCode=='N'|keyCode=='n') {
        stage1 = 6;
        wrong++;
      } else  if (keyCode=='O'|keyCode=='o') {
        stage1 = 6;
        correct1++;
      } else {
      }
    }
    if (stage1==6) {

      textFont(font, 65);
      fill(0, 0, 0);
      text("0 ÷ 2 = ?", 725, 500);
      fill(255, 0, 0);
      text("P = 0               Q = 2               R = Undefined", 270, 750); 

      if (keyCode=='P'|keyCode=='p') {
        stage1 = 7;
        correct1++;
      } else  if (keyCode=='Q'|keyCode=='q') {
        stage1 = 7;
        wrong++;
      } else  if (keyCode=='R'|keyCode=='r') {
        stage1 = 7;
        wrong++;
      } else {
      }
    }
    if (stage1==7) {

      textFont(font, 65);
      fill(0, 0, 0);
      text("((2 x 7) + (8 ÷ 2)) ÷ 2  = ?", 625, 500);
      fill(255, 0, 0);
      text("S = 9               T = 16               U = 2", 270, 750); 

      if (keyCode=='S'|keyCode=='s') {
        stage1 = 8;
        correct1++;
      } else  if (keyCode=='T'|keyCode=='t') {
        stage1 = 8;
        wrong++;
      } else  if (keyCode=='U'|keyCode=='u') {
        stage1 = 8;
        wrong++;
      } else {
      }
    }
    if (stage1==8) {

      textFont(font, 65);
      fill(0, 0, 0);
      text("10,674 + 366,639 = ?", 725, 500);
      fill(255, 0, 0);
      text("V = 337,331          W = 377,313          X = 367,331", 170, 750); 

      if (keyCode=='V'|keyCode=='v') {
        stage1 = 9;
        wrong++;
      } else  if (keyCode=='W'|keyCode=='w') {
        stage1 = 9;
        correct1++;
      } else  if (keyCode=='X'|keyCode=='x') {
        stage1 = 9;
        wrong++;
      } else {
      }
    }
    if (stage1==9) {
      textFont(font, 60);
      fill(255, 0, 0);
      text("You got " + correct1 + " questions correct and " + wrong + " questions wrong", 150, 450);
    }
  }
}

//The following code creates spaces(boxes) within each menu/stage which are used as buttons when clicked on by the mouse to go to the next menu/stage.
void mousePressed()
{   

  if (stage==1)
  {
    if (mouseX < 775 && mouseX > 330 & mouseY< 775 && mouseY > 580)
    {
      stage = 2;
    }
  } else if (stage==2)
  {
    if (mouseX < 158 && mouseX > 43 & mouseY < 92 && mouseY > 37)
    {
      stage = 1;
    } else if (mouseX < 560 && mouseX > 102 & mouseY < 723 && mouseY > 353)
    {
      stage = 3;
    } else if (mouseX < 1083 && mouseX > 625 & mouseY < 723 && mouseY > 353)
    {
      stage = 4;
    } else if (mouseX < 1623 && mouseX > 1165 & mouseY < 723 && mouseY > 353)
    {
      stage = 5;
    }
  } else if (stage==3)
  {
    if (mouseX < 158 && mouseX > 43 & mouseY < 92 && mouseY > 37)
    {
      stage = 2;
    } else if (mouseX < 560 && mouseX > 102 & mouseY < 723 && mouseY > 353)
    {
      stage = 6;
    } else if (mouseX < 1083 && mouseX > 625 & mouseY < 723 && mouseY > 353)
    {
      stage = 8;
    } else if (mouseX < 1623 && mouseX > 1165 & mouseY < 723 && mouseY > 353)
    {
      stage = 3;
    }
  } else if (stage==4)
  {
    if (mouseX < 158 && mouseX > 43 & mouseY < 92 && mouseY > 37)
    {
      stage = 2;
    } else if (mouseX < 560 && mouseX > 102 & mouseY < 723 && mouseY > 353)
    {
      stage = 12;
    } else if (mouseX < 1083 && mouseX > 625 & mouseY < 723 && mouseY > 353)
    {
      stage = 4;
    } else if (mouseX < 1623 && mouseX > 1165 & mouseY < 723 && mouseY > 353)
    {
      stage = 4;
    }
  } else if (stage==5)
  {
    if (mouseX < 158 && mouseX > 43 & mouseY< 92 && mouseY > 37)
    {
      stage = 2;
    } else if (mouseX < 560 && mouseX > 102 & mouseY< 723 && mouseY > 353)
    {
      stage = 18;
    } else if (mouseX < 1083 && mouseX > 625 & mouseY< 723 && mouseY > 353)
    {
      stage = 5;
    } else if (mouseX < 1623 && mouseX > 1165 & mouseY < 723 && mouseY > 353)
    {
      stage = 5;
    }
  } else if (stage==6)
  {
    if (mouseX < 158 && mouseX > 43 & mouseY< 92 && mouseY > 37)
    {
      stage = 3;
    }
  } else if (stage==7)
  {
    if (mouseX < 158 && mouseX > 43 & mouseY< 92 && mouseY > 37)
    {
      stage = 6;
    }
  } else if (stage==8)
  {
    if (mouseX < 158 && mouseX > 43 & mouseY< 92 && mouseY > 37)
    {
      stage = 3;
    }
  } else if (stage==9)
  {
    if (mouseX < 158 && mouseX > 43 & mouseY< 92 && mouseY > 37)
    {
      stage = 8;
    }
  } else if (stage==12)
  {
    if (mouseX < 158 && mouseX > 43 & mouseY< 92 && mouseY > 37)
    {
      stage = 4;
    }
  } else
  {
  }
}
//This code allows the use of Backspace and Enter button to go forward and backward within certain menu's.
void keyPressed() {
  if (stage==1) {
    if (keyCode==ENTER) {
      stage = 2;
    }
  }
  if (stage==2) {
    if (keyCode==BACKSPACE) {
      stage = 1;
    }
  }
  if (stage==3|stage==4|stage==5) {
    if (keyCode==BACKSPACE) {
      stage = 2;
    }
  }

  if (stage==6) {
    if (keyCode==BACKSPACE) {
      stage = 3;
    } else if (keyCode==ENTER) {
      stage = 7;
    } else {
    }
  }
  if (stage==7) {
    if (keyCode==BACKSPACE) {
      stage=6;
    }
  }
  if (stage==8) {
    if (keyCode==BACKSPACE) {
      stage=3;
    } else if (keyCode==ENTER) {
      stage = 9;
    }
  }
  if (stage==9) {
    if (keyCode==BACKSPACE) {
      stage=8;
    }
  }
  if (stage==12) {
    if (keyCode==BACKSPACE) {
      stage = 4;
    } else if (keyCode==ENTER) {
      stage = 13;
    } else {
    }
  }
  if (screen==6) {
    if (keyCode==BACKSPACE) {
      stage = 12;
      screen =1;
      score=0;
      correct=0;
    }
  }
  if (stage==18) {
    if (keyCode==ENTER) {
      stage = 19;
    } else {
    }
  }
  if (stage1==9) {
    if (keyCode==BACKSPACE) {
      stage = 18;
      correct1 = 0;
      wrong = 0;
    } else {
    }
  }
}