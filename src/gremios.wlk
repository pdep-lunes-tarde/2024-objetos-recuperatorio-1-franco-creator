class Gremio
{
    const esGremio = true

    method esGremio() = esGremio 

    const magos = new List()

    method esGremio(valorDeVerdad) = valorDeVerdad 
    
    method poderTotal() = magos.sum({mago => mago.poderTotal()})

    method resistMagica() = magos.sum({mago => mago.resistMagica()}) + self.magoLider().resistMagica()

    method puntosEnergiaMagica() = magos.sum({mago => mago.puntosEnergiaMagica()})

    //falta modelar el el puntito 3 de desafia

    //el oponente puede ser un mago o gremio
    method desafiaA(oponente)
    {
        if(oponente.esGremio())
        {
            if(self.esVencido(oponente))
            {
                //me falta la cantidad a aumentar
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

    method magoLider() = magos.max({mago => mago.poderTotal()})

    


}

object initialize {
  
  const gremio = new Gremio(magos = [])
}