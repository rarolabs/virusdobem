class SubcategoriaCrud < RaroCrud
  titulo "Subcategorias"

  link_superior "Novo Subcategoria", id: "novo-button", icon: "plus", link: "new"
  
  ordenar_por :descricao
  itens_por_pagina 20
  
  campo_tabela :descricao,  label: "Descrição"
  campo_tabela :parent,  label: "Categoria", sort_field: :parent_descricao

  campo_formulario :color,  label: "Cor", input_html: {class: "colorpicker"}
  campo_formulario :descricao,  label: "Descrição"
  campo_formulario :parent,  label: "Categoria", collection_if: Proc.new{CategoriaParent.order(:descricao)}
  campo_formulario :instituicoes,  label: "Instituições", input_html: {"data-placeholder" => "Escolha as instituções...", class: "chosen"}
  
  campo_visualizacao :color,  label: "Cor", input_html: {class: "colorpicker"}
  campo_visualizacao :descricao,  label: "Descrição"
  campo_visualizacao :parent,  label: "Categoria"
  campo_visualizacao :instituicoes,  label: "Instituições"

  campo_busca :descricao,  label: "Descrição"
  campo_busca :descricao, label: "Categoria", model: "Categoria", full_name: "parent_descricao", dont_assoc: true
end