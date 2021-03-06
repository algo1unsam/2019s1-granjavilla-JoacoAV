import wollok.game.*
import hector.*

class Planta {
	
	var property position
	
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
	
	method valor() = 150

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
	
	method valor() = (stage - 1)*100
	
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
	
	method valor() = 80 

	method image() = imagen


	method esRegada() {
		self.position(self.position().up(1))
		if (self.fueraDelTablero()) {
			self.position(self.position().down(game.height()))
		}
	}
	
	method fueraDelTablero() = self.position().y() > game.height() - 1 
	
	override method puedeCosecharse() = true
	

}