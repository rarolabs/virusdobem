class Notificacao < ActiveRecord::Base
  
  validates_presence_of :texto, :nome
  
  def to_s
    "#{id}"
  end
  
  def enviar!
    gcm = GCM.new(Rails.configuration.mobile_api_key)
    options = {data: {mensagem: self.texto, nome: self.nome}, collapse_key: "notificacao"}
    response = gcm.send(Dispositivo.pluck(:gcm), options)
    self.enviada = true
    self.save
  end
end
