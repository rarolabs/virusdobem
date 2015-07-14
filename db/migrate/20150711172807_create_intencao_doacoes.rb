class CreateIntencaoDoacoes < ActiveRecord::Migration
  def change
    create_table :intencao_doacoes do |t|
      t.references :categoria, index: true, foreign_key: true
      t.references :instituicao, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
