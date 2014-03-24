# -*- encoding : utf-8 -*-
class PublicController < ApplicationController
  def index
  	@categorias = Categoria.find(:all).sample(10)
  	@productos = Producto.find(:all).sample(10)
  end

  def ver_categoria
  	nombre_clave = params[:nombre_clave]
  	@categoria = Categoria.find_by_nombre_clave nombre_clave
  	@categoria_productos = @categoria.productos
  end

  def ver_producto
  	nombre_clave = params[:nombre_clave]
  	@producto = Producto.find_by_nombre_clave nombre_clave
  end
end
