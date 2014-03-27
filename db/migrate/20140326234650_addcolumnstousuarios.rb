class Addcolumnstousuarios < ActiveRecord::Migration
  def change
  	add_column :usuarios, :uid, :string
  	add_column :usuarios, :providers, :string
  end
end
