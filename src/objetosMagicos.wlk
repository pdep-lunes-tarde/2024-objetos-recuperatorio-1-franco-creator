
class Varita {
   const basePoder
  method cantidadPoder(mago) {
    return self.cantidadPoderDependiendoNombre(mago)
  }

  method cantidadPoderDependiendoNombre(mago)
  {
    if(!mago.nombre().length().even())
    {
    return basePoder
    }
    return (basePoder + (basePoder / 2))
  }
}

//hay dos tipos de tunicas
class TunicaComun {
    const basePoder
    method cantidadPoder(mago) {
    return ((mago.resistMagica() * 2) + basePoder)
    }
}

class TunicaEpica inherits TunicaComun
{
  override method cantidadPoder(mago) {
    return super(mago) + 10
    }
}



object amuleto {
  method cantidadPoder(mago) {
    return 200
  }
}

object ojota {
  method cantidadPoder(mago) {
    return 10 * mago.nombre().length()
  }
}