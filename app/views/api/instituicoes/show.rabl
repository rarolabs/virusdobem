object @instituicao
attributes :id, :nome, :descricao, :site, :telefone, :email, :hub
child(:endereco) { attributes :logradouro, :numero, :cep, :complemento, :cidade, :estado }
child(:contatos)  { attributes :nome, :telefone, :celular }
child(:tipo_instituicao)  { attributes :descricao }