import Paises.*

class Empresa{
	const paisesEstablecidos = #{}
	
	method paisesEstablecidos(){
		return paisesEstablecidos
	}
	
	method esMultinacional(){
		return paisesEstablecidos.asList().size() >= 3
	}
}
