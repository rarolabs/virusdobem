class Busca < ActiveRecord::Base
  belongs_to :categoria
  
  before_create :set_categoria

  def localizacao
    [self.longitude, self.latitude]
  end
  
  def descricao_categoria
    categoria.descricao
  end
  
  private
  def set_categoria
    self.categoria = Categoria.find_by(descricao: self.palavra)
  end
end
