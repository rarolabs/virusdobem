class AddDadosToInstituicoes < ActiveRecord::Migration
  def change
    add_column :instituicoes, :logo, :string
    add_column :instituicoes, :disponibilidade_recebimento, :string
    add_column :instituicoes, :todas_categorias, :boolean
    remove_reference :instituicoes, :tipo_instituicao, index: true, foreign_key: true
  end
end
