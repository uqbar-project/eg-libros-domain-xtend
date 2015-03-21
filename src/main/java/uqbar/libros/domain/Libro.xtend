package uqbar.libros.domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException

@Accessors
class Libro {
	String titulo
	String autor
	String editorial
	Integer anioPublicacion
	int id
	
	static final Integer MIN_ANIO_PUBLICACION = 1500

	new() {
		super()	
	}
	
	new(int id, String titulo, String autor) {
		this.id = id
		this.titulo = titulo
		this.autor = autor
	}

	def void validar() {
		if (autor == null) {
			throw new UserException("Debe ingresar autor")
		}
		if (titulo == null) {
			throw new UserException("Debe ingresar título")
		}
		if (anioPublicacion != null && anioPublicacion < MIN_ANIO_PUBLICACION) {
			throw new UserException("El año de publicación debe ser posterior a " + MIN_ANIO_PUBLICACION)
		}
	}
}