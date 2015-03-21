package uqbar.libros.domain

import java.util.ArrayList
import java.util.Collection
import java.util.List

class Biblioteca {
	static final Biblioteca instance = new Biblioteca()
	
	Collection<Libro> libros = new ArrayList<Libro>
	int id = 0

	new() {
		this.addLibro("Las venas abiertas de América Latina", "Eduardo Galeano")
		this.addLibro("Guerra y Paz", "León Tolstoi")
		this.addLibro("Patas Arriba", "Eduardo Galeano")
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

	def void addLibro(String titulo, String autor) {
		libros.add(new Libro(id, titulo, autor))
		id = id + 1
	}

	def List<Libro> buscar(String titulo) {
		libros.filter [ libro | libro.titulo.contains(titulo) ].toList
	}

	def Libro getLibro(int id) {
		val libro = libros.findFirst [ libro | libro.id == id ]
		if (libro != null) {
			throw new RuntimeException("No tengo ese libro, man. (el del id = " + id + ")")
		}
		libro
	}
	
}