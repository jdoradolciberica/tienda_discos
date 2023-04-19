class AddPortadaToDiscos < ActiveRecord::Migration[7.0]
  def change
    add_column :discos, :portada, :string
  end
end
