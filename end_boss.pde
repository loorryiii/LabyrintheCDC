class end_boss extends Sprite {

  int vie = 15;
  end_boss() {
    super(stage);
    setSizeTo(250);
    goTo(639, 656);
    modifyHitboxH(-100);
    modifyHitboxW(-100);
    setRotationStyle("left-right");
  }

  void draw() {
    if (vie == 0 || player.vie == 0){
      hide();
      deleteThisClone();
    } else {
      display();
      lifebar();
    }
  }
  
  void lifebar(){ //voici la void lifebar :
      push(); //debut des fonctions graphiques
      noStroke(); //pas de contour
      fill(#FA3416); //barre rouge a devoiler
      rect(x - 25, y - 40, 75, 20); //rectangle de la barre rouge
      fill(#15FA3C); //barre verte du debut
      rect(x - 25, y - 40, vie, 20); //rectangle de la barre verte
      pop(); //fin
      vie = constrain(vie, 0, 75);
      
    }
  
  void run(){
    while(!deleteThisClone && vie > 0){
      delay(16);
      if (distanceTo(player) > 250){
        animate(20, 25, 80, false);
      } else if (distanceTo(player) > 50){
        pointTowards(player);
        animate(26, 33, 4);
        move(3);
      }else{
        animate(0, 5, 80, false);
        player.vie -=10;
        stage.Wait(0.5);
      }
    }
    if (vie == 0){
      stage.switchBackdropTo(3);
      stage.Wait(2);
      stage.switchBackdropTo(2);
    }
  }
}
