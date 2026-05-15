object knightRider {
    method peso() = 800
    method peligrosidad() = 10
}

object bumblebee {
    var estadoActual = auto
    
    method peso() = 800 
    method peligrosidad() = estadoActual.peligrosidad()
    method cambiarEstado(estado) {
        estadoActual = estado
    }
}

object auto {
    method peligrosidad() = 15
}

object robot {
    method peligrosidad() = 30
}

object paqueteDeLadrillos {
    var cantidadLadrillos = 1

    method peso() = ladrillo.peso() * cantidadLadrillos
    method peligrosidad() = 2
    method añadirLadrillos(cantidad){
        cantidadLadrillos = cantidadLadrillos + cantidad
    }
}

object ladrillo {
    method peso() = 2
}

object arenaAGranel {
    var pesoActual = 3

    method peso() = pesoActual
    method peligrosidad() = 1
    method agregarMásArena(peso){
        pesoActual += peso
    }
}

object bateríaAntiaérea {
    var tieneMisiles = false 

    method tieneMisiles() = tieneMisiles
    method añadirMisiles(){
        tieneMisiles = true
    }

    method sacarMisiles(){
        tieneMisiles = false
    }

    method peso(){
        if (self.tieneMisiles() == true){
            return 300
        } else {
            return 200
        }
    }

    method peligrosidad(){
        if (self.tieneMisiles() == true){
            return 100
        } else {
            return 0
        }
    }
}



