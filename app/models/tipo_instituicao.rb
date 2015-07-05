class TipoInstituicao < ActiveRecord::Base
  has_many :instituicoes
  before_destroy :no_referenced_instituicoes
  validates_presence_of :descricao
  validates_uniqueness_of :descricao
  
  def to_s
    descricao
  end
  private
  def no_referenced_instituicoes
    return if instituicoes.empty?
    self.errors.add(:base, "Existe instituições para esse tipo de instituição.")
    return false
  end
end
