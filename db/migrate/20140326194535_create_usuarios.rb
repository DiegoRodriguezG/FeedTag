class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :oauth_token
      t.string :oauth_secret
    end
  end
end
