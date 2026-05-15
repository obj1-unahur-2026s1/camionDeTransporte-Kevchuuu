
//ACLARACIÓN: nivelDePeligrosidad = peligrosidad()
object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    var estadoActual = auto
    
    method peso() = 800 
    method peligrosidad() = estadoActual.peligrosidad()
    //podria probarse de la forma booleana para cambiar el estado actual
    //method cambiarEstado(){
    //  if (estadoActual == auto){
    //      estadoActual = robot
    //  } else {
    //      estadoActual = auto
    //  }
    //}  

    method cambiarEstado(estado) {
        estadoActual = estado //nivel comunicativo flojo
    }
    
}


//ESTADOS DE BUMBLEBEE
object auto {
    method peligrosidad() = 15
}

object robot {
    method peligrosidad() = 30
}


object paqueteDeLadrillos {
    var cantidadLadrillos = 0

    method peso() = ladrillo.peso() * cantidadLadrillos
    method peligrosidad() = 2
    //method simple para cambiar la cantidad de ladrillos sin tanta abstracción
    // method cambiarCantidadDeLadrillos(cantidadNueva){
    // cantidadLadrillos = cantidadNueva
    // }
    method añadirLadrillos(cantidad){
        cantidadLadrillos = cantidadLadrillos + cantidad
    }
    method quitarLadrillos(cantidad){
        cantidadLadrillos = cantidadLadrillos - cantidad
    }
}

//Se declara un objeto aparte solo para para declarar el peso propio de dicho objeto 
object ladrillo {
    method peso() = 2
}

object arenaAGranel {
    var pesoActual = 0
    //con var property pesoActual = 0 eviso generar accesores [peso() y peso(nuevoPeso)]
    method peso() = pesoActual
    method peligrosidad() = 1
    method agregarArena(pesoSacar){
        pesoActual += pesoSacar
    }
    method sacarArena(pesoSacar){
        pesoActual -= pesoSacar
    }
}

object bateríaAntiaérea {
    var tieneMisiles = false 

    method tieneMisiles() = tieneMisiles
    method alternarCargaDeMisiles() {
        tieneMisiles = !tieneMisiles
    }
    //method añadirMisiles(){
    //    tieneMisiles = true
    //}

    //method sacarMisiles(){
    //    tieneMisiles = false
    //}

    //method peso() = if (self.tieneMisiles) 300 else 200
    method peso(){
        if (self.tieneMisiles()){
            return 300
        } else {
            return 200
        }
    }

    //method peligrosidad() = if (self.tieneMisiles) 100 else 0
    method peligrosidad(){
        if (self.tieneMisiles()){
            return 100
        } else {
            return 0
        }
    }
}

object contenedorPortuario {
    const cosasCargadas = [] //las colecciones son constantes no variables 
    const pesoBase = 100

    method peso() = pesoBase + cosasCargadas.sum({c => c.peso()})
    //method peligrosidad() = cosasCargadas.maxIfEmpty({c => c.peligrosidad()}, 0)
    method peligrosidad() = if (!cosasCargadas.isEmpty()) cosasCargadas.max({c => c.peligrosidad()}) else 0
}

object residuosRadioactivos {
    var peso = 30 // peso sin especifidcar pero variable y puede ser var property

    method peso() = peso
    method peligrosidad() = 200
}

object embalajeDeSeguridad{
    var envuelveA = [] //una sola cosa envuelve

    method envolverNuevaCosa(nuevaCosa){
        envuelveA = nuevaCosa
    }
    method peso() = envuelveA.peso()
    method peligrosidad() = envuelveA.peligrosidad()/2
}


