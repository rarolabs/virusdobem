class AddColorToInstituicoes < ActiveRecord::Migration
  def change
    add_column :instituicoes, :color, :string
  end
end
