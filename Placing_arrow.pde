class Placing_arrow extends Sprite {

  Placing_arrow(float startX, float startY) {
    super(stage);
    setSizeTo(25);
    goTo(startX, startY);
  }

  void draw() {
    if (touch(player)) {
      player.arrowNumber += 1;
      deleteThisClone();
    }
    if (stage.backdrop == 1 || stage.backdrop == 2 || stage.backdrop == 3) {
      hide();
    } else {
      display();
    }
    animate(0, 2, 20);
  }
}

void run() {
}
