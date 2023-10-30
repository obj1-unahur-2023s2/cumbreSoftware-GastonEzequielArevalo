import Paises.*
import Participantes.*

object cumbre {
	const paisesParticipantesDeLaCumbre = []
	const personasParticipantesDeLaCumbre = []
	var property cantidadDeCommitsDeLaCumbre = 300
	
	method registrarIngresoDePersonaALaCumbre(unParticipante){
		personasParticipantesDeLaCumbre.add(unParticipante)
		paisesParticipantesDeLaCumbre.add(unParticipante.pais())
	}
	
	method esConflictivoParaLaCumbre(unPais){
		return paisesParticipantesDeLaCumbre.any({p => p.conflictosConLosPaises().contains(unPais)})
	}
	
	method paisesDeLosParticipantes(){
		return personasParticipantesDeLaCumbre.map({p => p.pais()}).asSet()
	}
	
	method cantidadDeParticipantesDelPais(unPais){
		return personasParticipantesDeLaCumbre.count({p => p.pais() == unPais})
	}
	
	method paisConMasParticipantes(){
		return paisesParticipantesDeLaCumbre.max({p => self.cantidadDeParticipantesDelPais(p)})
	}
	
	method participantesExtranjeros(){
		return personasParticipantesDeLaCumbre.filter({p => not p.pais().esAuspiciante()}).asSet()
	}
	
	method esRelevante(){
		return personasParticipantesDeLaCumbre.all({p => p.esCape()})
	}
	
	method agregarPaisALaCumbre(unPais){
		paisesParticipantesDeLaCumbre.add(unPais)
	}
	
	method cantidadDeCommitsDeLaCumbre(){
		return cantidadDeCommitsDeLaCumbre
	}
	
	method participantePuedeIngresarALaCumbre(unaParticipante){
		return self.esConflictivoParaLaCumbre(unaParticipante.pais()) and self.participantesExtranjeros().asList().size() < 2
	}
	
	method tieneRestringidoElAcceso(unaParticipante){
		return not self.participantePuedeIngresarALaCumbre(unaParticipante)
	}
	
	method puedeIngresar(unParticipante){
		return unParticipante.puedeParticiparEnLaCumbre() and self.tieneRestringidoElAcceso(unParticipante)
	}
	
	method ingresarUnParticipante(unParticipante){
		if(self.puedeIngresar(unParticipante)){
			self.registrarIngresoDePersonaALaCumbre(unParticipante)
		}
		else{
			self.error("El participante no puede ingresar")
		}
	}
	
	method esSegura(){
		return personasParticipantesDeLaCumbre.all({p => self.puedeIngresar(p)})
	}
	
	
}
