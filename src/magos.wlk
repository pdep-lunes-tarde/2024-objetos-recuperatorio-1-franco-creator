object prueba {}

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

  method poderTotal()
  {
    return self.poderObjetosMagicos() * self.poderInnato()
  }

  method poderObjetosMagicos() {
    return objetosMagicos.sum({objetoMagico => objetoMagico.cantidadPoder(self)})
  }

//esto probarlo luego
  method poderInnato()
  {
    if(!indicePoderInnato.between(1, 10))
    {
      self.error("el indice del poder innato no esta dentro del rango solicitado")
    } 
    return indicePoderInnato
  }

  method desafiaA(otroMago) {
    if(otroMago.tipoMago().esVencido(self, otroMago))
    {
      puntosEnergiaMagica += otroMago.puntosEnergiaMagica()
      otroMago.tipoMago().pierdePuntosEnergiaMagica(otroMago)
    }
  }

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



