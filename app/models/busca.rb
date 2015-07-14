class Busca < ActiveRecord::Base
  belongs_to :categoria
  def localizacao
    [self.longitude, self.latitude]
  end
  
  def descricao_categoria
    "Alimentos"
  end
end
