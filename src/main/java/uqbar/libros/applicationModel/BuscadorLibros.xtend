package uqbar.libros.applicationModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import uqbar.libros.domain.Biblioteca
import uqbar.libros.domain.Libro

@Accessors
class BuscadorLibros {

	String textoBusqueda = ""
	List<Libro> resultados = null
	Integer posicionLibroActual = null

	def void buscar(String textoBusqueda) {
		this.textoBusqueda = textoBusqueda
		this.resultados = Biblioteca.getInstance().buscar(this.textoBusqueda)
		this.posicionLibroActual = null
	}

	def void elegirLibro(int posicion) {
		this.posicionLibroActual = posicion
	}

	// ********************************************************
	// ** Habilitar o deshabilitar botones
	// ********************************************************
	def boolean isPuedeAnterior() {
		this.posicionLibroActual > 0
	}

	def boolean isPuedeSiguiente() {
		this.posicionLibroActual + 1 < this.resultados.size
	}

	// ********************************************************
	// ** Accessors
	// ********************************************************
	def Libro getLibroActual() {
		this.resultados.get(this.posicionLibroActual)
	}

}
