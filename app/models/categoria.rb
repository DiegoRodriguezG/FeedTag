class Categoria < ActiveRecord::Base
	has_many :productos, dependent: :destroy
end
