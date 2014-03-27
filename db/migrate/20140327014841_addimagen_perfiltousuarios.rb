class AddimagenPerfiltousuarios < ActiveRecord::Migration
  def change
  	add_column :usuarios, :imagen_perfil, :string
  end
end
