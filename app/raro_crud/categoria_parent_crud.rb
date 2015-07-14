class CategoriaParentCrud < RaroCrud
  titulo "Categorias"
  link_superior "Novo Categoria", id: "novo-button", icon: "plus", link: "new"

  ordenar_por :descricao
  itens_por_pagina 20

  campo_tabela :descricao,  label: "Descrição"

  campo_formulario :color,  label: "Cor", input_html: {class: "colorpicker"}
  campo_formulario :descricao,  label: "Descrição"
  campo_formulario :instituicoes,  label: "Instituições", input_html: {"data-placeholder" => "Escolha as instituções...", class: "chosen"}
  
  campo_visualizacao :color,  label: "Cor", input_html: {class: "colorpicker"}
  campo_visualizacao :descricao,  label: "Descrição"
  campo_visualizacao :instituicoes,  label: "Instituições"

  campo_busca :descricao,  label: "Descrição"
end