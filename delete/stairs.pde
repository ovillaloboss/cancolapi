class tools extends defaultObject{
  
  tools(){
    this.pos.set(100, 100);
  }
  
  boolean collision() {
    boolean col = super.collision();
    if (col && keyCode == CONTROL){
      inventory.tools = true;
      this.pos.set(900, this.pos.y);
    }
    return col;
  }
}