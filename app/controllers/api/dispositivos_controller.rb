class Api::DispositivosController < ApplicationController
  skip_before_filter :authenticate_usuario!
  skip_authorize_resource
  protect_from_forgery except: []
  
  def create
    Dispositivo.find_or_create_by(gcm: params[:gcm])
    head :ok
  end
  
  def quero_ser_voluntario
    dispositivo = Dispositivo.find_by(gcm: params[:gcm])
    if dispositivo.present?
      dispositivo.quero_ser_voluntario = true
      dispositivo.save
    end
    head :ok
  end
  
  def vou_doar
    dispositivo = Dispositivo.find_by(gcm: params[:gcm])
    if dispositivo.present?
      dispositivo.doacoes ||= 0
      dispositivo.doacoes += 1
      dispositivo.save
    end
    head :ok
  end

end
