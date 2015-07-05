class Api::InstituicoesController < ApplicationController
  skip_before_filter :authenticate_usuario!
  skip_authorize_resource
  
  def index
    @instituicoes = Instituicao.all
  end
  
  def show
    @instituicao = Instituicao.find(params[:id])
  end
  
  def busca
    respond_to do |format|
      @instituicoes = Instituicao.all
      render :index
    end
  end
end