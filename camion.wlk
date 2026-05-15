import cosas.*
object camion {
    //Se pide que se le pueda cargar y descargar cosas (de 1 a vez) y también cual es el peso total del camión, incluyendo su tara que es de 1000 kg.
    const tara = 1000
    const cosas = []

    method pesoTotal(){
        return tara + cosas.sum({c => c.peso()})
    }

    method cargar(cosa){
        cosas.add(cosa)
    }

    method descargar(cosa){
        cosas.remove(cosa) //la cosa debe existir en la colección de cosas de lo contrario "rompería"
    }

    // También se necesita conocer si los pesos de todas las cosas cargadas en el camión son números pares.
    method todosLosPesosDeLasCosasCargadasSonNúmerosPares(){
        return cosas.all({c => c.peso().even()})
    }

    //Debemos poder consultar si hay alguna cosa que pesa un determinado valor.
    method hayAlgunaCosaQuePesa(cantidad){
        return cosas.any({c => c.peso() == cantidad})
    }

    // Para un mejor control del tipo de peligro que puede representar la carga, se debe poder obtener la primer cosa cargada que tenga un determinado nivel de peligrosidad
    method laPrimerCosaCargadaConNivelDePeligrosidad(nivel){
        return cosas.findOrDefault({c => c.peligrosidad() == nivel})
    }

    //Obtener todas las cosas que superan un determinado nivel de peligrosidad.
    method cosasQueSuperanUnNivelDePeligrosidad(nivel){
        return cosas.filter({c => c.peligrosidad() > nivel})
    }

    //Para facilitar los controles, también nos piden que se pueda consultar la lista de cosas que superan el nivel de peligrosidad de una cosa dada.
    method cosasQueSuperanElNivelDePeligrosidadDeLaCosa(cosa){
        return cosas.filter({c => c.peligrosidad() > cosa.peligrosidad()})
    }

    //Conocer si el camión está excedido del peso máximo permitido,que es de 2500 kg.
    method estáExcediendoElPesoMáximoPermitido(){
        return self.pesoTotal() > 2500
    }

    //Saber si el camión puede circular en ruta. Eso depende de que no exceda el peso máximo permitido y ninguno de los 
    //objetos cargados supere un nivel máximo de peligrosidad que depende del viaje, por eso para este caso el valor del nivel se pasará como argumento.
    method puedeCircularEnRuta(nivelDePeligrosidad){
        return !self.estáExcediendoElPesoMáximoPermitido() && cosas.any({c => c.peligrosidad() > nivelDePeligrosidad})
    }
}