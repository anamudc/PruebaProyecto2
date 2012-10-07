package tpicardio

class Maquina implements Serializable{
	String tipo
	String marca
	String modelo
	String observacion
	int numero
	long placaReferencia
	byte[] imagen
	Entrenador entrenador

	static constraints = {
		imagen maxSize:20000000
	}
	static mapping = {
		table 'imagenes'
	}
}
    