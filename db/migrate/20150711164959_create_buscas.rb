class CreateBuscas < ActiveRecord::Migration
  def change
    create_table :buscas do |t|
      t.string :palavra
      t.integer :quantidade
      t.datetime :ultima_busca
      t.datetime :primeira_busca

      t.timestamps null: false
    end
  end
end
