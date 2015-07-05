class CategoriaCrud < RaroCrud
  titulo "Categorias"
  link_superior "Novo Categoria", id: "novo-button", icon: "plus", link: "new"

  ordenar_por :descricao
  itens_por_pagina 20
  sem_visualizacao

  campo_tabela :descricao,  label: "Descrição"

  campo_formulario :descricao,  label: "Descrição"

  campo_busca :descricao,  label: "Descrição"
end