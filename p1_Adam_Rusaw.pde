
enum Menu {MAIN, FIRE, ACCESSIBILITY, SETTINGS, STAFF};
enum Setting {POWER, LIGHT};

Menu currentMenu = Menu.MAIN;
Setting currentSetting;

StringBuffer inputPin;
int tapCount = 0;
boolean fireCallActive = false;
boolean powerActive = true;
boolean lightActive = true;
boolean pinInvalid = false;

int currentFloor = 2;
int[] floor1Color;
int[] floor2Color;
int[] floor3Color;
int[] fireCallColor;
int[] powerColor;
int[] lightColor;

int[] redRGB = new int[] {150, 32, 36};
int[] greenRGB = new int[] {33, 143, 79};


//Font
PFont cursiveXLarge;
PFont cursiveLarge;
PFont cursiveSmall;
PFont cursiveMini;
PFont braille;

//Icons
PImage closeDoor;
PImage openDoor;
PImage settings;
PImage fire;
PImage call;
PImage cancel;
PImage bell;
PImage power;
PImage light;
PImage backspace;
PImage enter;
PImage tap;

public void setup()
{
    size(520, 680);
    
    cursiveXLarge = createFont("micross.ttf", 30);
    cursiveLarge  = createFont("micross.ttf", 20);
    cursiveSmall  = createFont("micross.ttf", 15);
    cursiveMini = createFont("micross.ttf", 10);
    braille = createFont("BrailleNormal-lLDX.ttf", 15);
    
    closeDoor = loadImage("icons/close_door.png");
    closeDoor.resize(60, 60);
    
    openDoor = loadImage("icons/open_door.png");
    openDoor.resize(60, 60);
    
    settings = loadImage("icons/settings.png");
    settings.resize(60, 60);
    
    fire = loadImage("icons/fire.png");
    fire.resize(60, 60);
    
    call = loadImage("icons/call.png");
    call.resize(60, 60);
    
    cancel = loadImage("icons/cancel.png");
    cancel.resize(60, 60);
    
    bell = loadImage("icons/bell.png");
    bell.resize(60, 60);
    
    power = loadImage("icons/power.png");
    power.resize(60, 60);
    
    light = loadImage("icons/light.png");
    light.resize(60, 60);
    
    backspace = loadImage("icons/backspace.png");
    backspace.resize(50, 50);
    
    enter = loadImage("icons/enter.png");
    enter.resize(40, 40);
    
    tap = loadImage("icons/tap.png");
    tap.resize(150, 150);
    
    inputPin = new StringBuffer();
}

public void draw()
{
    background(0, 0, 0);
    fill(40,40,40);
    rect(10,10,500,600, 5, 5, 5, 5);
    
    
    floor1Color = new int[] {20, 20, 20};
    floor2Color = new int[] {20, 20, 20};
    floor3Color = new int[] {20, 20, 20};
    switch(currentFloor)
    {
       case 1:
           floor1Color = new int[] {27, 196, 159};
           break;
           
       case 2:
           floor2Color = new int[] {27, 196, 159};
           break;
           
       case 3:
           floor3Color = new int[] {27, 196, 159};
           break;
    }
    
    if (fireCallActive)
    {
        fireCallColor = new int[] {33, 143, 79};
    } else {
        fireCallColor = new int[] {100, 100, 100};
    }
    
    if (powerActive)
    {
        powerColor = new int[] {33, 143, 79};
    } else {
        powerColor = new int[] {150, 32, 36};
    }
    
    if (lightActive)
    {
        lightColor = new int[] {33, 143, 79};
    } else {
        lightColor = new int[] {150, 32, 36};
    }
    

    switch(currentMenu)
    {
        case MAIN:
            MainScreen();
            MainIcons();
            break;
            
        case FIRE:
            MainScreen();
            FireIcons();
            break;
            
        case ACCESSIBILITY:
            AccessibilityScreen();
            //MainIcons();
            break;
            
        case SETTINGS:
            MainScreen();
            SettingIcons();
            break;
            
       case STAFF:
            StaffScreen();
            SettingIcons();
            break;
    }
    
    
    //Accessibility bar
    fill(40,40,40);
    rect(110,615,300,50, 5, 5, 5, 5);
    fill(150, 150, 150);
    textFont(cursiveSmall);
    text("Tap floor number on screen (Accessibility)", 120, 640);
    textFont(braille);
    text("Tap floor number on screen", 117, 660);
    textFont(cursiveLarge);

}


public void MainScreen()
{
  //Hotel Outline
    fill(floor1Color[0], floor1Color[1], floor1Color[2]);
    rect(210, 460, 280, 150);
    fill(floor2Color[0], floor2Color[1], floor2Color[2]);
    rect(210, 310, 280, 150);
    fill(floor3Color[0], floor3Color[1], floor3Color[2]);
    rect(210, 160, 280, 150, 10, 10, 0, 0);

    //Hotel Doors
    fill(40,40,40);
    rect(330, 570, 20, 40);
    rect(350, 570, 20, 40);
    fill(0,0,0);
    ellipse(347, 590, 3, 3);
    ellipse(353, 590, 3, 3);


    //Hotel Floor Ellipse
    fill(200, 200, 200);
    ellipse(350, 210, 50, 50);
    ellipse(350, 360, 50, 50);
    ellipse(350, 510, 50, 50);

    //Hotel Floor Numbers
    fill(0, 0, 0);
    textSize(30);
    text("3", 342, 220);
    text("2", 342, 370);
    text("1", 342, 520);
    
    //Floor Selection Label
    fill(255, 255, 255);
    textFont(cursiveLarge);
    text("Press your desired floor", 160, 140);
    
    //3rd Floor Information
    stroke(255, 255, 255);
    fill(255, 255, 255);
    text("Floor 3", 75, 190);
    rect(40, 195, 125, 1);
    textFont(cursiveSmall);
    text("Rooms 300 - 332", 45, 215);
    text("Roof Access", 45, 230);
    
    //2nd Floor Information
    textFont(cursiveLarge);
    text("Floor 2", 75, 340);
    rect(40, 345, 125, 1);
    textFont(cursiveSmall);
    text("Rooms 200 - 230", 45, 365);
    text("Laundry Room", 45, 380);
    
    //1st Floor Information
    textFont(cursiveLarge);
    text("Floor 1", 75, 490);
    rect(40, 495, 125, 1);
    textFont(cursiveSmall);
    text("Rooms 100 - 120", 45, 515);
    text("Lobby", 45, 530);
    text("Gym / Pool", 45, 545);
    text("Restaurant", 45, 560);
    
    
    stroke(0,0,0);
    textFont(cursiveLarge);
}


public void MainIcons()
{
    //Top Button Bar
    fill(20, 20, 20);
    rect(15, 10, 490, 80, 0, 0, 10, 10);
  
    //Close door icon
    fill(100, 100, 100);
    rect(20, 15, 70, 70, 5, 5, 5, 5);
    image(closeDoor, 25, 20);
    
    //Open door icon
    rect(100, 15, 70, 70, 5, 5, 5, 5);
    image(openDoor, 105, 20);
    
    //Settings icon
    rect(350, 15, 70, 70, 5, 5, 5, 5);
    image(settings, 355, 20);
    
    //Fire icon
    fill(150, 32, 36);
    rect(430, 15, 70, 70, 5, 5, 5, 5);
    image(fire, 435, 20);
    
    //Current floor text
    textFont(cursiveSmall);
    fill(255, 255, 255);
    text("Current", 232, 30);
    text("Floor", 239, 45);
    fill(10, 10, 10);
    rect(232, 49, 50, 39, 5, 5, 5, 5);
    
    fill(255, 255, 255);
    text(currentFloor, 254, 75);
}

public void FireIcons()
{
    fill(150, 32, 36);
    rect(15, 10, 490, 80, 0, 0, 10, 10);
  
    //Call icon
    fill(fireCallColor[0], fireCallColor[1], fireCallColor[2]);
    rect(20, 15, 70, 70, 5, 5, 5, 5);
    image(call, 25, 20);
    
    //Cancel icon
    fill(100, 100, 100);
    rect(100, 15, 70, 70, 5, 5, 5, 5);
    image(cancel, 105, 20);
    
    fill(255, 255, 255);
    textFont(cursiveMini);
    text("In Case of Emergency", 250, 30);
    text("Use the call button to alert emergency services.", 195, 50);
    text("Use the cancel button to cancel emergency services call", 175, 60);
    text("Press the fire button again to return to main menu", 190, 70);
    
    
    //Fire icon
    fill(50, 50, 50);
    rect(430, 15, 70, 70, 5, 5, 5, 5);
    image(fire, 435, 20);
   
}

public void SettingIcons()
{
    //Top Button Bar
    fill(20, 20, 20);
    rect(15, 10, 490, 80, 0, 0, 10, 10);
  
    //Bell icon
    fill(100, 100, 100);
    rect(20, 15, 70, 70, 5, 5, 5, 5);
    image(bell, 25, 20);
    
    //Power icon
    fill(powerColor[0], powerColor[1], powerColor[2]);
    rect(100, 15, 70, 70, 5, 5, 5, 5);
    image(power, 105, 20);
    
    //Light icon
    fill(lightColor[0], lightColor[1], lightColor[2]);
    rect(180, 15, 70, 70, 5, 5, 5, 5);
    image(light, 185, 20);
    
    //Settings icon
    fill(50, 50, 50);
    rect(430, 15, 70, 70, 5, 5, 5, 5);
    image(settings, 435, 20);
}

public void StaffScreen()
{
    //Employee Code Text
    fill(255, 255, 255);
    textFont(cursiveLarge);
    text("Employee Code:", 190, 140);
  
    //Employee Code Input Box
    fill(10, 10, 10);
    rect(155, 150, 200, 75, 5, 5, 5, 5);
    
    //Number 7
    fill(20, 20, 20);
    rect(155, 230, 60, 60, 5, 5, 5, 5);
    fill(255, 255, 255);
    text("7", 180, 265);
    
    //Number 8
    fill(20, 20, 20);
    rect(225, 230, 60, 60, 5, 5, 5, 5);
    fill(255, 255, 255);
    text("8", 250, 265);
    
    //Number 9
    fill(20, 20, 20);
    rect(295, 230, 60, 60, 5, 5, 5, 5);
    fill(255, 255, 255);
    text("9", 320, 265);
    
    //Number 4
    fill(20, 20, 20);
    rect(155, 295, 60, 60, 5, 5, 5, 5);
    fill(255, 255, 255);
    text("4", 180, 330);
    
    //Number 5
    fill(20, 20, 20);
    rect(225, 295, 60, 60, 5, 5, 5, 5);
    fill(255, 255, 255);
    text("5", 250, 330);
    
    //Number 6
    fill(20, 20, 20);
    rect(295, 295, 60, 60, 5, 5, 5, 5);
    fill(255, 255, 255);
    text("6", 320, 330);
    
    //Number 1
    fill(20, 20, 20);
    rect(155, 360, 60, 60, 5, 5, 5, 5);
    fill(255, 255, 255);
    text("1", 180, 395);
    
    //Number 2
    fill(20, 20, 20);
    rect(225, 360, 60, 60, 5, 5, 5, 5);
    fill(255, 255, 255);
    text("2", 250, 395);
    
    //Number 3
    fill(20, 20, 20);
    rect(295, 360, 60, 60, 5, 5, 5, 5);
    fill(255, 255, 255);
    text("3", 320, 395);
    
    //Backspace
    fill(20, 20, 20);
    rect(155, 425, 60, 60, 5, 5, 5, 5);
    image(backspace, 160, 430);
    
    //Number 0
    fill(20, 20, 20);
    rect(225, 425, 60, 60, 5, 5, 5, 5);
    fill(255, 255, 255);
    text("0", 250, 460);
    
    //Enter
    fill(20, 20, 20);
    rect(295, 425, 60, 60, 5, 5, 5, 5);
    image(enter, 305, 435);
    
    fill(255, 255, 255);
    if (inputPin.length() >= 1)
    {
        ellipse(195, 190, 10, 10);
    }
    
    if (inputPin.length() >= 2)
    {
        ellipse(235, 190, 10, 10);
    }
    
    if (inputPin.length() >= 3)
    {
        ellipse(275, 190, 10, 10);
    }
    
    if (inputPin.length() >= 4)
    {
        ellipse(315, 190, 10, 10);
    }
    
    if (pinInvalid)
    {
        fill(redRGB[0], redRGB[1], redRGB[2]);
        textFont(cursiveLarge);
        text("Invalid Employee Pin", 160, 535);
    }
}

public void AccessibilityScreen()
{
    //Accessiblity Text
    fill(255, 255, 255);
    textFont(cursiveXLarge);
    text("Accessibility Mode", 140, 200);
    
    //Tap icon
    image(tap, 180, 260);
    
    //Return image
    textFont(cursiveSmall);
    text("Press below to return to normal mode", 140, 600);
    
    
    //Current floor text
    textFont(cursiveSmall);
    fill(255, 255, 255);
    text("Current", 232, 30);
    text("Floor", 239, 45);
    fill(10, 10, 10);
    rect(232, 49, 50, 39, 5, 5, 5, 5);
    
    fill(255, 255, 255);
    text(currentFloor, 254, 75);
}


public void mousePressed()
{
  
    //Accessibility Button
    if (OverRect(110,615,300,50))
    {
      if (currentMenu != Menu.ACCESSIBILITY)
      {
          currentMenu = Menu.ACCESSIBILITY;
          tapCount = 0;
      } else {
          currentMenu = Menu.MAIN;
      }
    }
    
    //Tap Support
    if (currentMenu == Menu.ACCESSIBILITY && powerActive)
    {
        if (OverRect(10,10,500,600))
        {
           if (tapCount > 2)
           {
               tapCount = 0;
           }
            
           tapCount++;
           
           currentFloor = tapCount;
        }
    }

  
    //Main selection
    if (currentMenu != Menu.ACCESSIBILITY && currentMenu != Menu.STAFF)
    {
        if (OverRect(210, 460, 280, 150) && powerActive)
        {
            currentFloor = 1;
        } else if (OverRect(210, 310, 280, 150) && powerActive) {
            currentFloor = 2;
        } else if (OverRect(210, 160, 280, 150) && powerActive) {
            currentFloor = 3;
        } else if (OverRect(430, 15, 70, 70)) {
           if (currentMenu == Menu.FIRE)
           {
               currentMenu = Menu.MAIN;
           } else if (currentMenu == Menu.MAIN) {
               currentMenu = Menu.FIRE;
           } else if (currentMenu == Menu.SETTINGS) {
               currentMenu = Menu.MAIN;
           }
        } else if (OverRect(350, 15, 70, 70)) {
            currentMenu = Menu.SETTINGS;
        }
    }
    
    //Fire Icons
    if (currentMenu == Menu.FIRE)
    {
        if (OverRect(20, 15, 70, 70))
        {
            fireCallActive = true;
        } else if (OverRect(100, 15, 70, 70)) {
            fireCallActive = false;
        }
    }
    
    //Settings Icon
    if (currentMenu == Menu.SETTINGS)
    {
        if (OverRect(100, 15, 70, 70))
        {
            inputPin = new StringBuffer();
            currentMenu = Menu.STAFF;
            currentSetting = Setting.POWER;
        } else if (OverRect(180, 15, 70, 70)) {
            inputPin = new StringBuffer();
            currentMenu = Menu.STAFF;
            currentSetting = Setting.LIGHT;
        }
    }
    
    
    //Staff Page
    if (currentMenu == Menu.STAFF)
    {
      //Return to main menu
        if (OverRect(430, 15, 70, 70))
        {
            currentMenu = Menu.MAIN;
        }
        
        if (inputPin.length() < 4)
        {
            //NUmbers 0 - 9
            if (OverRect(225, 425, 60, 60))
            {
                inputPin.append("0");
            } else if (OverRect(155, 360, 60, 60)) {
                inputPin.append("1");
            } else if (OverRect(225, 360, 60, 60)) {
                inputPin.append("2");
            } else if (OverRect(295, 360, 60, 60)) {
                inputPin.append("3");
            } else if (OverRect(155, 295, 60, 60)) {
                inputPin.append("4");
            } else if (OverRect(225, 295, 60, 60)) {
                inputPin.append("5");
            } else if (OverRect(295, 295, 60, 60)) {
                inputPin.append("6");
            } else if (OverRect(155, 230, 60, 60)) {
                inputPin.append("7");
            } else if (OverRect(225, 230, 60, 60)) {
                inputPin.append("8");
            } else if (OverRect(295, 230, 60, 60)) {
                inputPin.append("9");
            }
        }
        
        //Enter
        if (OverRect(295, 425, 60, 60))
        {
            if (inputPin.length() >= 3)
            {
                String input = inputPin.toString();
                if (input.equals("1111"))
                {
                    switch(currentSetting)
                    {
                        case POWER:
                            powerActive = !powerActive;
                            break;
                        
                        case LIGHT:
                            lightActive = !lightActive;
                            break;
                    }
                    pinInvalid = false;
                    currentMenu = Menu.SETTINGS;
                } else {
                   inputPin = new StringBuffer();
                   pinInvalid = true; 
                }
            }
        }
        //Backspace
        if (OverRect(155, 425, 60, 60)) {
          
        }
        
    }
}


//Mouse Functions
public boolean OverRect(int x, int y, int width, int height)
{
    if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height)
    {
        return true;
    } else {
        return false;
    }
}

public boolean OverCircle(int x, int y, int diameter)
{
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
        return true;
    } else {
        return false;
    }
}
