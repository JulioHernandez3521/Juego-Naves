class Asteroides {
  PVector location;
  PVector velocidad;
  PVector aceleracion;
  PVector tamaoA;
  
  Asteroides(){
    tamaoA = new PVector(30,30);
    location = new PVector(random(0,width),random(10,30));
    velocidad = new PVector(0,0);
    aceleracion = new PVector(0,0.03);
  }
  
  void update(){
    velocidad.add(aceleracion);
    location.add(velocidad);
  }

  void limite(){
    if(location.x>width){
      location.x= random(10,width);
      velocidad.y=0;
      velocidad.x=0;
    }
    if(location.x<0){
      location.x= random(10,width);
      velocidad.y=0;
      velocidad.x=0;
    }
    if(location.y>height){
      location.y = random(0,20);
      location.x = random(0,width);
      velocidad.y=0;
      velocidad.x=0;
    }
    if(location.y<0){
      location.y=height;
      location.x = random(0,width);
      velocidad.y=0;
      velocidad.x=0;
    }
  }
  
  
  void display (){
 //   fill(0,12);
   // rect(0,0,width,height);
    fill(204, 174, 98);
    ellipse(location.x,location.y,tamaoA.x,tamaoA.y);
    update();
    limite();
  }
  
 
 
}
