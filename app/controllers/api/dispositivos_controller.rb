class Api::DispositivosController < ApplicationController
  skip_before_filter :authenticate_usuario!
  skip_authorize_resource
  protect_from_forgery except: []
  
  def create
    Dispositivo.create(gcm: params[:gcm])
    head :ok
  end
  
  def quero_ser_voluntario
    dispositivo = Dispositivo.find_by(gcm: params[:gcm])
    dispositivo.quero_ser_voluntario = true
    dispositivo.save
  end

end
