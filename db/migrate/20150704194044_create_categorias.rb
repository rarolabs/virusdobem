class CreateCategorias < ActiveRecord::Migration
  def change
    create_table :categorias do |t|
      t.string :descricao
      t.integer :parent_id
      t.string :type

      t.timestamps null: false
    end
    add_index :categorias, :parent_id
  end
end
