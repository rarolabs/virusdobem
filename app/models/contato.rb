class Contato < ActiveRecord::Base
  belongs_to :instituicao
  validates_presence_of :nome, :telefone
  def to_s
    "#{nome} - #{email} - #{telefone} - #{celular}"
  end
end