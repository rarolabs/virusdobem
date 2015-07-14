class CreateJoinTableInstituicaoTipoInstituicao < ActiveRecord::Migration
  def change
    create_join_table :instituicoes, :tipo_instituicoes do |t|
      t.references :instituicao, index: true
      t.references :tipo_instituicao, index: true
    end
  end
end
