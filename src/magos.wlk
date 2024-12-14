/*algo de como lo implementé: si hay algun comentario con alguna pregunta(que me parece que los borre todos)
no importan ya que yo cuando voy resolviendo el problema voy haciendo anotaciones de dudas y no se si me olvidé de borrar alguno*/
class Mago
{
    const nombre
    const objetosMagicos = new List()
    const resistMagica
    var puntosEnergiaMagica
    var tipoMago
    const indicePoderInnato

    const esGremio = false

    method esGremio() = esGremio 

    method puntosEnergiaMagica() = puntosEnergiaMagica

    method resistMagica() = resistMagica

    method nombre() = nombre

    method tipoMago() = tipoMago

//punto 1 parte a
  method poderTotal()
  {
    return self.poderObjetosMagicos() * self.poderInnato()
  }

  method poderObjetosMagicos() {
    return objetosMagicos.sum({objetoMagico => objetoMagico.cantidadPoder(self)})
  }

  method poderInnato()
  {
    if(!indicePoderInnato.between(1, 10))
    {
      self.error("el indice del poder innato no esta dentro del rango establecido")
    } 
    return indicePoderInnato
  }


//punto 2 parte A
//otroMago es el mago al que se esta atacando
  method desafiaA(otroMago,cantidadPuntosARobarPorAtacante) {
    if(otroMago.tipoMago().esVencido(self, otroMago) &&  otroMago.verSiRobarPuntosAOtroMago(cantidadPuntosARobarPorAtacante,otroMago))
    {
      puntosEnergiaMagica += otroMago.puntosEnergiaMagica()
      otroMago.tipoMago().pierdePuntosEnergiaMagica(otroMago)
    }
  }

//analiza si tiene el mago al que se ataca la cantidad de puntos que se quiere robar
  method verSiRobarPuntosAOtroMago(cantidadPuntosARobar,otroMago) = cantidadPuntosARobar <= otroMago.puntosEnergiaMagica()


  method disminuirPuntosEnergiaMagica(aDisminuir) {
    puntosEnergiaMagica -= aDisminuir
  }

  method aumentarPuntosEnergiaMagicaLider(aAumentar)
    {
       puntosEnergiaMagica += aAumentar
    }
}


//modelados los tipos de magos

//analiza esVencido a si el mago que se esta defendiendo fue vencido
object aprendiz {
  method esVencido(magoAtacante,magoDefensor) = magoDefensor.resistMagica() < magoAtacante.poderTotal()

  method pierdePuntosEnergiaMagica(magoDefensor) {
    magoDefensor.disminuirPuntosEnergiaMagica(magoDefensor.puntosEnergiaMagica() / 2)
  }
}

object veterano {
  method esVencido(magoAtacante,magoDefensor) = magoAtacante.poderTotal() > (magoDefensor.resistMagica() + (magoDefensor.resistMagica() / 2))

  method pierdePuntosEnergiaMagica(magoDefensor) {
   magoDefensor.disminuirPuntosEnergiaMagica(magoDefensor.puntosEnergiaMagica() / 4)
  }
}

object inmortal {
  method esVencido(magoAtacante,magoDefensor) = false

//no hago nada en este ya que nunca es vencido este tipo de mago por lo tanto no pierde puntosEnergiaMagica
  method pierdePuntosEnergiaMagica(magoDefensor) {
  }
}



