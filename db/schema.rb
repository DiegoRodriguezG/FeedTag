# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140327014841) do

  create_table "categoria", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
    t.string   "nombre_clave"
  end

  create_table "productos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "categoria_id"
    t.string   "nombre"
    t.string   "nombre_clave"
    t.string   "descripcion"
    t.string   "caloria"
    t.string   "grasa"
    t.string   "carbohidrato"
    t.string   "proteina"
    t.string   "porcion"
  end

  create_table "usuarios", force: true do |t|
    t.string "nombre"
    t.string "oauth_token"
    t.string "oauth_secret"
    t.string "uid"
    t.string "providers"
    t.string "imagen_perfil"
  end

end
