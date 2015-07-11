class Instituicao < ActiveRecord::Base
  belongs_to :tipo_instituicao
  belongs_to :endereco, dependent: :destroy
  has_many :contatos, dependent: :destroy
  has_and_belongs_to_many :categorias
  validates_presence_of :nome, :descricao
  
  accepts_nested_attributes_for :endereco, :contatos, :allow_destroy => true
  
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

  def tipoInstituicao
  	self.tipo_instituicao.descricao
  end

end
