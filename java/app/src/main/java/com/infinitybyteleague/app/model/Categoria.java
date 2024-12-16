package com.infinitybyteleague.app.model;

import jakarta.persistence.*;

import java.util.List;
import java.util.Objects;



@Entity
@Table(name = "categoria")
public class Categoria {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_categoria")
    private int idCategoria;

    @Column(name = "nombre", length = 45, nullable = false)
    private String nombre;

    @Column(name = "descripcion", length = 200, nullable = false)
    private String descripcion;

    @OneToMany(mappedBy = "categoria")
    private List<Producto> productos;

    public Categoria() {
    	
    }

	public Categoria(int idCategoria, String nombre, String descripcion, List<Producto> productos) {
		super();
		this.idCategoria = idCategoria;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.productos = productos;
	}

	public int getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<Producto> getProductos() {
		return productos;
	}

	public void setProductos(List<Producto> productos) {
		this.productos = productos;
	}

	@Override
	public int hashCode() {
		return Objects.hash(descripcion, idCategoria, nombre, productos);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Categoria other = (Categoria) obj;
		return Objects.equals(descripcion, other.descripcion) && idCategoria == other.idCategoria
				&& Objects.equals(nombre, other.nombre) && Objects.equals(productos, other.productos);
	}

	@Override
	public String toString() {
		return "Categoria [idCategoria=" + idCategoria + ", nombre=" + nombre + ", descripcion=" + descripcion
				+ ", productos=" + productos + "]";
	}
    
   
}

