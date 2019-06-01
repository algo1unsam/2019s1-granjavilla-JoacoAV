import wollok.game.*
import plantas.*

object hector {

	var property position = game.at(5, 7)
	
	var plantasParaVender = #{}
	
	var property dinero = 0
	
	
	method almacenarPlanta(planta) { plantasParaVender.add(planta) }

	method image() = "player.png"

	method move(nuevaPos) { self.position(nuevaPos) }

	method sembrar(planta) {
		if (game.colliders(self).isEmpty()) {
			game.addVisualIn(planta, self.position())
		} else {
			self.error("No puedo plantar aquí.")
		}
	}

	method regar(planta) {
		if (planta.isEmpty()) {
			self.error("No hay nada que regar aquí.")
		}
		planta.forEach{ unaPlanta => unaPlanta.esRegada()}
	}
	
	method cosechar(planta) {
		if (planta.isEmpty()) {
			self.error("No hay nada que cosechar aquí.")
		}
		planta.forEach{ unaPlanta => unaPlanta.esCosechada() }
	}
	
	method vender() {
		dinero =+ plantasParaVender.sum{ unaPlanta => unaPlanta.valor() }
		plantasParaVender.clear()
	}
	
	method cantidadDePlantas() = plantasParaVender.size()
	
	method futuraVenta(){
		game.say(self, "Tengo " + dinero + " monedas y " + self.cantidadDePlantas() + " plantas para vender.")
	}
}

