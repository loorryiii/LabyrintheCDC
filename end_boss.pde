class end_boss extends Sprite {

  end_boss() {
    super(stage);
    setSizeTo(250);
    goTo(639, 656);
    modifyHitboxH(-100);
    modifyHitboxW(-100);
  }

  void draw() {
    setRotationStyle("left-right");
    display();
    showHitbox(); //affiche la hitbox (a enlever lors de la publication)
  }
  
  void run(){
    while(!deleteThisClone){
      delay(16);
      if (distanceTo(player) > 250){
        animate(20, 25, 80, false);
      } else if (distanceTo(player) > 50){
        pointTowards(player);
        animate(26, 33, 4);
        move(3);
      }else{
        animate(0, 5, 80, false);
      }
    }
  }
}
