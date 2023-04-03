class CreateArtistas < ActiveRecord::Migration[7.0]
  def change
    create_table :artistas do |t|
      t.string :nombre, null: false
      t.date :fecha_nacimiento, null: false
      t.string :procedencia, null: false

      t.timestamps
    end
  end
end
