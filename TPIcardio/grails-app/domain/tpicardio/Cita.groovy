package tpicardio

class Cita implements Serializable{

    Date fecha    
    static hasMany = [usuario:Usuario]
    static belongsTo = Usuario
    Entrenador entrenador
    
    static constraints = {
        fecha(min: new Date(), max: new Date() + 7)
    }
    
}
