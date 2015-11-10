class AddNomeToNotificacoes < ActiveRecord::Migration
  def change
    add_column :notificacoes, :nome, :string
  end
end
