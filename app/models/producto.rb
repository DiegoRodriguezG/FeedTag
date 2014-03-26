class Producto < ActiveRecord::Base
	belongs_to :categoria

	def self.buscar(params)

		if params
			find(:all, :conditions => ['nombre like ?', "%#{params}%" ])
		else
			find(:all)	
		end
	end
end
