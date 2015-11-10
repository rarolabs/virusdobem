class NotificacaoCrud < RaroCrud
  titulo "Notificações"

  link_superior "Novo Notificação", id: "novo-button", icon: "plus", link: "new"
  
  ordenar_por :created_at
  itens_por_pagina 20
  acoes :enviar!, "Enviar", Proc.new {|obj| !obj.enviada?}
  
  sem_visualizacao
  sem_exclusao
  
  campo_tabela :created_at,  label: "Enviado em", data_format: "%d/%m/%Y às %H:%M"
  campo_tabela :nome,  label: "Nome"
  campo_tabela :texto,  label: "Texto"
  
  campo_formulario :nome,  label: "Nome"
  campo_formulario :texto,  label: "Texto"
  
  campo_busca :created_at,  label: "Enviado em"
  campo_busca :texto,  label: "Texto"
end