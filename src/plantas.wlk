import wollok.game.*
import hector.*

class Planta {
	
	method puedeCosecharse()
	
	method esCosechada() {
		if (self.puedeCosecharse()){
			hector.almacenarPlanta(self)
			game.removeVisual(self)
		} else {
			self.error("Esta planta aún no puede cosecharse.")
		}
	}
	
}

class Maiz inherits Planta{

	const stage1 = "corn_baby.png"
	const stage2 = "corn_adult.png"
	var imagen = stage1
	const property valor = 150	
	

	method image() = imagen
	
	method esAdulto() = imagen == stage2
	
	method esRegada() {
		if (not self.esAdulto()) {
			imagen = stage2
		}
	}
	
	override method puedeCosecharse() = self.esAdulto() 

}

class Trigo inherits Planta{

	const imagen1 = "wheat_"
	const imagen2 = ".png"
	var property stage = 0
	var property valor = (stage - 1)*100
	
	method image() = imagen1 + stage + imagen2

	method esRegada() {
		if (stage == 3) {
			stage = 0
		} else {
			stage++
		}
	}
	
	override method puedeCosecharse() = stage >= 2 
		
	
}

class Tomaco inherits Planta{

	var property imagen = "tomaco.png"
	var property position = hector.position()
	const property valor = 80 

	method image() = imagen

	method move(nuevaPos) {
		self.position(nuevaPos)
	}

	method esRegada() {
		self.move(position.up(1))
	}
	
	override method puedeCosecharse() = true
	

}