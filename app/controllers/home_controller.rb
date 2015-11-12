class HomeController < ApplicationController
  def index
    @quantidade_usuarios = Dispositivo.count
    @quantidade_instituicoes = Instituicao.count
    @quantidade_categorias = Categoria.count
    @quantidade_subcategorias = Subcategoria.count
    @palavras = []
    buscas = Busca.group(:palavra).pluck(:palavra, "count(*)")
    buscas.each do |palavra, quantidade|
      @palavras << {text: palavra, weight: quantidade, html: {title: "Quantidade: #{quantidade}"}}
    end
    @quantidade_buscas = buscas.count
    @labels = []
    @dados = []
    @intencoes = {}
    dia = (DateTime.now - 1.year)
    12.times do |i|
      dia += 1.month
      @labels << RaroUtil::ABBR_MESES[dia.month]
      IntencaoDoacao.no_mes(dia).group(:instituicao_id).pluck(:instituicao_id, "count(*)").each do |dado|
        if dado[0].present?
          @intencoes[dado[0]] ||= []
          @intencoes[dado[0]][i] = dado[1]
        end
      end
    end
    @intencoes.each do |key, value|
      instituicao = Instituicao.find(key)
      @dados << {
        fillColor: instituicao.color,
        strokeColor: instituicao.color,
        highlightFill: instituicao.color,
        highlightStroke: instituicao.color,
        data: value
      }
    end
    # {
    #   fillColor: "rgba(151,187,205,0.5)",
    #   strokeColor: "rgba(151,187,205,0.8)",
    #   highlightFill: "rgba(151,187,205,0.75)",
    #   highlightStroke: "rgba(151,187,205,1)",
    #   data: [65, 59, 80, 81, 56, 55, 40]
    # }
  end
end
