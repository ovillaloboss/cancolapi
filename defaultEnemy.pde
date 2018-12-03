class defaultEnemy extends defaultObject {
  
  float easing;
  
  defaultEnemy(String type, float posX, float posY){
    super.type = type;
    super.pos.set(posX, posY);
    this.easing = 0.003;
  }
  
  void fly(){
    float targetX = player.pos.x;
    float dx = targetX - this.pos.x;
    this.pos.x += dx * easing;
    
    float targetY = player.pos.y;
    float dy = targetY - this.pos.y;
    this.pos.y += dy * easing;
  }
  
}