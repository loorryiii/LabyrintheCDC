class Bow extends Sprite {

  Bow() {
    super(stage);
    setSizeTo(20);
    goTo(761, 297);
  }

  void draw() {
    animate(0, 2, 20);
    if (touch(player)){
      hide();
      player.tir = true;
    }
    display();
  }
  
  void run(){
    
  }
}
