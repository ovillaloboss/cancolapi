abstract class defaultObject{
  PVector pos;
  String type;
  PImage image;
  
  defaultObject(){
    this.pos = new PVector(0, 0);
    this.image = loadImage("img/items/keys/masterKey.png");
  }
  
  void display(){
    collision();
    noStroke();
    imageMode(CENTER);
    image(this.image, this.pos.x, this.pos.y);
    imageMode(CORNER);
  }
  
  boolean collision(){
    boolean col = false;
    if(dist(this.pos.x, this.pos.y, player.pos.x, player.pos.y-7) <= 10
    || dist(this.pos.x, this.pos.y, player.pos.x, player.pos.y+7) <= 10
    || dist(this.pos.x, this.pos.y, player.pos.x-7, player.pos.y) <= 10
    || dist(this.pos.x, this.pos.y, player.pos.x+7, player.pos.y) <= 10){
      col = true;
    }
    
    switch(type){
      case "ghost":
        if (col && inventory.ouija == true){
          if(hit == true){
            this.pos.set(900, 900);
            ghost.easing = 0;
            inventory.ouija = false;
          }
        }else if(col){
          death = true;
        }
      break;
      case "dog":
        if (col && inventory.bone == true){
          dog.image = loadImage("img/enemies/dog2.png");
          goodBoy = true;
          inventory.bone = false;
        }else if(col && goodBoy != true){
          goodBoy = false;
          death = true;
        }
      break;
      default:
        if (col && keyCode == CONTROL){
          inventory.changeValues(this.type);
          this.pos.set(900, this.pos.y);
        }
      break;
    }
    
    return col;
  }
  
  void drop(){
    this.pos.set(player.pos.x,player.pos.y);
    inventory.changeValues(this.type);
  }
  
}