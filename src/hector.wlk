import wollok.game.*

object hector {
	
	var property position = game.at(5,7)
	
	method image() = "player.png"
	
	method move(nuevaPos) {self.position(nuevaPos) }
	
}
