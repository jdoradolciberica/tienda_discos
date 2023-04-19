class AddImagenToArtistas < ActiveRecord::Migration[7.0]
  def change
    add_column :artistas, :imagen, :string
  end
end
