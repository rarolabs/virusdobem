class DispositivoCrud < RaroCrud
  titulo "Dispositivos"
  
  ordenar_por :numero_busca
  itens_por_pagina 20
  sem_visualizacao
  sem_edicao
  sem_exclusao

  campo_tabela :gcm,  label: "Gcm"
  campo_tabela :numero_busca,  label: "Quantidade de buscas"
  campo_tabela :doacoes,  label: "Quantidade de doações"
  campo_tabela :quero_ser_voluntario,  label: "Quero ser um voluntário?"

  campo_busca :numero_busca,  label: "Quantidade de buscas"
  campo_busca :doacoes,  label: "Quantidade de doações"
  campo_busca :quero_ser_voluntario,  label: "Quero ser um voluntário?"
end