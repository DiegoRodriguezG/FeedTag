class PublicController < ApplicationController
  def index
  	@categorias = Categoria.all
  end
end
