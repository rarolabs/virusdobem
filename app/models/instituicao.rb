class Instituicao < ActiveRecord::Base
  has_and_belongs_to_many :tipo_instituicao
  belongs_to :endereco, dependent: :destroy
  has_many :contatos, dependent: :destroy
  has_and_belongs_to_many :categorias
  validates_presence_of :nome, :descricao, :color
  validates_uniqueness_of :color
  attr_accessor :distancia
  
  scope :por_categoria, -> (descricao){joins(:categorias).where("categorias.descricao like '%#{descricao}%'")}
  
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
  
  def to_s
    nome
  end
  
  def url
    self.logo.url
  end

  def tipoInstituicao
  	self.tipo_instituicao.join(", ")
  end

  def localizacao
    [self.endereco.longitude, self.endereco.latitude]
  end
end
