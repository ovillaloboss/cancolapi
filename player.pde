class player{
  PVector pos;
  PVector direction;
  
  player(){
    this.pos = new PVector(width/2, 600);
    this.direction = new PVector(0, 0);
  }
  
  void display(){
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, 10, 10);
  }
  
  void move(){
    setDirection();
    pos.add(direction);
  }
  
  //Detección del tipo de tile respecto a la posición del personaje
  int tipoTile(PVector pos) {
    return map.tMap[(int)pos.y/map.tileSize][(int)pos.x/map.tileSize];
  }
  
  void setDirection(){
      //int[] restrictedTiles = { 1, 2, 12, 13, 14, 15 };
    switch(nDirection) {
      case 1:
        if (tipoTile(new PVector(player.pos.x, player.pos.y-7)) != 1
        && tipoTile(new PVector(player.pos.x, player.pos.y-7)) != 2
        && tipoTile(new PVector(player.pos.x, player.pos.y+5)) != 12
        && tipoTile(new PVector(player.pos.x, player.pos.y-7)) != 13
        && tipoTile(new PVector(player.pos.x, player.pos.y+5)) != 14
        && tipoTile(new PVector(player.pos.x, player.pos.y+5)) != 15
        && tipoTile(new PVector(player.pos.x, player.pos.y-7)) != 16) {
          player.direction = new PVector(0, -speed);
        } else {
          player.direction = new PVector(0, 0);
        }
      break;
      case 2:
        if (tipoTile(new PVector(player.pos.x, player.pos.y+7)) != 1
        && tipoTile(new PVector(player.pos.x, player.pos.y+7)) != 2
        && tipoTile(new PVector(player.pos.x, player.pos.y+7)) != 12
        && tipoTile(new PVector(player.pos.x, player.pos.y-5)) != 13
        && tipoTile(new PVector(player.pos.x, player.pos.y+7)) != 14
        && tipoTile(new PVector(player.pos.x, player.pos.y+7)) != 15
        && tipoTile(new PVector(player.pos.x, player.pos.y+6)) != 16
        && tipoTile(new PVector(player.pos.x, player.pos.y+6)) != 17) {
          player.direction = new PVector(0, speed);
        } else {
          player.direction = new PVector(0, 0);
        }
      break;
      case 3:
        if (tipoTile(new PVector(player.pos.x -7, player.pos.y)) != 1 && tipoTile(new PVector(player.pos.x -7, player.pos.y)) != 2) {
          player.direction = new PVector(-speed, 0);
        } else {
          player.direction = new PVector (0, 0);
        }
      break;
      case 4:
        if (tipoTile(new PVector(player.pos.x+7, player.pos.y)) != 1 && tipoTile(new PVector(player.pos.x+7, player.pos.y)) != 2) {
          player.direction = new PVector (speed, 0);
        } else {
          player.direction = new PVector (0, 0);
        }
      break;  
    }
  }
  
}