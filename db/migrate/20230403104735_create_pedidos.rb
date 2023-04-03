class CreatePedidos < ActiveRecord::Migration[7.0]
  def change
    create_table :pedidos do |t|
      t.string :codigo, null: false
      t.string :destino, null: false
      t.decimal :total, null: false, precision: 7, scale: 2
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
