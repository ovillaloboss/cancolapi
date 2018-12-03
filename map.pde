class map{
  int size;
  int tileSize;
  int [][] tMap;
  PImage [] tile;
  
  
  map(){
    this.size = 22;
    this.tileSize = 32;
    this.tMap = new int[][] {
      {1, 2, 2, 2, 2, 2, 2, 3, 2, 2, 15, 15, 2, 2, 3, 2, 2, 2, 2, 2, 2, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 2, 2, 12, 12, 2, 2, 3, 2, 2, 0, 0, 2, 2, 3, 2, 2, 14, 14, 2, 2, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 2, 2, 13, 13, 2, 2, 3, 2, 2, 0, 0, 2, 2, 3, 2, 2, 0, 0, 2, 2, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 16, 16, 16, 17, 16, 16, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
      {1, 2, 2, 2, 2, 2, 2, 3, 2, 2, 2, 2, 2, 2, 3, 2, 2, 2, 2, 2, 2, 1}
    };
  }
  
  void display(){
    background(0);
    loadTiles();
    drawMap();
  }
  
  void drawMap(){
    for (int y=0; y<size; y++) {
      for (int x=0; x<size; x++) {
        image(tile[tMap[y][x]], x*tileSize, y*tileSize);
      }
    }
  }
  
  void loadTiles(){
    tile=new PImage[19];
    tile[0]=loadImage("img/tiles/tile0.png");
    tile[1]=loadImage("img/tiles/tile1.png");
    tile[2]=loadImage("img/tiles/tile2.png");
    tile[3]=loadImage("img/tiles/tile3.png");
    tile[4]=loadImage("img/tiles/tile4.png");
    tile[5]=loadImage("img/tiles/tile5.png");
    tile[6]=loadImage("img/tiles/tile6.png");
    tile[7]=loadImage("img/tiles/tile7.png");
    tile[8]=loadImage("img/tiles/tile8.png");
    tile[9]=loadImage("img/tiles/tile9.png");
    tile[10]=loadImage("img/tiles/tile10.png");
    tile[11]=loadImage("img/tiles/tile11.png");
    tile[12]=loadImage("img/doors/blueDoor.png");
    tile[13]=loadImage("img/doors/redDoor.png");
    tile[14]=loadImage("img/doors/yellowDoor.png");
    tile[15]=loadImage("img/doors/masterDoor.png");
    tile[16]=loadImage("img/tiles/tile12.png");
    tile[17]=loadImage("img/tiles/brokenBridge.png");
    tile[18]=loadImage("img/tiles/bridge.png");
  }
}