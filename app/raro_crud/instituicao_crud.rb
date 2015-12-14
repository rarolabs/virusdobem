class InstituicaoCrud < RaroCrud
  titulo "Instituições"

  link_superior "Novo Instituição", id: "novo-button", icon: "plus", link: "new"

  ordenar_por :nome
  itens_por_pagina 20

  acoes :desativar!, "Desativar", Proc.new {|p| p.ativo?}
  acoes :ativar!, "Ativar", Proc.new {|p| p.desativado?}

  campo_tabela :nome,  label: "Nome"
  campo_tabela :logo,  label: "Logo"
  campo_tabela :tipo_instituicao,  label: "Tipo instituição", sort_field: :tipo_instituicao_descricao
  campo_tabela :telefone,  label: "Telefone"
  campo_tabela :state,  label: "Status"

  campo_formulario :color,  label: "Cor", input_html: {class: "colorpicker"}
  campo_formulario :nome,  label: "Nome"
  campo_formulario :logo,  label: "Logo"
  campo_formulario :descricao,  label: "Descrição"
  campo_formulario :tipo_instituicao,  label: "Tipo instituição", input_html: {"data-placeholder" => "Escolha os tipos...", class: "chosen"}, collection_if: Proc.new{TipoInstituicao.order(:descricao)}
  campo_formulario :categorias, label: "Categoria/Subcategoria", input_html: {"data-placeholder" => "Escolha as categorias/subcategorias...", class: "chosen"}, label_method: :descricao_completa, collection: Categoria.order(:descricao)
  campo_formulario :hub,  label: "Hub de logística", input_html: {class: "i-checks"}
  campo_formulario :todas_categorias,  label: "Recebe todas as categorias", input_html: {class: "i-checks"}
  campo_formulario :site,  label: "Site"
  campo_formulario :telefone,  label: "Telefone", input_html: {class: "mask-telefone-ddd"}
  campo_formulario :email,  label: "Email"
  campo_formulario :disponibilidade_recebimento,  label: "Disponibilidade de recebimento"
  adicionar_endereco
  grupo_formulario :contatos, [
    {campo: :nome, label: "Nome do contato"},
    {campo: :email, label: "Email do contato"},
    {campo: :telefone, label: "Telefone do contato", input_html: {class: "mask-telefone-ddd"}},
    {campo: :celular, label: "Celular do contato", input_html: {class: "mask-telefone-ddd"}}
  ]

  campo_visualizacao :state,  label: "Status"
  campo_visualizacao :color,  label: "Cor", input_html: {class: "colorpicker"}
  campo_visualizacao :nome,  label: "Nome"
  campo_visualizacao :logo,  label: "Logo"
  campo_visualizacao :descricao,  label: "Descrição"
  campo_visualizacao :tipo_instituicao,  label: "Tipo instituicao"
  campo_visualizacao :categorias,  label: "Categorias"
  campo_visualizacao :hub,  label: "HUB?"
  campo_visualizacao :todas_categorias,  label: "Recebe todas as categorias?"
  campo_visualizacao :site,  label: "Site"
  campo_visualizacao :telefone,  label: "Telefone"
  campo_visualizacao :email,  label: "Email"
  campo_visualizacao :disponibilidade_recebimento,  label: "Disponibilidade de recebimento"
  campo_visualizacao :endereco,  label: "Endereço"
  campo_visualizacao :contatos,  label: "Contato"

  campo_busca :nome,  label: "Nome"
  campo_busca :hub,  label: "HUB?"
  campo_busca :descricao, label: "Tipo instituição", model: "TipoInstituicao", full_name: "tipo_instituicao_descricao", dont_assoc: true
  campo_busca :descricao, label: "Categoria", model: "Categoria", full_name: "categorias_descricao", dont_assoc: true
  campo_busca :nome, label: "Nome do Contato", model: "Contato", full_name: "contatos_nome", dont_assoc: true
end