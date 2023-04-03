class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :nombre, null: false
      
      t.timestamps
    end
    add_index :clientes, :email, unique: true
  end
end
