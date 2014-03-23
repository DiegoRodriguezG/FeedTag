class AdddetallestoProductos < ActiveRecord::Migration
  def change
  	add_column :productos, :nombre_clave, :string
  	add_column :productos, :descripcion, :string
  	add_column :productos, :caloria, :string
  	add_column :productos, :grasa, :string
  	add_column :productos, :carbohidrato, :string
  	add_column :productos, :proteina, :string
  end
end
