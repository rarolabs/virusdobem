class Subcategoria < Categoria
  validates_presence_of :parent_id
end
