package tpicardio

class Usuario extends Persona implements Serializable{
    
    int edad
    double peso
    double altura
    double imc
    static hasMany = [cita:Cita,prueba:Prueba]
    
    
    static constraints = {
        edad(size:15..100,blank:false)
        peso(blank:false)
        altura(blank:false)
        imc(blank:false)
    }
    
}
