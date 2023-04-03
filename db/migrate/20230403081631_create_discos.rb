class CreateDiscos < ActiveRecord::Migration[7.0]
  def change
    create_table :discos do |t|
      t.string :nombre, null: false
      t.references :artista, null: false, foreign_key: true
      t.text :descripcion
      t.string :genero, null: false
      t.decimal :precio, null: false, precision: 5, scale: 2

      t.timestamps
    end
  end
end
