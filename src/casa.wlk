import habitaciones.*
import familias.*

object casa {
  var habitaciones = []
  
  
    method agregarHabitacion(unaHabitacion) = habitaciones.add(unaHabitacion)
    method sacarHabitacion(unaHabitacion) = habitaciones.remove(unaHabitacion)
    method habitacionesOcupadas() = habitaciones.find({h=>!h.esHabitacionVacia()})
    
   
    	
    
    
 }
 
 