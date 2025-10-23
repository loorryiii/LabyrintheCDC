class Player extends Sprite {

  boolean attack, tir; //attack stop et tir
  int vie = 50, arrowNumber = 0; //variable vie et nombre de flèches

  Player() {
    super(stage); //stage
    goTo(35, 38); //coords depart X et Y
    setSizeTo(200); //regler la taille du joueur
    switchCostumeTo(20); //mettre le costume de départ en idle
    // modifier la hitbox : modifyHitboxH(hauteur); et modifyHitboxW(largeur);
    modifyHitboxH(-82);
    modifyHitboxW(-82);
  }

  void draw() { //la void draw
    ifOnEdgeBounce(); //rebondir sur les bords

      //showHitbox(); //affiche la hitbox (a enlever lors de la publication)
      if (keyIsPressed("rightArrow")&& !attack) { //si la touche de droite est presée et que le joueur n'attaque pas
        animate(35, 42, 4); //faire l'animation de walk
        pointInDirection(0); //aller dans la direction droite
        move(5); //avancer de 5 vers la droite
      }
      if (keyIsPressed("leftArrow")&& !attack) { //si la touche de gauche est presée et que le joueur n'attaque pas
        animate(35, 42, 4); //faire l'animation de walk
        pointInDirection(180); //aller dans la direction gauche
        move(5); //avancer de 5 vers la gauche
      }
      if (keyIsPressed("downArrow")&& !attack) { //si la touche de bas est presée et que le joueur n'attaque pas
        animate(35, 42, 4); //faire l'animation de walk
        pointInDirection(90); //aller dans la direction bas
        move(5); // avancer de 5 vers le bas
      }
      if (keyIsPressed("upArrow")&& !attack) { //si la touche de haut est presée et que le joueur n'attaque pas
        animate(44, 49, 4); //faire l'animation de walk
        pointInDirection(-90); //aller dans la direction haut
        move(5); // avancer de 5 vers le haut
      }
      setRotationStyle("left-right"); //mettre le style de rotation a "gauche-droite"
      if (!keyPressed && !attack) { //si aucune touche n'est présée 
        animate(29, 34, 5); //faire l'animation de IDLE
      }
      if (touch(#FFE15F13)) { //si le joueur touche de la lave
        goTo(35, 38); //revenir au depart
        End_boss.goTo(639, 656); //le boss aussi revient a son point de départ
      }
      if(keyIsPressed("s") && !attack){ //si la touche s est présée
        animate(0, 5, 4); //faire l'animation d'attaque
        attack = true; //mettre attack a vraie
        if (costume == 4 && touch (End_boss)){
          End_boss.vie -= 15/4;
        }
      } else { //sinon
        attack = false; //mettre attack a faux
      }
      if (stage.backdrop == 1 || stage.backdrop == 2 || stage.backdrop == 3){
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
      rect(x - 25, y - 40, 50, 20); //rectangle de la barre rouge
      fill(#15FA3C); //barre verte du debut
      rect(x - 25, y - 40, vie, 20); //rectangle de la barre verte
      pop(); //fin
      vie = constrain(vie, 0, 50);
      
    }

    void run() {
      while(!deleteThisClone){
        delay(16);
        if (tir && keyIsPressed("d") && !attack && arrowNumber > 0){
          attack = true;
          animate(12, 20, 80, false);
          cloneTir.add(new Arrow());
          arrowNumber -= 1; // on perd une flèche
          attack = false;
        }
      }
      if (vie == 0){
        stage.switchBackdropTo(1);
        stage.Wait(5);
        exit();
      }
    }
  }
