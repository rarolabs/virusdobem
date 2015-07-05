class SubcategoriaCrud < RaroCrud
  titulo "Subcategorias"

  link_superior "Novo Subcategoria", id: "novo-button", icon: "plus", link: "new"
  
  ordenar_por :descricao
  itens_por_pagina 20
  sem_visualizacao
  
  campo_tabela :descricao,  label: "Descrição"
  campo_tabela :parent,  label: "Categoria", sort_field: :parent_descricao

  campo_formulario :descricao,  label: "Descrição"
  campo_formulario :parent,  label: "Categoria", collection: Categoria.where(type: nil).order(:descricao)

  campo_busca :descricao,  label: "Descrição"
  campo_busca :descricao, label: "Categoria", model: "Categoria", full_name: "parent_descricao", dont_assoc: true
end