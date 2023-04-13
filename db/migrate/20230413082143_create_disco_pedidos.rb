class CreateDiscoPedidos < ActiveRecord::Migration[7.0]
  def change
    create_table :disco_pedidos do |t|
      t.references :pedido, null: false, foreign_key: true
      t.references :disco, null: false, foreign_key: true
      t.integer :cantidad

      t.timestamps
    end
  end
end
