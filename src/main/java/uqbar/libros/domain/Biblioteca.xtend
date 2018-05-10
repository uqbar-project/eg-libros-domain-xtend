package uqbar.libros.domain

import java.util.ArrayList
import java.util.Collection
import java.util.List

class Biblioteca {
	static final Biblioteca instance = new Biblioteca()
	
	Collection<Libro> libros = new ArrayList<Libro>
	int id = 0

	new() {
		this.addLibro("Las venas abiertas de América Latina", "Eduardo Galeano", 1971)
		this.addLibro("Guerra y Paz", "León Tolstoi", 1867)
		this.addLibro("Patas Arriba", "Eduardo Galeano", 1998)
		this.addLibro("El fútbol a sol y a sombra", "Eduardo Galeano")
		this.addLibro("Historia del siglo XX", "Eric Hobsbawm")
		this.addLibro("Ficciones", "Jorge Luis Borges")
		this.addLibro("El Aleph", "Jorge Luis Borges")
		this.addLibro("La invención de Morel", "Adolfo Bioy Casares")
		this.addLibro("Rayuela", "Julio Cortázar")
		this.addLibro("El barón rampante", "Italo Calvino")
		this.addLibro("El vizconde demediado", "Italo Calvino")
		this.addLibro("100 años de soledad", "Gabriel García Márquez")
		this.addLibro("Un día en la vida de Ivan Denisovich", "Alexander Solyenitsin")
		this.addLibro("El día del arquero", "Juan Sasturain")
	}

	def static Biblioteca getInstance() {
		return instance
	}

	def void addLibro(String titulo, String autor, Integer anio) {
		addLibro(new Libro(id, titulo, autor) => [anioPublicacion = anio])
	}

	def void addLibro(String titulo, String autor) {
		addLibro(new Libro(id, titulo, autor))
	}

	def void addLibro(Libro libro) {
		libros.add(libro)
		id = id + 1
	}
	
	def void eliminarLibro(Libro libro) {
		libros.remove(libro)
	}
	
	def List<Libro> buscar(String titulo) {
		libros.filter [ libro | libro.titulo.contains(titulo) ].toList
	}

	def Libro getLibro(int id) {
		val libro = libros.findFirst [ 
			it.id == id
		]
		if (libro === null) {
			throw new RuntimeException("No tengo ese libro, man. (el del id = " + id + ")")
		}
		libro
	}
	def todos() {
		libros.clone
	}

	def actualizarLibro(Libro actualizado) {
		var Libro libro = getLibro(actualizado.id)
		libro.titulo = actualizado.titulo
		libro.autor = actualizado.autor
		libro.editorial  = actualizado.editorial
		libro.anioPublicacion  = actualizado.anioPublicacion
	}
}