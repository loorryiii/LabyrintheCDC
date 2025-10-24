class Arrow extends Sprite {

  Arrow() {
    super(stage);
    setSizeTo(50);
    goTo(player);
    pointInDirection(player.direction);
  }

  void draw() {
    move(10);
    if (touch("edge")){
      deleteThisClone();
    }
    if (touch (End_boss)){
      End_boss.vie -= 5;
      deleteThisClone();
    }
    display();
  }
  
  void run(){
    
  }
}
