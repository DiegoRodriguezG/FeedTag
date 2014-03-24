# -*- encoding : utf-8 -*-
class PublicController < ApplicationController
  def index
  	@productos = Producto.find(:all).sample(10)
  end
end
