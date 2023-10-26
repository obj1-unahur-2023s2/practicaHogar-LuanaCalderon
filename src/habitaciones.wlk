import casa.*
import familias.*
import personas.*

class Habitacion {
	const ocupantes = []
	
	method nivelDeConfort(unaPersona) = 10 + unaPersona.confortExtra(self)
	method confortExtra(unaPersona) 
	method esHabitacionVacia() = ocupantes.size() == 0
	method puedeEntrar(unaPersona)
	
	
}

class Banio inherits Habitacion {
	override method confortExtra(unaPersona) = if (unaPersona.edad()<= 4) 2 else 4
	
	override method puedeEntrar(unaPersona) =  self.esHabitacionVacia() and unaPersona.edad() <= 4 

}

class Dormitorio inherits Habitacion {
 const personasOcupantesQueDuermen = []  
 
 override method confortExtra(unaPersona) = 
  if(self.personaOcupanteQueDuerme(unaPersona)) 10 /  self.cantidadDePersonasQueDuermen()
  else 0
 
 method personaOcupanteQueDuerme(unaPersona) = personasOcupantesQueDuermen.contains(unaPersona)
 
 method cantidadDePersonasQueDuermen() = personasOcupantesQueDuermen.size()
 
 override method puedeEntrar(unaPersona) =  
 self.esHabitacionVacia() and 
 (self.personaOcupanteQueDuerme(unaPersona) or ocupantes.all({ocupante => self.personaOcupanteQueDuerme(ocupante)}))


 }


class Cocina inherits Habitacion {
  var metrosCuadrados
  
  override method confortExtra(unaPersona) = 
  if(unaPersona.tieneHabilidadesDeCocina()) metrosCuadrados*porcentaje.unidad()/100
  else 0
  
  override method puedeEntrar(unaPersona) = 
  self.esHabitacionVacia() and (!unaPersona.tieneHabilidadesDeCocina() or self.hayOcupanteQueCocina())
 
  method hayOcupanteQueCocina() =  ocupantes.any({o => o.tieneHabilidadesDeCocina()})	
	
	
	
}

object porcentaje {
	method unidad() =  10 
}


