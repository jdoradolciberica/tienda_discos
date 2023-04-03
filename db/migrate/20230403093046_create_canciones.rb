class CreateCanciones < ActiveRecord::Migration[7.0]
  def change
    create_table :canciones do |t|
      t.string :titulo, null: false
      t.references :disco, null: false, foreign_key: true
      t.integer :duracion, null: false

      t.timestamps
    end
  end
end
