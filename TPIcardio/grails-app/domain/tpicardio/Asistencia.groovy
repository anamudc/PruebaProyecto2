package tpicardio

class Asistencia implements Serializable{

    Date fecha;
    Usuario usuario;
    
    static constraints = {
		fecha(max: new Date(),blank:false)
		usuario(blank:false)
    }
}
