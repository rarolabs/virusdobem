class AddLocalizacaoToBusca < ActiveRecord::Migration
  def change
    add_column :buscas, :longitude, :float
    add_column :buscas, :latitude, :float
  end
end
