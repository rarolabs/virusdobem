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

ActiveRecord::Schema.define(version: 20151107144858) do

  create_table "buscas", force: :cascade do |t|
    t.string   "palavra",        limit: 255
    t.integer  "quantidade",     limit: 4
    t.datetime "ultima_busca"
    t.datetime "primeira_busca"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "longitude",      limit: 24
    t.float    "latitude",       limit: 24
    t.integer  "categoria_id",   limit: 4
  end

  add_index "buscas", ["categoria_id"], name: "index_buscas_on_categoria_id", using: :btree

  create_table "categorias", force: :cascade do |t|
    t.string   "descricao",  limit: 255
    t.integer  "parent_id",  limit: 4
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "color",      limit: 255
  end

  add_index "categorias", ["parent_id"], name: "index_categorias_on_parent_id", using: :btree

  create_table "categorias_instituicoes", id: false, force: :cascade do |t|
    t.integer "categoria_id",   limit: 4
    t.integer "instituicao_id", limit: 4
  end

  add_index "categorias_instituicoes", ["categoria_id"], name: "index_categorias_instituicoes_on_categoria_id", using: :btree
  add_index "categorias_instituicoes", ["instituicao_id"], name: "index_categorias_instituicoes_on_instituicao_id", using: :btree

  create_table "cidades", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.integer  "estado_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "contatos", force: :cascade do |t|
    t.string   "nome",           limit: 255
    t.string   "email",          limit: 255
    t.string   "telefone",       limit: 255
    t.string   "celular",        limit: 255
    t.integer  "instituicao_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "contatos", ["instituicao_id"], name: "index_contatos_on_instituicao_id", using: :btree

  create_table "dispositivos", force: :cascade do |t|
    t.string   "gcm",                  limit: 255
    t.integer  "numero_busca",         limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "quero_ser_voluntario", limit: 1
    t.integer  "doacoes",              limit: 4
  end

  create_table "enderecos", force: :cascade do |t|
    t.string   "cep",         limit: 255
    t.string   "logradouro",  limit: 255
    t.string   "complemento", limit: 255
    t.string   "numero",      limit: 255
    t.string   "bairro",      limit: 255
    t.integer  "cidade_id",   limit: 4
    t.integer  "usuario_id",  limit: 4
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.boolean  "gmaps",       limit: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "enderecos", ["cidade_id"], name: "index_enderecos_on_cidade_id", using: :btree
  add_index "enderecos", ["usuario_id"], name: "index_enderecos_on_usuario_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "sigla",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "instituicoes", force: :cascade do |t|
    t.string   "nome",                        limit: 255
    t.text     "descricao",                   limit: 65535
    t.integer  "endereco_id",                 limit: 4
    t.string   "site",                        limit: 255
    t.string   "telefone",                    limit: 255
    t.string   "email",                       limit: 255
    t.string   "state",                       limit: 255
    t.boolean  "hub",                         limit: 1
    t.boolean  "virus",                       limit: 1
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "logo",                        limit: 255
    t.string   "disponibilidade_recebimento", limit: 255
    t.boolean  "todas_categorias",            limit: 1
    t.string   "color",                       limit: 255
  end

  add_index "instituicoes", ["endereco_id"], name: "index_instituicoes_on_endereco_id", using: :btree

  create_table "instituicoes_tipo_instituicoes", id: false, force: :cascade do |t|
    t.integer "instituicao_id",      limit: 4
    t.integer "tipo_instituicao_id", limit: 4
  end

  add_index "instituicoes_tipo_instituicoes", ["instituicao_id"], name: "index_instituicoes_tipo_instituicoes_on_instituicao_id", using: :btree
  add_index "instituicoes_tipo_instituicoes", ["tipo_instituicao_id"], name: "index_instituicoes_tipo_instituicoes_on_tipo_instituicao_id", using: :btree

  create_table "intencao_doacoes", force: :cascade do |t|
    t.integer  "categoria_id",   limit: 4
    t.integer  "instituicao_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "intencao_doacoes", ["categoria_id"], name: "index_intencao_doacoes_on_categoria_id", using: :btree
  add_index "intencao_doacoes", ["instituicao_id"], name: "index_intencao_doacoes_on_instituicao_id", using: :btree

  create_table "notificacoes", force: :cascade do |t|
    t.string   "texto",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "enviada",    limit: 1
  end

  create_table "papeis", force: :cascade do |t|
    t.string   "nome",          limit: 255
    t.string   "chave",         limit: 255
    t.string   "descricao",     limit: 255
    t.integer  "referencia_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissoes", force: :cascade do |t|
    t.boolean  "can_read",    limit: 1
    t.boolean  "can_create",  limit: 1
    t.boolean  "can_update",  limit: 1
    t.boolean  "can_destroy", limit: 1
    t.boolean  "can_manage",  limit: 1
    t.string   "klass",       limit: 255
    t.integer  "papel_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissoes", ["papel_id"], name: "index_permissoes_on_papel_id", using: :btree

  create_table "tipo_instituicoes", force: :cascade do |t|
    t.string   "descricao",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,     null: false
    t.datetime "locked_at"
    t.integer  "papel_id",               limit: 4
    t.boolean  "root",                   limit: 1,   default: false
    t.integer  "referencia_id",          limit: 4
    t.string   "nome",                   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["papel_id"], name: "index_usuarios_on_papel_id", using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cidades", "estados"
  add_foreign_key "contatos", "instituicoes"
  add_foreign_key "enderecos", "cidades"
  add_foreign_key "enderecos", "usuarios"
  add_foreign_key "instituicoes", "enderecos"
  add_foreign_key "intencao_doacoes", "categorias"
  add_foreign_key "intencao_doacoes", "instituicoes"
end
