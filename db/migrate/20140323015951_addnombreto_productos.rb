class AddnombretoProductos < ActiveRecord::Migration
  def change
  	add_column :productos, :nombre, :string
  end
end
