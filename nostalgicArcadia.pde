
Asteroides [] asteroide = new Asteroides[15];
Naves [][] nave = new Naves[5][5];
int ast,navesEnemigas;
float distancia,ddestr,posy,posx,ac,posx2,DBN,DBNM,DistNavNav;
boolean valVida,valNivel,nivel3,reinicio;
Jugador jugador;


void setup(){
 fullScreen();

  jugador = new Jugador();//Se crea un jugador
  jugador.cargaima();  //Dibuja los corazones o vidas del jugador
  
  valVida = false;//Para saber que el jugador esta vivo
  
  nivel3 = false;//Saber si se carga el nivel 3
  reinicio =false;
  ast = 15;
  navesEnemigas = 25;

  //Crear los asteroides
  for(int i=0;i<ast;i++){
    asteroide[i] = new Asteroides();
  }

  //Crear las naves enemigas
  posx=0;
  posy =20;
  for(int i=0;i<nave.length;i++){
    // nave[i] = new Naves(posx,posy);
    // posx +=15; 
      for(int j=0;j<nave[i].length;j++){
        nave[i][j] = new Naves(posx,posy);
        posx +=35;
      }
      posx =0;
      posy +=55;
  }   
 /* float c =0;
  for(int a=0;a<navAtaque.length;a++){
    c +=20;
    navAtaque[a] = new Nave_Ataque(c);
  }*/
  valNivel=true;
 
}

void draw(){
  background(0);
 
  
  if(mousePressed){   
      jugador.display();
      // Nivel1();
      Nivel2();
      // Nivel3();

  }
  else{
    
      textSize(50);
      text("Presiona para comenzar"+"\n"+"Destruye los objetivos",width/9,height/3);
    
  }
  
  
}


void Nivel1(){
   for(int i=0;i<ast;i++){
    asteroide[i].display();
    distancia = dist(jugador.posicion.x,jugador.posicion.y,asteroide[i].location.x,asteroide[i].location.y); //Calcula la distancia asteroide y nave
    ddestr = dist(jugador.pAtaque.x,jugador.pAtaque.y,asteroide[i].location.x,asteroide[i].location.y);//Calcula distancia asteroide bala
    if(distancia<50){//si es menor a 50 
      if(jugador.vida>0){
         jugador.vida -= 1;//Se resta una vida al juagdor
         asteroide[i].location.y= 0;//el asteroide desaparece
      }
    }
    if(ddestr<10){
      if(ast>0){//si hay asteroides 
         ast -=1;//se destruye el asteroide que choco con la nave
         asteroide[i].location.y= 0;//el asteroide desaparece
         jugador.pAtaque.y= -200;
         jugador.pAtaque.x= -100;
       }
    }
   }
    if(jugador.vida == 0){
          jugador.vida = 0;
          valVida = true;//indica que el jugador se murio
          
    }
   if(ast == 0){             
        valNivel=true; //Indica que destruto todos los asteroides
    }
   if(valNivel && !valVida && ast ==0){// si no hay asteroides 
     //background(312,112,322);
     valVida = false;
     valNivel=true;
     //jugador.vida =10;
     println(valVida,valNivel);
     ast =0;//no havia hasteroides y ast es 0
     if(!mousePressed){
       background(312,12,32); 
       fill(222);
       textSize(50);
       text("Has llegado al segundo nivel Presiona para continuar",width/9,height/3);
    }
   }else{
     if(valVida && !valNivel){
       jugador.vida =0;
       if(jugador.vida == 0){
         valVida = true;
         valNivel=false;
         nivel3 =false;
         fill(222);
         textSize(50);
         text("Game Over",width/3,height/3);
         noLoop();
       }
     }
   }
}


void Nivel2(){

   if(valNivel){
    //  valNivel=false;
     
       for(int i=0;i<nave.length;i++){
            
              for(int j=0;j<nave[i].length;j++){
                
                  nave[i][j].display();
                  
                  //Calcular choque de jugador y naves enemigas
                  DistNavNav = dist(jugador.posicion.x,jugador.posicion.y,nave[i][j].location.x,nave[i][j].location.y);
                  if(DistNavNav <= 10){

                    if(jugador.vida>0){
                      jugador.vida -=1;//Se resta una vida al juagdor Por tocar la nave enemiga
                      nave[i][j].matarNave();//el enemigo desaparece
                    }else{
                      valVida = true;
                    }
                  }

                  //Hacer el disparo de las naves enemigas
                  if(j%2==0 && i%2!=0){
                    nave[i][j].Ataque();
                    DBN = dist(jugador.posicion.x,jugador.posicion.y,nave[i][j].pAtaque.x,nave[i][j].pAtaque.y);
                    if(DBN <= 30){//si es menor a 50 
                        if(jugador.vida > 0){
                          
                          jugador.vida +=-1;//Se resta una vida al juagdor
                          nave[i][j].pAtaque.y= 0;//La vala de la nave desaparece
                          nave[i][j].velocidadA.y= 0;//La vala de la nave desaparece
                          
                        }else{
                          valVida = true;
                        }
                      }
                  }
                  
                  //Contra ataque del jugador
                  DBNM = dist(jugador.pAtaque.x,jugador.pAtaque.y,nave[i][j].location.x,nave[i][j].location.y);
                  if(DBNM <= 30){
                      nave[i][j].matarNave();//el enemigo desaparece
                      jugador.resetAtaque();//reinicia su ataque

                    if(navesEnemigas > 0){
                      navesEnemigas -=1;//se disminuye el contador para una nave menos
                    }else{
                      nivel3 = true;
                    }
                  }

                  if (valVida) {
                    fill(222);
                    textSize(50);
                    text("Game Over",width/3,height/3);
                  }
              }


            }

            if (navesEnemigas == 0) {
              
                if(nivel3 && !valVida){// si no hay asteroides 
                    //background(312,112,322);
                    valVida = false;
                    nivel3=true;
                    jugador.vida = 10;
                    println("Salio del for ",valVida,nivel3);
                  
                    if(!mousePressed){
                      background(312,12,32); 
                      fill(222);
                      textSize(50);
                      text("Has llegado al segundo nivel Presiona para continuar",width/9,height/3);
                    }
                  }else{
                    if(valVida && !nivel3){
                      jugador.vida =0;
                      if(jugador.vida ==0){
                        valVida = true;
                        valNivel=false;
                        nivel3 =false;
                        fill(222);
                        textSize(50);
                        text("Game Over",width/3,height/3);
                      }
                    }
                  }
            }

      }
   }
    //     /*for(int b=0;b<navAtaque.length;b++){
    //       navAtaque[b].Dibujanave();
    //     }*/
    //     if(jugador.vida ==0){
    //         jugador.vida =0;
    //         valVida = true;
    //      }
    //      if(naves ==0){             
    //          naves =0;//no havia hasteroides y naves es 0
    //          nivel3 = true;
    //          if(!mousePressed){
    //                background(312,12,32); 
    //                fill(222);
    //                textSize(50);
    //                text("Has llegado al ultimo nivel Presiona para continuar",width/9,height/3);
    //          }
    //   }
    //    }
    // }

void Nivel3(){
  if(nivel3){
    valNivel =false;
     fill(222);
     textSize(50);
     text("Has ganado",width/4,height/2);
     reinicio = true;
  }
}

//  void matarNave(Naves[][] misNaves, int fila, int columna){
      
//       for(int i=0;i<misNaves.length;i++){
//           for(int j=0;j<misNaves[i].length;j++){
//               if(misNaves[i][j]==misNaves[fila][columna]){
//                   misNaves[i][j] = new Naves();
//               }
//           }
//       }

    
// }
