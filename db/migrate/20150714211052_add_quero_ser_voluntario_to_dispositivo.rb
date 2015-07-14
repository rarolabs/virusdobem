class AddQueroSerVoluntarioToDispositivo < ActiveRecord::Migration
  def change
    add_column :dispositivos, :quero_ser_voluntario, :boolean
  end
end
