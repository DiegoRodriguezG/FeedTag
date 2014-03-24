class AddporciontoProductos < ActiveRecord::Migration
  def change
  	add_column :productos, :porcion, :string
  end
end
