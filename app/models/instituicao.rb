class Instituicao < ActiveRecord::Base
  has_and_belongs_to_many :tipo_instituicao
  belongs_to :endereco, dependent: :destroy
  has_many :contatos, dependent: :destroy
  has_and_belongs_to_many :categorias
  validates_presence_of :nome, :descricao, :color
  validates_uniqueness_of :color
  attr_accessor :distancia
  
  accepts_nested_attributes_for :endereco, :contatos, :allow_destroy => true
  mount_uploader :logo, FileUploader
  
  include ActiveRecord::Transitions
  state_machine auto_scopes: true, initial: :ativo do
    state :ativo
    state :desativado
    
    event :ativar do
      transitions :from => :desativado , :to => :ativo  
    end

    event :desativar do
      transitions :from => :ativo , :to => :desativado
    end
  end
  
  def self.por_categoria(descricao)
    ids = Instituicao.ativo.joins(:categorias).where("categorias.descricao like '%#{descricao}%'").pluck(:id)
    Instituicao.ativo.where("instituicoes.todas_categorias = ? or instituicoes.id in (?)", true, ids)
  end

  def to_s
    nome
  end
  
  def url
    self.logo.full_url
  end

  def tipoInstituicao
  	self.tipo_instituicao.join(", ")
  end

  def localizacao
    [self.endereco.longitude, self.endereco.latitude]
  end
end
