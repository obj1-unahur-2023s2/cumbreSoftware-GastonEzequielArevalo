import Cumbre.*
import Paises.*
import Participantes.*
import conocimientos.*

describe "Test de participantes"{
	const argentina = new Pais(esAuspiciante = true,conflictosConLosPaises = [])
	const brasil = new Pais(esAuspiciante = false,conflictosConLosPaises = [])
	const colombia = new Pais(esAuspiciante = true,conflictosConLosPaises = [])
	const coreaDelSur = new Pais(esAuspiciante = false,conflictosConLosPaises = [])
	const coreaDelNorte = new Pais(esAuspiciante = true,conflictosConLosPaises = [] )
	
	const juana = new Programador(pais = argentina, conocimientos = [programacionBasica,css,html],cantidadDeCommits = 600)
	const lucia = new Programador(pais = brasil, conocimientos = [programacionBasica,basesDeDatos],cantidadDeCommits = 800)
	const mariana = new Especialista(pais = argentina, conocimientos = [programacionBasica,instalacionLinux,objetos,disenioConObjetos],cantidadDeCommits = 200)
	const susana = new Especialista(pais = colombia, conocimientos = [programacionBasica,objetos],cantidadDeCommits = 1500)

	test "Los paises deben ser argentina y brasil"{
		cumbre.registrarIngresoDePersonaALaCumbre(juana)
		cumbre.registrarIngresoDePersonaALaCumbre(lucia)
		cumbre.registrarIngresoDePersonaALaCumbre(mariana)
		cumbre.registrarIngresoDePersonaALaCumbre(susana)
		
		assert.equals(#{argentina,brasil,colombia},cumbre.paisesDeLosParticipantes())
	}
	
	test "El pais con mas participantes debe ser argentina"{
		cumbre.registrarIngresoDePersonaALaCumbre(juana)
		cumbre.registrarIngresoDePersonaALaCumbre(lucia)
		cumbre.registrarIngresoDePersonaALaCumbre(mariana)
		cumbre.registrarIngresoDePersonaALaCumbre(susana)
		
		assert.equals(argentina,cumbre.paisConMasParticipantes())
	}
	
	test "La cumbre debe ser relevante"{
		cumbre.registrarIngresoDePersonaALaCumbre(juana)
		cumbre.registrarIngresoDePersonaALaCumbre(lucia)
		cumbre.registrarIngresoDePersonaALaCumbre(mariana)
		cumbre.registrarIngresoDePersonaALaCumbre(susana)
		
		assert.notThat(cumbre.esRelevante())
	}
	
	test "Corea del sur es conflictivo para la cumbre"{
		
		cumbre.agregarPaisALaCumbre(coreaDelNorte)
		coreaDelNorte.registraConflicto(coreaDelSur)
		coreaDelSur.registraConflicto(coreaDelNorte)
		
		assert.that(cumbre.esConflictivoParaLaCumbre(coreaDelSur))
	}
	
	test "La participante extrajera debe ser lucia"{
		cumbre.registrarIngresoDePersonaALaCumbre(juana)
		cumbre.registrarIngresoDePersonaALaCumbre(lucia)
		cumbre.registrarIngresoDePersonaALaCumbre(mariana)
		cumbre.registrarIngresoDePersonaALaCumbre(susana)
		
		assert.equals(#{lucia},cumbre.participantesExtranjeros())
	}
	
	
}