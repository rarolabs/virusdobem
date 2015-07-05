class InstituicoesController < ApplicationController
  @permissao = "Instituicao"
  authorize_resource class: @permissao

  def index
    @model = Instituicao
    @crud_helper = InstituicaoCrud
    @instituicoes = Instituicao.order(:nome)
    @enderecos = Endereco.joins(:instituicoes).where("instituicoes.id in (?)", @instituicoes.pluck(:id))
    @hash = Gmaps4rails.build_markers(@enderecos) do |endereco, marker|
      marker.lat endereco.latitude
      marker.lng endereco.longitude
    end
  end
end