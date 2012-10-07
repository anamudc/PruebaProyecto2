package tpicardio

class Entrenador extends Persona implements Serializable{

    
    static constraints = {
    }
    String toString(){
       cedula + "-" + nombre +" "+ apellido
    }
}