import conocimientos.*
import Paises.*
import Cumbre.*
import Actividades.*

class Participante {
	const pais
	const conocimientos = []
	var cantidadDeCommits
	
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
	
	method hacerUnaActividad(unaActividad){
		conocimientos.add(unaActividad)
		cantidadDeCommits += unaActividad.tema().commitsPorHora() * unaActividad.cantidadDeHoras()
	}
	
}

class Programador inherits Participante{
	var horasDeCapacitacion = 0
	
	override method condicion(){
		return cantidadDeCommits >= cumbre.cantidadDeCommitsDeLaCumbre()
	}
	
	override method hacerUnaActividad(unaActividad){
		super(unaActividad)
		horasDeCapacitacion += unaActividad.cantidadDeHoras()
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

class Gerente inherits Participante{
	const empresaEnLaQueTrabaja
	
	override method esCape(){
		return empresaEnLaQueTrabaja.esMultinacional()
	}
	
	override method condicion(){
		return conocimientos.contains(manejoDeGrupos)
	}
}
