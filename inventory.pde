class inventory{
  boolean blueKey;
  boolean redKey;
  boolean yellowKey;
  boolean masterKey;
  boolean tools;
  boolean bone;
  boolean ouija;
  float posX;
  PImage [] images;
  float posS;
  int nSelect;
  boolean actiON;
  int nAction;
  float posA;
  
  inventory(){
    this.blueKey = false;
    this.redKey = false;
    this.yellowKey = false;
    this.masterKey = false;
    this.tools = false;
    this.bone = false;
    this.ouija = false;
    this.posS = 60;
    this.nSelect = 1;
    this.actiON = false;
    this.nAction = 1;
  }
  
  void display(){
    loadImages();
    printHUD();
    printItems();
    selector();
    if(this.actiON == true){
      actionSelect();
    }
  }
  
  void printHUD(){
    // Estructura del inventario
    strokeWeight(5);
    stroke(#1D38EB);
    strokeJoin(ROUND);
    fill(0);
    rect(10, 715, 682, 75);
  }
  
  void printItems(){
    noStroke();
    this.posX = 65;
    //blueKey
    if(this.blueKey == true){
      image(images[1], posX, 737);
    }
    this.posX = this.posX + 90;
    
    //redKey
    if(this.redKey == true){
      image(images[2], posX, 737);
    }
    this.posX = this.posX + 90;
    
    //yellowKey
    if(this.yellowKey == true){
      image(images[3], posX, 737);
    }
    this.posX = this.posX + 90;
    
    //masterKey
    if(this.masterKey == true){
      image(images[4], posX, 737);
    }
    this.posX = this.posX + 90;
    
    //stairs
    if(this.tools == true){
      image(images[5], posX, 737);
    }
    this.posX = this.posX + 90;
    
    //bone
    if(this.bone == true){
      image(images[6], posX, 737);
    }
    this.posX = this.posX + 90;
    
    //ouija
    if(this.ouija == true){
      image(images[7], posX, 737);
    }
  }
  
  void loadImages(){
    images = new PImage[17];
    images[0] = loadImage("img/inventory/select.png");
    //active
    images[1] = loadImage("img/items/keys/blueKey.png");
    images[2] = loadImage("img/items/keys/redKey.png");
    images[3] = loadImage("img/items/keys/yellowKey.png");
    images[4] = loadImage("img/items/keys/masterKey.png");
    images[5] = loadImage("img/items/tools.png");
    images[6] = loadImage("img/items/bone.png");
    images[7] = loadImage("img/items/ouija.png");
    //action
    images[15] = loadImage("img/inventory/action1.png");
    images[16] = loadImage("img/inventory/action2.png");
  }
  
  void selector(){
    if(this.actiON != true){
      image(images[0], posS, 732);
    }else{
      image(images[0], posS, 900);
    }
  }
  
  void actionSelect(){
    posA = posS + 40;
    if(this.nAction == 1){
      image(images[15], posA, 732);
    }else{
      image(images[16], posA, 732);
    }
  }
  
  void changeValues(String type){
    switch(type){
      case "blueKey":
        if(blueKey == true){
          this.blueKey = false;
        }else{
          this.blueKey = true;
        }
      break;
      case "redKey":
        if(redKey == true){
          this.redKey = false;
        }else{
          this.redKey = true;
        }
      break;
      case "yellowKey":
        if(yellowKey == true){
          this.yellowKey = false;
        }else{
          this.yellowKey = true;
        }
      break;
      case "masterKey":
        if(masterKey == true){
          this.masterKey = false;
        }else{
          this.masterKey = true;
        }
      break;
      case "stairs":
        if(tools == true){
          this.tools = false;
        }else{
          this.tools = true;
        }
      break;
      case "bone":
        if(bone == true){
          this.bone = false;
        }else{
          this.bone = true;
        }
      break;
      case "ouija":
        if(ouija == true){
          this.ouija = false;
        }else{
          this.ouija = true;
        }
      break;
    }
  }
  
}