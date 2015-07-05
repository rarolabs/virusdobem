class CreateTipoInstituicoes < ActiveRecord::Migration
  def change
    create_table :tipo_instituicoes do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
