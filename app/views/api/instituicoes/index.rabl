object @instituicoes
attributes :id, :nome, :descricao, :site, :telefone, :email, :hub, :tipoInstituicao
child(:endereco) { attributes :logradouro, :bairro, :numero, :cep, :complemento, :cidade, :estado, :latitude, :longitude }
#child(:contatos)  { attributes :nome, :telefone, :celular }
