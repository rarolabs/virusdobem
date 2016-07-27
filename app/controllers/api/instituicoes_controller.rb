class Api::InstituicoesController < ApplicationController
  skip_before_filter :authenticate_usuario!
  skip_authorize_resource
  protect_from_forgery except: []
  
  def index
    @instituicoes = Instituicao.all
  end
  
  def show
    @instituicao = Instituicao.find(params[:id])
  end

  def busca
    dispositivo = Dispositivo.find_by(gcm: params[:gcm])
    if dispositivo.present?
      dispositivo.numero_busca += 1
      dispositivo.save
    end
    params[:palavra] = params[:palavra].to_s.strip.downcase.singularize
    @busca = Busca.create(params_busca)
    @instituicoes = []
    Instituicao.por_categoria(@busca.descricao_categoria).each do |inst|
      inst.distancia = RaroUtil.calcula_distancia(@busca.localizacao, inst.localizacao).round(2)
      @instituicoes << inst
    end
    respond_to do |format|
      format.json  {render json: @instituicoes.sort{|a,b| a.distancia.to_f <=> b.distancia.to_f}.take(50).to_json(methods: :distancia)}
    end
  end
  
  private
  def params_busca
    params.permit(:latitude, :longitude, :palavra)
  end
end
