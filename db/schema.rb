# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_19_091958) do
  create_table "administradors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "user"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artistas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre", null: false
    t.date "fecha_nacimiento", null: false
    t.string "procedencia", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "canciones", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "titulo", null: false
    t.bigint "disco_id", null: false
    t.integer "duracion", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disco_id"], name: "index_canciones_on_disco_id"
  end

  create_table "clientes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "nombre", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clientes_on_email", unique: true
  end

  create_table "disco_pedidos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "pedido_id", null: false
    t.bigint "disco_id", null: false
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disco_id"], name: "index_disco_pedidos_on_disco_id"
    t.index ["pedido_id"], name: "index_disco_pedidos_on_pedido_id"
  end

  create_table "discos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre", null: false
    t.bigint "artista_id", null: false
    t.text "descripcion"
    t.string "genero", null: false
    t.decimal "precio", precision: 5, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fecha_lanzamiento", null: false
    t.string "portada"
    t.index ["artista_id"], name: "index_discos_on_artista_id"
  end

  create_table "pedidos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "codigo", null: false
    t.string "destino", null: false
    t.bigint "cliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
  end

  add_foreign_key "canciones", "discos"
  add_foreign_key "disco_pedidos", "discos"
  add_foreign_key "disco_pedidos", "pedidos"
  add_foreign_key "discos", "artistas"
  add_foreign_key "pedidos", "clientes"
end
