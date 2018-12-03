PFont scaryFont;
PImage backgroundImage, playButton, helpButton, pointer;
boolean pointON = true;
boolean instructions = false;
int pointPos = 0;
char direccion;
int nDirection = 0;
int speed = 2;
boolean death = false;
boolean hit = false;
boolean goodBoy = false;
map map;
player player;
inventory inventory;
// Create Keys
defaultKey blueKey, redKey, yellowKey, masterKey;
// Create items
defaultItem tools, bone, ouija;
// Create enemies
defaultEnemy ghost, dog;

void setup(){
  background(0);
  size(703, 800);
  map = new map();
  player = new player();
  inventory = new inventory();
  // Keys
  blueKey = new defaultKey("blueKey", 430, 270);
  blueKey.image = loadImage("img/items/keys/blueKey.png");
  redKey = new defaultKey("redKey", 650, 650);
  redKey.image = loadImage("img/items/keys/redKey.png");
  yellowKey = new defaultKey("yellowKey", 130, 660);
  yellowKey.image = loadImage("img/items/keys/yellowKey.png");
  masterKey = new defaultKey("masterKey", 600, 130);
  masterKey.image = loadImage("img/items/keys/masterKey.png");
  // Objects
  tools = new defaultItem("stairs", 500, 650);
  tools.image = loadImage("img/items/tools.png");
  bone = new defaultItem("bone", 100, 100);
  bone.image = loadImage("img/items/bone.png");
  ouija = new defaultItem("ouija", 510, 60);
  ouija.image = loadImage("img/items/ouija.png");
  // Enemies
  ghost = new defaultEnemy("ghost", 350, 150);
  ghost.image = loadImage("img/enemies/ghost.png");
  dog = new defaultEnemy("dog", 577, 450);
  dog.image = loadImage("img/enemies/dog.png");
}

void draw(){
  if(pointON == true && instructions == false){
    intro();
    movePointer();
  }else if(instructions == true){
    instructions();
  }else{
    if(death == true){
    fill(255, 0, 0);
    gameMessage("YOU DIED");
    }else{
      if(player.pos.y < 12){
        fill(0, 255, 0);
        gameMessage("YOU WON");
      }else{
        map.display();
        inventory.display();
        blueKey.display();
        redKey.display();
        yellowKey.display();
        masterKey.display();
        tools.display();
        bone.display();
        ouija.display();
        ghost.fly();
        ghost.display();
        dog.display();
        player.move();
        player.display();
      }
    }
  }
}

void keyPressed() {
  switch(key){
    case 'w': nDirection = 1;break;
    case 's': nDirection = 2;break;
    case 'a': nDirection = 3;break;
    case 'd': nDirection = 4;break;
  }
  switch(keyCode){
    case RIGHT:
      if(inventory.posS != 600 && inventory.actiON == false){
        inventory.posS = inventory.posS + 90;
        inventory.nSelect++;
      }
    break;
    case LEFT:
      if(inventory.posS != 60 && inventory.actiON == false){
        inventory.posS = inventory.posS - 90;
        inventory.nSelect--;
      }
    break;
    case ENTER:
      if(pointON == true){
        switch(pointPos){
          case 0:
            pointON = false;
          break;
          case 1:
            instructions = true;
            pointON = false;
          break;
        }
      }else if(instructions == true){
        pointON = true;
        instructions = false;
      }else{
        if(inventory.actiON == false){
          inventory.actiON = true;
        }else{
          inventory.actiON = false;
          if(inventory.nAction == 1){
            switch(inventory.nSelect){
              case 1:
                if((player.tipoTile(new PVector(player.pos.x, player.pos.y+5)) == 12 || player.tipoTile(new PVector(player.pos.x, player.pos.y-5)) == 12) && inventory.blueKey == true){
                  map.tMap[7][3] = 0;
                  map.tMap[7][4] = 0;
                  inventory.blueKey = false;
                }
              break;
              case 2:
                if((player.tipoTile(new PVector(player.pos.x, player.pos.y+5)) == 13 || player.tipoTile(new PVector(player.pos.x, player.pos.y-5)) == 13) && inventory.redKey == true){
                  map.tMap[14][3] = 0;
                  map.tMap[14][4] = 0;
                  inventory.redKey = false;
                }
              break;
              case 3:
                if((player.tipoTile(new PVector(player.pos.x, player.pos.y+5)) == 14 || player.tipoTile(new PVector(player.pos.x, player.pos.y-5)) == 14) && inventory.yellowKey == true){
                  map.tMap[7][17] = 0;
                  map.tMap[7][18] = 0;
                  inventory.yellowKey = false;
                }
              break;
              case 4:
                if((player.tipoTile(new PVector(player.pos.x, player.pos.y+5)) == 15 || player.tipoTile(new PVector(player.pos.x, player.pos.y-5)) == 15) && inventory.masterKey == true){
                  map.tMap[0][10] = 0;
                  map.tMap[0][11] = 0;
                  inventory.masterKey = false;
                }
              break;
              case 5:
                //tools
                if((player.tipoTile(new PVector(player.pos.x, player.pos.y+10)) == 17 || player.tipoTile(new PVector(player.pos.x, player.pos.y-10)) == 17) && inventory.tools == true){
                  map.tMap[19][4] = 18;
                  inventory.tools = false;
                }
              break;
              case 6:
                //bone
                
              break;
              case 7:
                //ouija
                if(inventory.ouija == true){
                  hit = true;
                }
              break;
            }
          }else if(inventory.nAction == 2){
            switch(inventory.nSelect){
            case 1:
              if(inventory.blueKey == true){
                blueKey.drop();
              }
            break;
            case 2:
              if(inventory.redKey  == true){
                redKey.drop();
              }
            break;
            case 3:
              if(inventory.yellowKey  == true){
                yellowKey.drop();
              }
            break;
            case 4:
              if(inventory.masterKey  == true){
                masterKey.drop();
              }
            break;
            case 5:
              if(inventory.tools  == true){
                tools.drop();
              }
            break;
            case 6:
              if(inventory.bone  == true){
                bone.drop();
              }
            break;
            case 7:
              if(inventory.ouija  == true){
                ouija.drop();
              }
            break;
          }
          inventory.nAction = 1;
          }
        }
      }
      break;
    case UP:
      if(pointON == true){
        pointPos = 0;
      }
      if(inventory.actiON == true){
        if(inventory.nAction != 1){
          inventory.nAction = 1;
        }else{
          inventory.nAction = 2;
        }
      }
    break;
    case DOWN:
      if(pointON == true){
        pointPos = 1;
      }
      if(inventory.actiON == true){
        if(inventory.nAction != 2){
          inventory.nAction = 2;
        }else{
          inventory.nAction = 1;
        }
      }
    break;
  }
}

void keyReleased(){
  player.direction = new PVector(0, 0);
  nDirection = 0;
}

void gameMessage(String text){
  background(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text(text, width/2, height/2); 
  fill(0, 102, 153);      
}

void intro(){
  scaryFont = createFont("fonts/scaryFont.ttf", 32);
  backgroundImage = loadImage("img/background.png");
  playButton = loadImage("img/playButton.png");
  helpButton = loadImage("img/helpButton.png");
  pointer = loadImage("img/pointer.png");
  background(backgroundImage);
  noStroke();
  imageMode(CENTER);
  fill(255);
  image(playButton, width/2, 400);
  image(helpButton, width/2, 500);
  textFont(scaryFont);
  textSize(12);
  textAlign(CENTER, CENTER);
  text("Game made by Oscar Villalobos", width/2, 780); 
}

void movePointer(){
  switch(pointPos){
    case 0:image(pointer, 520, 435);break;
    case 1:image(pointer, 520, 535);break;
  }
}

void instructions(){
  backgroundImage = loadImage("img/controls.png");
  background(backgroundImage);
}