class CreateInstituicoes < ActiveRecord::Migration
  def change
    create_table :instituicoes do |t|
      t.string :nome
      t.text :descricao
      t.references :tipo_instituicao, index: true, foreign_key: true
      t.references :endereco, index: true, foreign_key: true
      t.string :site
      t.string :telefone
      t.string :email
      t.string :state
      t.boolean :hub
      t.boolean :virus

      t.timestamps null: false
    end
  end
end
