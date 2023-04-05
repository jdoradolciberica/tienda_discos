class AddFechaLanzamientoToDiscos < ActiveRecord::Migration[7.0]
  def change
    add_column :discos, :fecha_lanzamiento, :date, null: false
  end
end
