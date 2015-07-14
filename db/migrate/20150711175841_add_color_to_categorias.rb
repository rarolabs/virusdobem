class AddColorToCategorias < ActiveRecord::Migration
  def change
    add_column :categorias, :color, :string
  end
end
