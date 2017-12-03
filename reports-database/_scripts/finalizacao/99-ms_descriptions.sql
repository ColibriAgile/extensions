 
/**********************************************
 *** Schema fiscal
 **********************************************/
exec sp_descricao_schema 'fiscal', 'Conjunto de tabelas mantidas pelo plugin fiscal'
 
/**********************************************
 *** tabela aliquota_ncm
 **********************************************/
exec sp_descricao_tabela 'aliquota_ncm', 'Dados importados da tabela do IPBT', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'chave', 'Chave informada na geração do arquivo', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'codigo', 'código NCM para mercadorias ou NBS para serviços, verificar o campo “tipo”', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'descricao', 'Descrição do NCM ou tipo de serviço', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'estadual', 'Incidência de impostos estaduais', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'ex', 'Exceção do TIPI, deve ser utilizado com conjunto com o código NCM para encontra corretamente a alíquota a ser utilizada', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'fonte', 'Entidade geradora dos dados, geralmente é o IBPT', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'importadosfederal', 'Incidência de impostos nacionais, adotada se a origem da mercadoria for: 1,2,6,7', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'loja_id', 'ID da loja', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'municipal', 'Incidência de impostos municipais', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'nacionalfederal', 'Incidência de impostos nacionais, adotada se a origem da mercadoria for: 0,3,4,5', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'tipo', 'Tipo do código, pode assumir 0 para NCM ou 1 para NBS', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'versao', 'Versão atual da tabela', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'vigenciafim', 'Fim de vigência da tabela', 'fiscal'
exec sp_descricao_campo  'aliquota_ncm', 'vigenciainicio', 'Início de vigência da tabela', 'fiscal'
go
 
/**********************************************
 *** tabela comprovante
 **********************************************/
exec sp_descricao_tabela 'comprovante', 'Conjunto de comprovantes fiscais emitidos (eletrônicos, ECFs ou manuais)', 'fiscal'
exec sp_descricao_campo  'comprovante', 'acrescimo', 'Acréscimo aplicado ao valor total', 'fiscal'
exec sp_descricao_campo  'comprovante', 'cancelado', 'Se comprovante foi cancelado é igual a 1', 'fiscal'
exec sp_descricao_campo  'comprovante', 'comprovante_id', 'Identificador único do comprovante', 'fiscal'
exec sp_descricao_campo  'comprovante', 'consumidor_cpf', 'CPF do consumidor', 'fiscal'
exec sp_descricao_campo  'comprovante', 'consumidor_email', 'Email do consumidor', 'fiscal'
exec sp_descricao_campo  'comprovante', 'consumidor_endereco', 'Endereço do consumidor', 'fiscal'
exec sp_descricao_campo  'comprovante', 'consumidor_nome', 'Nome do consumidor', 'fiscal'
exec sp_descricao_campo  'comprovante', 'denominacao', 'Denominação fiscal, varia conforme o modelo do documento fiscal.', 'fiscal'
exec sp_descricao_campo  'comprovante', 'desconto', 'Desconto aplicado ao valor total', 'fiscal'
exec sp_descricao_campo  'comprovante', 'dt_alt', 'Data/hora de inclusão/alteração do registro', 'fiscal'
exec sp_descricao_campo  'comprovante', 'dt_competencia', 'Data do período aberto no sistema quando o comprovante foi emitido', 'fiscal'
exec sp_descricao_campo  'comprovante', 'dt_hr_emissao', 'Data/hora de emissão do comprovante', 'fiscal'
exec sp_descricao_campo  'comprovante', 'dt_movimento', 'Data de movimento do ECF quando o comprovante é um cupom fiscal (CF) ou data do micro para os outros tipos de comprovante', 'fiscal'
exec sp_descricao_campo  'comprovante', 'ecf_ccf', '(somente ECF) Contador de cupom fiscal (é o número do cupom fiscal)', 'fiscal'
exec sp_descricao_campo  'comprovante', 'ecf_cdc', '(somente ECF) Número do comprovante de credito e debito (CCD)', 'fiscal'
exec sp_descricao_campo  'comprovante', 'ecf_cer', '(somente ECF) Contador específico de relatório gerencial', 'fiscal'
exec sp_descricao_campo  'comprovante', 'ecf_coo', '(somente ECF) Contador de ordem da operação, é incrementado para qualquer documento impresso no ECF', 'fiscal'
exec sp_descricao_campo  'comprovante', 'ecf_gnf', '(somente ECF) Contador geral não fiscal', 'fiscal'
exec sp_descricao_campo  'comprovante', 'ecf_grg', '(somente ECF) Contador geral de relatório gerencial', 'fiscal'
exec sp_descricao_campo  'comprovante', 'ecf_id', 'Identificação única do ECF no sistema', 'fiscal'
exec sp_descricao_campo  'comprovante', 'ecf_serie', 'Número de série do ECF', 'fiscal'
exec sp_descricao_campo  'comprovante', 'maquina_id', 'Máquina onde o comprovante fiscal foi emitido', 'fiscal'
exec sp_descricao_campo  'comprovante', 'md5_autenticacao', 'Hash MD5 do registro, solicitado pelo PAF', 'fiscal'
exec sp_descricao_campo  'comprovante', 'nf_numero', '(somente NF) Número da nota fiscal ao consumidor', 'fiscal'
exec sp_descricao_campo  'comprovante', 'nf_serie', '(somente NF) Série da nota fiscal', 'fiscal'
exec sp_descricao_campo  'comprovante', 'nf_subserie', '(somente NF) Subsérie da nota fiscal', 'fiscal'
exec sp_descricao_campo  'comprovante', 'nfe_chave', '(somente eletronicas) Chave retornada pelo Fiscal Gateway', 'fiscal'
exec sp_descricao_campo  'comprovante', 'nfe_chave_interna', '(somente eletronicas) Chave utilizada para identificação única da venda', 'fiscal'
exec sp_descricao_campo  'comprovante', 'nfe_mensagem', '(somente eletronicas) Mensagem retornada pelo Fiscal Gateway', 'fiscal'
exec sp_descricao_campo  'comprovante', 'nfe_protocolo', '(somente eletronicas) Número de protocolo retornado pelo Fiscal Gateway', 'fiscal'
exec sp_descricao_campo  'comprovante', 'nfe_status', '(somente eletronicas) Status retornado pelo Fiscal Gateway', 'fiscal'
exec sp_descricao_campo  'comprovante', 'operacao_id', 'ID da operação que originou o comprovante fiscal', 'fiscal'
exec sp_descricao_campo  'comprovante', 'ponto_fiscal', 'Nome do ponto fiscal onde o comprovante foi emitido', 'fiscal'
exec sp_descricao_campo  'comprovante', 'ponto_fiscal_id', 'ID do ponto fiscal onde o comprovante foi emitido', 'fiscal'
exec sp_descricao_campo  'comprovante', 'troco', 'Troco informado', 'fiscal'
exec sp_descricao_campo  'comprovante', 'valor', 'Valor total da operação', 'fiscal'
exec sp_descricao_campo  'comprovante', 'versao', 'Versão do sistema no momento da emissão do comprovante', 'fiscal'
go
 
/**********************************************
 *** tabela comprovante_item
 **********************************************/
exec sp_descricao_tabela 'comprovante_item', 'Detalhamento dos itens dos comprovantes fiscais emitidos', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'aliq_cofins', 'Aliquota de COFINS', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'aliq_icms_iss', 'Aliquota de ICMS ou ISS', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'aliq_pis', 'Aliquota de PIS', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'aliquota', 'Código da aliquota (exemplo F1, N1, T0800, T1200, etc)', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'base_icms', 'Base de ICMS', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'cancelado', 'Se o item está cancelado é igual a 1', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'cest', 'Código especificador de substituição tributária', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'cfop', 'Código fiscal de operações e prestações', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'cod_ncm', 'Nomenclatura comum do Mercosul', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'codigo', 'Código do item', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'codigo_servico', 'Código nacional do serviço (utilizado somente quando o item vendido é um serviço)', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'comprovante_id', 'Identificador único do comprovante (utilizado para ligar os itens ao comprovante)', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'cst_cofins', 'Código de situação tributária do COFINS', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'cst_icms', 'Código de situação tributária do ICMS', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'cst_pis', 'Código de situação tributária do PIS', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'descricao', 'Descrição do item vendido', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'dt_alt', 'Data/hora da inclusão/alteração', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'dt_hr_emissao', 'Data/hora da emissão do item', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'dt_movimento', 'Data de movimento do ECF quando o comprovante é um cupom fiscal (CF) ou data do micro para os outros tipos de comprovante', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'ecf_ccf', '(somente ECF) Contador de cupom fiscal (número do cupom fiscal)', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'ecf_coo', '(somente ECF) Contador de ordem da operação (incrementado para qualquer documento impresso no ECF)', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'ecf_dt_hr', '(somente ECF) Data/hora do ECF no momento da impressão do item', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'ecf_id', '(somente ECF) Identificador único do ECF ', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'ecf_serie', '(somente ECF) Número de série do ECF', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'item_lista_servico', 'Código do serviço dentro do município (utilizado somente quando o item vendido é um serviço)', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'nf_numero', '(somente NF) Número da nota fiscal ao consumidor', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'nf_serie', '(somente NF) Série da nota fiscal ao consumidor', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'nfe_chave', '(somente eletrônicas) Chave da', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'ordem', 'Ordem de emissão do item', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'processado', '(uso interno)', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'prod_origem', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'qtd', 'Quantidade do item', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'reducao_bc_icms', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'tipo_aliquota', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'unidade', 'Unidade de medida', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'valor', 'Valor total', 'fiscal'
exec sp_descricao_campo  'comprovante_item', 'vl_unitario', 'Valor unitário', 'fiscal'
go
 
/**********************************************
 *** tabela comprovante_meio
 **********************************************/
exec sp_descricao_tabela 'comprovante_meio', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'comprovante_id', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'credenciadora', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'credenciadora_id', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'credenciadora_rede', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'descricao', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'detalhe_id', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'dt_alt', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'dt_movimento', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'ecf_ccf', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'ecf_coo', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'ecf_gnf', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'ecf_id', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'ecf_serie', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'num_autorizacao', '---', 'fiscal'
exec sp_descricao_campo  'comprovante_meio', 'valor', '---', 'fiscal'
go
 
/**********************************************
 *** tabela contabilidade
 **********************************************/
exec sp_descricao_tabela 'contabilidade', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'bairro', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'cep', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'cnpj', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'cod_mun', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'compl', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'cpf', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'crc', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'email', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'end', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'fax', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'fone', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'nome', '---', 'fiscal'
exec sp_descricao_campo  'contabilidade', 'num', '---', 'fiscal'
go
 
/**********************************************
 *** tabela credenciadora
 **********************************************/
exec sp_descricao_tabela 'credenciadora', '---', 'fiscal'
exec sp_descricao_campo  'credenciadora', 'cnpj', '---', 'fiscal'
exec sp_descricao_campo  'credenciadora', 'id', '---', 'fiscal'
exec sp_descricao_campo  'credenciadora', 'nome', '---', 'fiscal'
go
 
/**********************************************
 *** tabela ecf
 **********************************************/
exec sp_descricao_tabela 'ecf', '---', 'fiscal'
exec sp_descricao_campo  'ecf', 'class_name', '---', 'fiscal'
exec sp_descricao_campo  'ecf', 'cod_nac_marca', '---', 'fiscal'
exec sp_descricao_campo  'ecf', 'cod_nac_modelo', '---', 'fiscal'
exec sp_descricao_campo  'ecf', 'colunas', '---', 'fiscal'
exec sp_descricao_campo  'ecf', 'ecf_id', '---', 'fiscal'
exec sp_descricao_campo  'ecf', 'marca', '---', 'fiscal'
exec sp_descricao_campo  'ecf', 'modelo', '---', 'fiscal'
go
 
/**********************************************
 *** tabela ecf_versao
 **********************************************/
exec sp_descricao_tabela 'ecf_versao', '---', 'fiscal'
exec sp_descricao_campo  'ecf_versao', 'cod_nac_versao', '---', 'fiscal'
exec sp_descricao_campo  'ecf_versao', 'ecf_id', '---', 'fiscal'
exec sp_descricao_campo  'ecf_versao', 'versao_sb', '---', 'fiscal'
go
 
/**********************************************
 *** tabela estoque
 **********************************************/
exec sp_descricao_tabela 'estoque', '---', 'fiscal'
exec sp_descricao_campo  'estoque', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'estoque', 'descricao', '---', 'fiscal'
exec sp_descricao_campo  'estoque', 'material_id', '---', 'fiscal'
exec sp_descricao_campo  'estoque', 'qtd', '---', 'fiscal'
exec sp_descricao_campo  'estoque', 'unidade', '---', 'fiscal'
go
 
/**********************************************
 *** tabela indice_tecnico
 **********************************************/
exec sp_descricao_tabela 'indice_tecnico', '---', 'fiscal'
exec sp_descricao_campo  'indice_tecnico', 'codigo_material_filho', '---', 'fiscal'
exec sp_descricao_campo  'indice_tecnico', 'codigo_material_pai', '---', 'fiscal'
exec sp_descricao_campo  'indice_tecnico', 'qtd', '---', 'fiscal'
go
 
/**********************************************
 *** tabela mapa_ecf
 **********************************************/
exec sp_descricao_tabela 'mapa_ecf', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'cnf', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'cnpj', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'coo', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'cro', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'crz', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'dt_hr_rz', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'dt_movimento', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'ie', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'im', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'mapa_ecf_id', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'maquina_ecf_id', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'nu_ecf', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'num_serie', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'vl_gtotal', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf', 'vl_vendabruta', '---', 'fiscal'
go
 
/**********************************************
 *** tabela mapa_ecf_detalhe
 **********************************************/
exec sp_descricao_tabela 'mapa_ecf_detalhe', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_detalhe', 'base', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_detalhe', 'cod_totalizador', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_detalhe', 'crz', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_detalhe', 'dt_movimento', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_detalhe', 'mapa_ecf_id', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_detalhe', 'num_serie', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_detalhe', 'percentual', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_detalhe', 'posicao', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_detalhe', 'tipo', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_detalhe', 'valor', '---', 'fiscal'
go
 
/**********************************************
 *** tabela mapa_ecf_totalizador
 **********************************************/
exec sp_descricao_tabela 'mapa_ecf_totalizador', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_totalizador', 'contador', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_totalizador', 'crz', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_totalizador', 'dt_movimento', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_totalizador', 'mapa_ecf_id', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_totalizador', 'num_serie', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_totalizador', 'operacao', '---', 'fiscal'
exec sp_descricao_campo  'mapa_ecf_totalizador', 'valor', '---', 'fiscal'
go
 
/**********************************************
 *** tabela maquina
 **********************************************/
exec sp_descricao_tabela 'maquina', '---', 'fiscal'
exec sp_descricao_campo  'maquina', 'host', '---', 'fiscal'
exec sp_descricao_campo  'maquina', 'maquina_id', '---', 'fiscal'
exec sp_descricao_campo  'maquina', 'ponto_fiscal_id', '---', 'fiscal'
exec sp_descricao_campo  'maquina', 'ponto_impressao_id', '---', 'fiscal'
exec sp_descricao_campo  'maquina', 'porta_ecf', '---', 'fiscal'
exec sp_descricao_campo  'maquina', 'porta_fg', '---', 'fiscal'
exec sp_descricao_campo  'maquina', 'sat', '---', 'fiscal'
exec sp_descricao_campo  'maquina', 'sat_versao', '---', 'fiscal'
exec sp_descricao_campo  'maquina', 'tipo', '---', 'fiscal'
go
 
/**********************************************
 *** tabela maquina_ecf
 **********************************************/
exec sp_descricao_tabela 'maquina_ecf', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'bairro', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'cep', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'cidade', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'cnpj', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'complemento', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'contato', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'data_sb', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'dt_hr_estoque', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'ecf_id', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'endereco', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'fax', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'gt', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'hora_sb', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'id', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'ie', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'im', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'liberado', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'maquina_id', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'num_serie', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'numero', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'razao', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'telefone', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'tot_ven', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'uf', '---', 'fiscal'
exec sp_descricao_campo  'maquina_ecf', 'versao_sb', '---', 'fiscal'
go
 
/**********************************************
 *** tabela maquina_impressao
 **********************************************/
exec sp_descricao_tabela 'maquina_impressao', '---', 'fiscal'
exec sp_descricao_campo  'maquina_impressao', 'impressao_id', '---', 'fiscal'
exec sp_descricao_campo  'maquina_impressao', 'maquina_id', '---', 'fiscal'
go
 
/**********************************************
 *** tabela material
 **********************************************/
exec sp_descricao_tabela 'material', '---', 'fiscal'
exec sp_descricao_campo  'material', 'aliq_cofins', '---', 'fiscal'
exec sp_descricao_campo  'material', 'aliq_ecf', '---', 'fiscal'
exec sp_descricao_campo  'material', 'aliq_icms_iss', '---', 'fiscal'
exec sp_descricao_campo  'material', 'aliq_pis', '---', 'fiscal'
exec sp_descricao_campo  'material', 'cest', '---', 'fiscal'
exec sp_descricao_campo  'material', 'cfop', '---', 'fiscal'
exec sp_descricao_campo  'material', 'cod_ncm', '---', 'fiscal'
exec sp_descricao_campo  'material', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'material', 'codigo_aliquota', '---', 'fiscal'
exec sp_descricao_campo  'material', 'codigo_servico', '---', 'fiscal'
exec sp_descricao_campo  'material', 'cst_cofins', '---', 'fiscal'
exec sp_descricao_campo  'material', 'cst_icms', '---', 'fiscal'
exec sp_descricao_campo  'material', 'cst_pis', '---', 'fiscal'
exec sp_descricao_campo  'material', 'descricao', '---', 'fiscal'
exec sp_descricao_campo  'material', 'ippt', '---', 'fiscal'
exec sp_descricao_campo  'material', 'item_lista_servico', '---', 'fiscal'
exec sp_descricao_campo  'material', 'material_id', '---', 'fiscal'
exec sp_descricao_campo  'material', 'prod_origem', '---', 'fiscal'
exec sp_descricao_campo  'material', 'reducao_bc_icms', '---', 'fiscal'
exec sp_descricao_campo  'material', 'tipo_aliquota', '---', 'fiscal'
exec sp_descricao_campo  'material', 'unidade', '---', 'fiscal'
exec sp_descricao_campo  'material', 'vl_unit', '---', 'fiscal'
go
 
/**********************************************
 *** tabela meios_ecf
 **********************************************/
exec sp_descricao_tabela 'meios_ecf', '---', 'fiscal'
exec sp_descricao_campo  'meios_ecf', 'ecf_serie', '---', 'fiscal'
exec sp_descricao_campo  'meios_ecf', 'forma_pgto', '---', 'fiscal'
go
 
/**********************************************
 *** tabela meios_ecf_colibri
 **********************************************/
exec sp_descricao_tabela 'meios_ecf_colibri', '---', 'fiscal'
exec sp_descricao_campo  'meios_ecf_colibri', 'ecf_serie', '---', 'fiscal'
exec sp_descricao_campo  'meios_ecf_colibri', 'forma_pgto', '---', 'fiscal'
exec sp_descricao_campo  'meios_ecf_colibri', 'meio_pagamento_id', '---', 'fiscal'
go
 
/**********************************************
 *** tabela meios_fg
 **********************************************/
exec sp_descricao_tabela 'meios_fg', '---', 'fiscal'
exec sp_descricao_campo  'meios_fg', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'meios_fg', 'nome', '---', 'fiscal'
go
 
/**********************************************
 *** tabela meios_fg_colibri
 **********************************************/
exec sp_descricao_tabela 'meios_fg_colibri', '---', 'fiscal'
exec sp_descricao_campo  'meios_fg_colibri', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'meios_fg_colibri', 'meio_id', '---', 'fiscal'
go
 
/**********************************************
 *** tabela paf_laudo
 **********************************************/
exec sp_descricao_tabela 'paf_laudo', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'assinatura', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'empr_cnpj', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'empr_contato', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'empr_ender', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'empr_fone', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'empr_ie', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'empr_im', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'empr_raz_soc', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'laudo_dt', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'laudo_id', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'laudo_num', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'laudo_orgao', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'paf_exe', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'paf_md5', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'paf_nome', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'paf_outros_exe', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'paf_versao', '---', 'fiscal'
exec sp_descricao_campo  'paf_laudo', 'paf_versao_er', '---', 'fiscal'
go
 
/**********************************************
 *** tabela parametro
 **********************************************/
exec sp_descricao_tabela 'parametro', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'altera_com_periodo_aberto', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'categoria', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'descr', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'detalhes', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'list_sql', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'lista', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'mascara', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'nomeDaClasse', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'secao', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'subcategoria', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'tipo_param', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'tipo_valor', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'valor', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'valor_default', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'valor_max', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'valor_min', '---', 'fiscal'
exec sp_descricao_campo  'parametro', 'visivel', '---', 'fiscal'
go
 
/**********************************************
 *** tabela parametro_modo
 **********************************************/
exec sp_descricao_tabela 'parametro_modo', '---', 'fiscal'
exec sp_descricao_campo  'parametro_modo', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'parametro_modo', 'modo_venda_id', '---', 'fiscal'
exec sp_descricao_campo  'parametro_modo', 'valor', '---', 'fiscal'
exec sp_descricao_campo  'parametro_modo', 'visivel', '---', 'fiscal'
go
 
/**********************************************
 *** tabela perfil_paf
 **********************************************/
exec sp_descricao_tabela 'perfil_paf', '---', 'fiscal'
exec sp_descricao_campo  'perfil_paf', 'perfil', '---', 'fiscal'
exec sp_descricao_campo  'perfil_paf', 'UF', '---', 'fiscal'
go
 
/**********************************************
 *** tabela ponto_fiscal
 **********************************************/
exec sp_descricao_tabela 'ponto_fiscal', '---', 'fiscal'
exec sp_descricao_campo  'ponto_fiscal', 'ativo', '---', 'fiscal'
exec sp_descricao_campo  'ponto_fiscal', 'dt_alt', '---', 'fiscal'
exec sp_descricao_campo  'ponto_fiscal', 'id', '---', 'fiscal'
exec sp_descricao_campo  'ponto_fiscal', 'nome', '---', 'fiscal'
go
 
/**********************************************
 *** tabela requisitos_paf
 **********************************************/
exec sp_descricao_tabela 'requisitos_paf', '---', 'fiscal'
exec sp_descricao_campo  'requisitos_paf', 'perfil', '---', 'fiscal'
exec sp_descricao_campo  'requisitos_paf', 'requerido', '---', 'fiscal'
exec sp_descricao_campo  'requisitos_paf', 'requisito', '---', 'fiscal'
exec sp_descricao_campo  'requisitos_paf', 'subitem', '---', 'fiscal'
go
 
/**********************************************
 *** tabela script
 **********************************************/
exec sp_descricao_tabela 'script', '---', 'fiscal'
exec sp_descricao_campo  'script', 'dt_exec', '---', 'fiscal'
exec sp_descricao_campo  'script', 'script', '---', 'fiscal'
exec sp_descricao_campo  'script', 'versao', '---', 'fiscal'
go
 
/**********************************************
 *** tabela situacao_tributaria
 **********************************************/
exec sp_descricao_tabela 'situacao_tributaria', '---', 'fiscal'
exec sp_descricao_campo  'situacao_tributaria', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'situacao_tributaria', 'ent_sai', '---', 'fiscal'
exec sp_descricao_campo  'situacao_tributaria', 'nome', '---', 'fiscal'
exec sp_descricao_campo  'situacao_tributaria', 'tributo', '---', 'fiscal'
go
 
/**********************************************
 *** view vw_config_terminal_fiscal
 **********************************************/
exec sp_descricao_tabela 'vw_config_terminal_fiscal', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'host_fg', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'impressora', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'impressora_backup', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'impressora_backup_id', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'impressora_id', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'maquina_id', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'modelo_sat', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'nome', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'ponto_fiscal', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'ponto_fiscal_id', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'ponto_impressao', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'ponto_impressao_id', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'porta', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'porta_backup', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'porta_ecf', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'porta_fg', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'tipo', '---', 'fiscal'
exec sp_descricao_campo  'vw_config_terminal_fiscal', 'versao_sat', '---', 'fiscal'
go
 
/**********************************************
 *** view vw_maquina_ecf
 **********************************************/
exec sp_descricao_tabela 'vw_maquina_ecf', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'bairro', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'cep', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'cidade', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'cnpj', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'complemento', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'contato', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'data_sb', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'dt_hr_estoque', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'ecf_id', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'endereco', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'fax', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'gt', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'hora_sb', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'id', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'ie', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'im', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'liberado', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'maquina_id', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'marca', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'modelo', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'num_serie', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'numero', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'razao', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'telefone', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'tot_ven', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'uf', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_ecf', 'versao_sb', '---', 'fiscal'
go
 
/**********************************************
 *** view vw_maquina_impressao
 **********************************************/
exec sp_descricao_tabela 'vw_maquina_impressao', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_impressao', 'balcao', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_impressao', 'entrega', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_impressao', 'ficha', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_impressao', 'gerencial', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_impressao', 'impressao_id', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_impressao', 'maquina_id', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_impressao', 'mesa', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_impressao', 'nenhum', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_impressao', 'nome', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_impressao', 'pasta', '---', 'fiscal'
exec sp_descricao_campo  'vw_maquina_impressao', 'template', '---', 'fiscal'
go
 
/**********************************************
 *** view vw_material
 **********************************************/
exec sp_descricao_tabela 'vw_material', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'aliq_cofins', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'aliq_ecf', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'aliq_icms_iss', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'aliq_pis', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'ativo', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'cest', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'cfop', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'cod_grupo', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'cod_ncm', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'codigo_aliquota', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'codigo_servico', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'cst_cofins', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'cst_icms', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'cst_pis', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'descricao', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'grupo', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'grupo_id', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'iat', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'id', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'ippt', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'item_lista_servico', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'prod_origem', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'reducao_bc_icms', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'tipo_aliquota', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'unidade', '---', 'fiscal'
exec sp_descricao_campo  'vw_material', 'venda', '---', 'fiscal'
go
 
/**********************************************
 *** view vw_meios_ecf
 **********************************************/
exec sp_descricao_tabela 'vw_meios_ecf', '---', 'fiscal'
exec sp_descricao_campo  'vw_meios_ecf', 'descricao', '---', 'fiscal'
exec sp_descricao_campo  'vw_meios_ecf', 'ecf_serie', '---', 'fiscal'
exec sp_descricao_campo  'vw_meios_ecf', 'forma_pgto', '---', 'fiscal'
exec sp_descricao_campo  'vw_meios_ecf', 'id', '---', 'fiscal'
go
 
/**********************************************
 *** view vw_meios_fg
 **********************************************/
exec sp_descricao_tabela 'vw_meios_fg', '---', 'fiscal'
exec sp_descricao_campo  'vw_meios_fg', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'vw_meios_fg', 'descricao', '---', 'fiscal'
exec sp_descricao_campo  'vw_meios_fg', 'id', '---', 'fiscal'
exec sp_descricao_campo  'vw_meios_fg', 'nome', '---', 'fiscal'
go
 
/**********************************************
 *** view vw_parametro
 **********************************************/
exec sp_descricao_tabela 'vw_parametro', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro', 'modo_venda_id', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro', 'valor', '---', 'fiscal'
go
 
/**********************************************
 *** view vw_parametro_cadastro
 **********************************************/
exec sp_descricao_tabela 'vw_parametro_cadastro', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'altera_com_periodo_aberto', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'categ', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'cod', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'descr', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'detalhes', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'list_sql', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'lista', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'mascara', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'modo_venda_id', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'nomeDaClasse', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'subcateg', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'tipo_param', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'tipo_valor', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'valor', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'valor_default', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'valor_max', '---', 'fiscal'
exec sp_descricao_campo  'vw_parametro_cadastro', 'valor_min', '---', 'fiscal'
go
 
/**********************************************
 *** view vw_venda
 **********************************************/
exec sp_descricao_tabela 'vw_venda', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda', 'comprovante_valido', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda', 'coo', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda', 'dt_abertura', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda', 'hr_abertura', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda', 'mesa', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda', 'num_serie', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda', 'valido', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda', 'valor', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda', 'venda_valida', '---', 'fiscal'
go
 
/**********************************************
 *** view vw_venda_item
 **********************************************/
exec sp_descricao_tabela 'vw_venda_item', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda_item', 'codigo', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda_item', 'descricao', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda_item', 'dt_abertura', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda_item', 'hr_abertura', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda_item', 'mesa', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda_item', 'qtd', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda_item', 'und', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda_item', 'valido', '---', 'fiscal'
exec sp_descricao_campo  'vw_venda_item', 'vl_unit', '---', 'fiscal'
go
