package tpicardio

class Prueba implements Serializable{

    static belongsTo = Usuario
    double porcentajeGrasa
    double altura
    double peso
    double imc
    int carga
    String descripcion
    String obsevacion
    String grupo
    
    static constraints = {
    }
}
