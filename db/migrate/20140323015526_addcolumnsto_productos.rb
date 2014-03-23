class AddcolumnstoProductos < ActiveRecord::Migration
  def change
  	add_column :productos, :categoria_id, :integer
  end
end
