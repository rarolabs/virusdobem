class IntencaoDoacao < ActiveRecord::Base
  belongs_to :categoria
  belongs_to :instituicao
  scope :no_mes, -> (dia) {where("intencao_doacoes.created_at between CAST(? AS DATETIME) and CAST(? AS DATETIME)", dia.beginning_of_month, dia.end_of_month)}
end
