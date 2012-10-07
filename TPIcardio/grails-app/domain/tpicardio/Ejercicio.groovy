package tpicardio

class Ejercicio implements Serializable{

    String nombre
    String descripcion
    Entrenador entrenador
    
    static constraints = {
		nombre(maxSize:50, blank:false)
		descripcion(maxSize:1000, blank:false)
		entrenador(blank:false)
    }
}
