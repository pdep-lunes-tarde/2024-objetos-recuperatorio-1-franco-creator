class Gremio
{
    const esGremio = true

    method esGremio() = esGremio 

    //en esta lista por el punto 3 puede tener tambien gremios
    const magos = new List()

    method magos() = magos

    method esGremio(valorDeVerdad) = valorDeVerdad 

//para el punto 1 parte b
    method initialize() {
      if(magos.size() < 2)
      {
        self.error("el gremio debe de tener por lo menos dos miembros")
      }
    }
    
    method poderTotal() = magos.sum({mago => mago.poderTotal()})

    method resistMagica() = magos.sum({mago => mago.resistMagica()}) + self.magoLider().resistMagica()

    method puntosEnergiaMagica() = magos.sum({mago => mago.puntosEnergiaMagica()})


//punto 2 parte b
    //el oponente puede ser un mago o gremio
    method desafiaA(oponente)
    {
        if(oponente.esGremio())
        {
            if(self.esVencido(oponente))
            {
            oponente.magos().forEach({mago => self.magoLider().desafiaA(mago)})
            }
            
        }
        //aca se analiza cuando es un mago el oponente

        //lo intente hacer asi en un principio pero lo estuvimos viendo con un profe y no sabiamos por que tira error por eso lo hice como abajo con otro if
        // else{ 
         //   self.magoLider().desafiaA(oponente)
        // }
        if(!oponente.esGremio())
        {
          self.magoLider().desafiaA(oponente)
        }

    }

    method esVencido(oponente) = self.poderTotal() > oponente.resistMagica()


// sin el punto 3 de la parte b es asi el magoLider
//method magoLider() = magos.max({mago=> mago.poderTotal()})
//el if es por el punto 3 de la parte b
    method magoLider(){ 
    //si hay un gremio dentro del gremio entra al if
    if(magos.contains({mago => mago.esGremio()}))
    {
        const gremioDentroDelGremio = magos.find({mago => mago.esGremio()})
       return gremioDentroDelGremio.magos().max({mago => mago.poderTotal()})
    }
    return magos.max({mago=> mago.poderTotal()})
    
    }

}