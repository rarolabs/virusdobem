class AddEnviadaToNotificacoes < ActiveRecord::Migration
  def change
    add_column :notificacoes, :enviada, :boolean
  end
end
