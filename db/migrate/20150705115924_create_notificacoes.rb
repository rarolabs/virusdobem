class CreateNotificacoes < ActiveRecord::Migration
  def change
    create_table :notificacoes do |t|
      t.string :texto

      t.timestamps null: false
    end
  end
end
