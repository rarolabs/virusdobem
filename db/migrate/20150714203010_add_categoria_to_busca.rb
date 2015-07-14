class AddCategoriaToBusca < ActiveRecord::Migration
  def change
    add_reference :buscas, :categoria, index: true
  end
end
