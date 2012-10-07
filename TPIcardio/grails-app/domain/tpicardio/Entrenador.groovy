package tpicardio

class Entrenador extends Persona implements Serializable{

    String campoLaboral
    static hasMany = [cita:Cita,tip:Tip,ejercicio:Ejercicio,maquina:Maquina]
    
    static constraints = {
    }
    String toString(){
       cedula + "-" + nombre +" "+ apellido
    }
}
