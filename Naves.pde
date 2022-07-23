class Naves{
  PImage  nav;
  PVector location;
  PVector velocidad;
  PVector aceleracion;
//////////////////////////////
  PVector velocidadA;
  PVector aceleracionA;
  PVector pAtaque;
  
  Naves(float posx,float posy){  
    location = new PVector(posx,posy);
    velocidad = new PVector(0,0);
    aceleracion = new PVector(.3,0);
    //-----------------------------------------
    pAtaque = new PVector(0,-150);
    velocidadA = new PVector(0,0);
    aceleracionA = new PVector(0,20);
  }


 
  
  void cargaima(){
    nav= loadImage("navA.png");
    nav.resize(50,50);
  }
 
 
  void limite(){
    if(location.x>width/2){
      velocidadA.x =0;
      aceleracion.x= -.8;
    }
    if(location.x< width/2){
      velocidadA.x =0;
      aceleracion.x=.8;
    }
  }

  
  void update(){
    velocidad.add(aceleracion);
    location.add(velocidad);
  }

  
  void Dibujanave(){
      cargaima();
      image(nav,location.x,location.y+60);
      limite();
      update();
      
  }
  
 void matarNave(){
    location.y = -200;
    location.x = -200;
    velocidadA.y = 0;
    aceleracionA.y = 0;
    aceleracion.x= 0;
    velocidad.x=0;
 }
  

  void ataque(){
    fill(255,213,2);
    velocidadA.add(aceleracionA);
    pAtaque.add(velocidadA);
    ellipse(pAtaque.x,pAtaque.y,10,10);
    if(pAtaque.y>height+10){
      pAtaque.y = -15;
      velocidadA.y=0;
    }
  }


 void mouseClicked(){
      pAtaque.x = location.x+10;
      pAtaque.y = location.y;
      ataque();
  }


  void Ataque(){
    if(mousePressed){
      mouseClicked();
    }
  }

  
 void display(){
    Dibujanave();
   
  }
  
  

}
