class Categoria < ActiveRecord::Base
  validates_presence_of :descricao
  validates_uniqueness_of :descricao  
  belongs_to :parent, :class_name => "Categoria"
  has_and_belongs_to_many :instituicoes
  def to_s
    descricao
  end
  
  def descricao_completa
    desc = ""
    if self.parent.present?
      desc += "#{self.parent.descricao} / "
    end
    desc += self.descricao
    desc
  end
end
