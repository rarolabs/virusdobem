class CreateDispositivos < ActiveRecord::Migration
  def change
    create_table :dispositivos do |t|
      t.string :gcm
      t.integer :numero_busca, default: 0
      
      t.timestamps null: false
    end
  end
end
