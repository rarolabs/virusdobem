class TipoInstituicaoCrud < RaroCrud
  titulo "Tipos de Instituição"
  
  link_superior "Novo Tipo de Instituição", id: "novo-button", icon: "plus", link: "new"
  
  ordenar_por :descricao
  itens_por_pagina 20
  sem_visualizacao

  campo_tabela :descricao,  label: "Descrição"

  campo_formulario :descricao,  label: "Descrição"

  campo_busca :descricao,  label: "Descrição"
end