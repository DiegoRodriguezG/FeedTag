class Producto < ActiveRecord::Base
	belongs_to :categoria

	attr_reader :producto_tokens

	def producto_tokens=(ids)
    self.producto_ids = ids.split(",")
  end

	def self.buscar(params)
		if params
			find(:all, :conditions => ['nombre like ?', "%#{params}%" ])
		else
			find(:all)	
		end
	end
end
