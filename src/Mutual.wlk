class Actividad{
	const property idiomas = #{}
	
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method diasDeDuracion()
	method esInteresante(){ return idiomas.size() > 1}
	method esRecomendada(socio){
		return
		socio.leAtraeAlSocio(self) and
		self.esInteresante() and
		not socio.realizoLaActividad(self)
	}
}

class ViajePlaya inherits Actividad{
	const property largoPlaya 
	override method diasDeDuracion() = largoPlaya / 500
	override method implicaEsfuerzo() = largoPlaya > 1200
	override method sirveParaBroncearse() = true
}

class ExcursionACuidad inherits Actividad {
	var property  cantAtracciones 
	
	override method diasDeDuracion() = cantAtracciones / 2
	override method implicaEsfuerzo() = cantAtracciones.between(5, 8)
	override method sirveParaBroncearse() = false
	override method esInteresante(){
		return
		super()  or cantAtracciones==5
	}
}

class ExcursionTropical inherits ExcursionACuidad{
	override method diasDeDuracion() = super() + 1
	override method sirveParaBroncearse() = true
	
}

class SalidaDeTrekking inherits Actividad{
	var property cantkmSenderos 
	const property diasDeSolAnio 

	override method diasDeDuracion() = cantkmSenderos / 50
	override method implicaEsfuerzo() = cantkmSenderos > 80
	override method sirveParaBroncearse() = 
	diasDeSolAnio >= 200 or 
	(diasDeSolAnio.between(100, 200) and cantkmSenderos > 120)	
	override method esInteresante(){
		return
		super()  or diasDeSolAnio > 140
	}
}

class ClaseDeGimnasia inherits Actividad{
	method initialize() {
		if(idiomas!=#{"español"}) {
			self.error("solo se permite clase de gimnasia en español")
		}
	}	
	override method idiomas() = "Español"
	override method diasDeDuracion() = 1
	override method implicaEsfuerzo() = true
	override method sirveParaBroncearse() = false
	override method esRecomendada(socio) = socio.edad().between(20, 30)
}

class TallerLiterario inherits Actividad{
	var libros = #{}

	override method idiomas() = libros.map({l => l.idioma()}).asSet()
	override method diasDeDuracion() = libros.size()+1
	
	method tieneLibrosConMasDe500Pag() = libros.any({ l => l.cantPaginas()>500})
	method autoresDeLibros() = libros.map({ l => l.nombreDelAutor()}).asSet()
	method todosLosLibrosSonDelMismoAutor() = self.autoresDeLibros().size() == 1
	method hayMasDeUnLibro() = libros.size() > 1
	
	override method implicaEsfuerzo() = 
	self.tieneLibrosConMasDe500Pag() or
	(self.todosLosLibrosSonDelMismoAutor() and self.hayMasDeUnLibro())
	override method sirveParaBroncearse() = false
	override method esRecomendada(socio) = socio.cantidadIdiomas()>1
}

class Libro{
	const property idioma
    const property cantPaginas
    const property nombreDelAutor
}