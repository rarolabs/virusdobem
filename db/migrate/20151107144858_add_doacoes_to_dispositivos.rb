class AddDoacoesToDispositivos < ActiveRecord::Migration
  def change
    add_column :dispositivos, :doacoes, :integer
  end
end
