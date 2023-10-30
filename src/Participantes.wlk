import conocimientos.*
import Paises.*
import Cumbre.*

class Participante {
	const pais
	const conocimientos = []
	const cantidadDeCommits
	
	method esCape(){
		return cantidadDeCommits > 500
	}
	
	method pais(){
		return pais
	}
	
	method puedeParticiparEnLaCumbre(){
		return conocimientos.contains(programacionBasica) and self.condicion()
	}
	
	method condicion()
	
	method cumpleConLosRequisitosDeAccesoALaCumbre(){
		return self.puedeParticiparEnLaCumbre()
	}
	
	
}

class Programador inherits Participante{
	
	override method condicion(){
		return cantidadDeCommits >= cumbre.cantidadDeCommitsDeLaCumbre()
	}
}

class Especialista inherits Participante{
	
	override method esCape(){
		return conocimientos.size() > 2
	}
	
	override method condicion(){
		return cantidadDeCommits >= cumbre.cantidadDeCommitsDeLaCumbre() - 100 and conocimientos.contains(objetos)
	}
}

