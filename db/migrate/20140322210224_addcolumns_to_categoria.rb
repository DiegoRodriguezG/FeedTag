class AddcolumnsToCategoria < ActiveRecord::Migration
  def change
  	add_column :categoria, :nombre, :string
  end
end
