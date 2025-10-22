class Player extends Sprite {

  boolean attack;

  Player() {
    super(stage);
    goTo(35, 38); //coords depart X et Y
    setSizeTo(200);
    switchCostumeTo(0);
    // modifier la hitbox : modifyHitboxH(hauteur); et modifyHitboxW(largeur);
  }

  void draw() {
    ifOnEdgeBounce();

      //showHitbox(); affiche la hitbox (a enlever lors de la publication)
      if (keyIsPressed("rightArrow")&& !attack) {
        animate(32, 38, 4);
        pointInDirection(0);
        move(5);
      }
      if (touch(#FFE15F13)) {
        goTo(35, 38);
        End_boss.goTo(639, 656);
      }
      if (touch(#FF96FE65)) {
        say("j'ai gagné");
      } else {
        say("");
      }
      if (keyIsPressed("leftArrow")&& !attack) {
        animate(32, 38, 4);
        pointInDirection(180);
        move(5);
      }
      if (keyIsPressed("downArrow")&& !attack) {
        animate(20, 25, 4);
        pointInDirection(90);
        move(5);
      }
      if (keyIsPressed("upArrow")&& !attack) {
        animate(44, 49, 4);
        pointInDirection(-90);
        move(5);
      }
      setRotationStyle("left-right");
      display();
      if (!keyPressed && !attack) {
        animate(0, 3, 5);
      }
    }

    void run() {
    }
  }
