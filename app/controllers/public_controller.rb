class PublicController < ApplicationController
  def index
  	@productos = Producto.last 5
  end
end
