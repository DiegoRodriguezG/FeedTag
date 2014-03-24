class AddnombreClavetoMarcas < ActiveRecord::Migration
  def change
  	add_column :categoria, :nombre_clave, :string
  end
end
