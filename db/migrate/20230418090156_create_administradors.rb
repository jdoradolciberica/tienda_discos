class CreateAdministradors < ActiveRecord::Migration[7.0]
  def change
    create_table :administradors do |t|
      t.string :user
      t.string :password_digest

      t.timestamps
    end
  end
end
