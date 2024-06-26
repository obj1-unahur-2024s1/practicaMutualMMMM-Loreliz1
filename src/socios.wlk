import Mutual.*

class Socios{
	const actividades = []
	var property maxActividades 
	var property edad
	const property idiomas = #{}
	
	method esAdoradorDelSol() = actividades.all({ a => a.sirveParaBroncearse()})
	method actividadesEsforzadas() = actividades.filter({a => a.implicaEsfuerzo() })
	method agregarActividad(unaActividad) {
		if(actividades.size() == maxActividades){
		self.error("Llegó al maximo de actividades")
		}
		actividades.add(unaActividad)
		}
	method leAtraeAlSocio(unaActividad)	
	method realizoLaActividad(unaActividad) = actividades.contains(unaActividad)
	method cantidadIdiomas() = idiomas.size()
}

class SocioTranquilo inherits Socios{
	override method leAtraeAlSocio(unaActividad) = 	unaActividad.diasDeDuracion() >= 4
}

class SocioCoherente inherits Socios{
	override method leAtraeAlSocio(unaActividad) = 	
	if (self.esAdoradorDelSol()) unaActividad.sirveParaBroncearse() 
	else
	unaActividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socios{
	override method leAtraeAlSocio(unaActividad) = 	not idiomas.intersection(unaActividad.idiomas().isEmpty())
	
}
