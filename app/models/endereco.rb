class Endereco < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  belongs_to :cidade
  delegate :estado, to: :cidade, allow_nil: true
  has_many :instituicoes, :class_name => "Instituicao", :foreign_key => "endereco_id"
  validates_presence_of :logradouro, :numero, :bairro, :cidade
  # validate :geolocalizacao
  def to_s
    if logradouro.present?
      "#{logradouro}, #{numero} #{complemento}, #{bairro}, #{cidade.try(:cidade_estado)}"
    end
  end

  def address
    "#{logradouro}, #{numero}, #{bairro}, #{cidade.try(:cidade_estado)}"
  end
  
  def gmaps4rails_address
    self.address
  end
  
  private
  def geolocalizacao
    if !self.latitude.present? || !self.longitude.present?
      self.errors.add(:logradouro, "Localização não encontrada")
    end
  end
end
