class CreateJoinTableCategoriaInstituicao < ActiveRecord::Migration
  def change
    create_join_table :categorias, :instituicoes do |t|
      t.references :categoria, index: true
      t.references :instituicao, index: true
    end
  end
end
