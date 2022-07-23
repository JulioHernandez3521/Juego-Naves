class Jugador {
  PImage jugador = loadImage("nave.png");
  int vida = 10;
  PImage []vidas = new PImage[10];
  PVector posicion;
  //-----------Misiles---------/// 
  PVector pAtaque;
  PVector velocidad;
  PVector aceleracion;
  //----------------------------///
  //---------Constructor de clase-------------------
  Jugador(){
    posicion = new PVector(width/2,height-50);
    jugador.resize(50,50);
    pAtaque = new PVector(0,0);
    velocidad = new PVector(0,0);
    aceleracion = new PVector(0,30);
  }
  //---------------------------------------------------------//
  //------------Mostrar el jugador---------------------------//
  void display(){

    posicion = new PVector(mouseX,mouseY);    
    image(jugador,posicion.x,posicion.y);
    EstadoVida();
    if(mousePressed){
      mouseClicked();
    }
  }  
  //------------------------------------------------------//
  //-------------cragar la imagen corazon------------------//
  void cargaima(){
    for(int i=0;i<vida;i++){
        vidas[i] = loadImage("heart.png");
        vidas[i].resize(20,20);
    }
  
  }
  //------------------------------------------------------//
  //-------------Dibujar los corazones segun la vida------------------//
  void EstadoVida(){
    int c=0;
    for(int i=0;i<vida;i++){
         c+=20;
        image(vidas[i],c,50);
        
    }
  }
  //------------------------------------------------------//
  
  //------------------Hacer el atque------------------------//
  
  void Ataque (){
    fill(255,213,2);
    velocidad.add(aceleracion);
    pAtaque.sub(velocidad);
    ellipse(pAtaque.x,pAtaque.y,10,10);
    if(pAtaque.y<0){
      pAtaque.y = -100;
      velocidad.y=0;
    }
  }
  //------------------------------------------------------//
  //------------------------------------------------------//

  void resetAtaque(){
    pAtaque.y= -100;
    velocidad.y = 0;
    
  }
  
  //--------------------Hacer que ataque el jugador-------------------//
  void mouseClicked(){
      pAtaque.x = posicion.x+10;
      pAtaque.y = posicion.y;
      Ataque();
  }
  //------------------------------------------------------//
  
}
