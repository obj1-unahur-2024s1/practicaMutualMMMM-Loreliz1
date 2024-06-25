import Mutual.*

class Socios{
	const actividades = []
	var property maxActividades 
	
	method adoradorDelSol() = actividades.all({ a => a.sirveParaBroncearse()})
	method actividadesEsforzadas() = actividades.forEach({a => a.implicaEsfuerzo() })
	method agregarActividad(unaActividad) {
		if(actividades == maxActividades){ self.error("Lllegó al maximo de actividades")}
		actividades.add(unaActividad)
		}
}