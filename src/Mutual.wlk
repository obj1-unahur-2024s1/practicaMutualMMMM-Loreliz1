class Actividad{
	const property idiomas = []
	method agregarIdioma(idioma) = idioma.add(idiomas)
	method idioma(){ return idiomas}
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method diasDeDuracion()
	method esInteresante(){ return idiomas.size() >= 2}
}

class ViajePlaya inherits Actividad{
	const largoPlaya = 0
	method largoPlaya () = largoPlaya
	method largoPlaya(mts) = largoPlaya * mts
	override method diasDeDuracion() = largoPlaya / 500
	override method implicaEsfuerzo() = largoPlaya > 1200
	override method sirveParaBroncearse() = true
}

class ExcursionACuidad inherits Actividad {
	const atracciones = 0
	method atracciones () = atracciones
	method atracciones(cantidad) = atracciones * cantidad
	override method diasDeDuracion() = atracciones / 2
	override method implicaEsfuerzo() = atracciones.between(5, 8)
	override method sirveParaBroncearse() = false
	override method esInteresante(){
		return
		super()  or atracciones==5
	}
}

class ExcursionACuidadTropical inherits ExcursionACuidad{
	override method diasDeDuracion() = super() + 1
	override method sirveParaBroncearse() = true
	
}

class SalidaDeTrekking inherits Actividad{
	const kmSenderos = 0
	const diasDeSol = 0
	method kmSenderos () = kmSenderos
	method kmSenderos(mts) = kmSenderos * mts
	override method diasDeDuracion() = kmSenderos / 50
	override method implicaEsfuerzo() = kmSenderos > 80
	override method sirveParaBroncearse() = 
	diasDeSol >= 200 or 
	(diasDeSol.between(100, 200) and kmSenderos > 120)	
	override method esInteresante(){
		return
		super()  or diasDeSol > 140
	}
}

class ClaseDeGimnasia inherits Actividad{
	override method idioma() = "Espaniol"
	override method diasDeDuracion() = 1
	override method implicaEsfuerzo() = true
	override method sirveParaBroncearse() = false
}