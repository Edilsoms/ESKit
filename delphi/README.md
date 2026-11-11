# ESKit para Delphi (VCL)

Versão VCL do ESKit: os mesmos componentes da versão Lazarus, com a mesma API, para usar no Delphi.

* **TEsFx\*** — estilo **FireMonkey** dentro da VCL: formas com anti-aliasing, sombra e brilho, gradientes, animações (`TEsFxFloatAnimation`, `TEsFxColorAnimation`, `TEsFxAnimator`), estilos claro/escuro, Switch, TrackBar, ArcProgress, AniIndicator, `TEsFxTabControl` (abas com transição), `TEsFxListBox` (cabeçalhos, checkboxes, rolagem cinética), desfoque (`Blur`) e vidro fosco (`BackgroundBlur`)…
* **TEs\*** — estilo **DevExpress**: `TEsGrid` (agrupamento, filtro, pesquisa, sumários, bandas, cartões, mestre-detalhe, exportação), `TEsToolBarGrid`, editores com botões, NavBar, Ribbon (acesso rápido, galerias, abas contextuais, KeyTips) e `TEsSkinController`.
* **EsDB** — `TEsConnection`, `TEsQuery`, `TEsTable`, `TEsCommand`, `TEsMemTable` sobre o **FireDAC**.

## Instalação

Abra e instale, nesta ordem:

| Pacote | Tipo | Conteúdo |
|---|---|---|
| `packages\ESKit.dpk` | runtime | componentes visuais, exportação e impressão |
| `packages\ESKitDB.dpk` | runtime | `EsDB` (FireDAC + SQLite estático) |
| `packages\ESKitDBOracle.dpk` | runtime, opcional | `EsDBOracle`: driver Oracle do FireDAC (`DriverID 'Ora'`); só nas edições Enterprise e Architect do Delphi. Nas edições Community e Professional o pacote `FireDACOracleDriver` não existe (erro E2202): não compile este pacote; os outros não dependem dele |
| `packages\dclESKit.dpk` | design | registro na paleta (**ESKit FMX**, **ESKit FMX Animations**, **ESKit Express**, **ESKit DB**), editor de `TAlphaColor`, lista de `DriverID` e editores de componente do TabControl ("Nova aba", próxima/anterior) e da ListBox (editor de itens) |

Compile `ESKit.dpk` e `ESKitDB.dpk` (e, se for usar Oracle, `ESKitDBOracle.dpk`) e depois instale `dclESKit.dpk`. Acrescente a pasta `source` ao *Library path* (ou ao *Search path* do projeto). O demo está em `examples\demo\ESKitDemo.dpr`.

Requisitos: Delphi 10.x ou mais recente (usa `TArray<T>`, `System.Zip`, `System.ZLib`, `System.ImageList`; `CurrentPPI` é usado a partir do 10.3). O SQLite é linkado no executável, sem DLL, a partir do Delphi 10.4 (`FireDAC.Phys.SQLiteWrapper.Stat`).

## Diferenças em relação à versão Lazarus

A documentação dos componentes está no [README da versão Lazarus](../lazarus/README.md); vale para as duas versões, com estas diferenças:

| Assunto | Lazarus | Delphi |
|---|---|---|
| Banco | `EsDB` sobre SQLDB | `EsDB` sobre FireDAC (`TEsConnection = TFDConnection` + `DriverID`, `DatabaseName`, `HostName`, `UserName`, `Password`, `Port`) |
| Oracle | `EsDBOracle` + `DriverID 'Ora'` sobre o conector do SQLDB; aceita também `HostName` | `EsDBOracle` + `DriverID 'Ora'` sobre o driver do FireDAC; servidor e serviço só em `DatabaseName` (com `HostName` ou `Port` preenchidos a conexão para com uma explicação) |
| Commit automático | `AutoCommit` do ESKit | o do FireDAC (`TxOptions.AutoCommit`) |
| `TEsQuery.FetchAll` | padrão `True` (todos os registros na abertura) | espelha `FetchOptions.Mode`; padrão do FireDAC = sob demanda |
| Parâmetros por nome | `ExecSQL(SQL, ['id'], [10])` | igual (`TEsConnection.ExecSQL`/`ExecSQLScalar`, `TEsQuery.ExecSQL`/`Open`) |
| Senha no formulário | `StorePassword` (padrão `False`) | igual; os parâmetros vão para o `.dfm` em `ConnectionParams`, sem a linha `Password` |
| Arquivos XLSX | `Zipper` do FPC | `System.Zip` |
| Fontes do PDF Unicode | Arial/Liberation/DejaVu do sistema | `arial.ttf` / `arialbd.ttf` do Windows; reservas `seguisym.ttf`, `segoeui.ttf`, `msyh.ttc`, `simsun.ttc`, `malgun.ttf`… |
| Impressão | `Printer4Lazarus` | `Vcl.Printers` |
| Ordem das abas (`TEsFxTabItem.Index`) | `SetControlIndex` | `SetChildOrder` |
| Perfil Delphi da IDE, units `Vcl.*` de compatibilidade | existem (só fazem sentido no Lazarus) | — |

## Como o código é mantido

As units da pasta `source` são geradas a partir da versão Lazarus por `tools/lazarus2delphi.py` (troca de units, mensagens VCL no lugar dos métodos virtuais da LCL, `TArray<T>`, `System.Zip`, etc.):

```
python3 tools/lazarus2delphi.py            # regrava delphi/source
python3 tools/lazarus2delphi.py --check    # mostra o que mudaria
```

São mantidas à mão (APIs muito diferentes entre LCL e VCL): `EsGraphics`, `EsTheme`, `EsDB`, `EsPropEdits` e `ESKitReg`. Para corrigir algo nas units geradas, corrija na versão Lazarus e rode o script; se a correção só fizer sentido no Delphi, acrescente uma regra ao script.

Os fontes, pacotes e projetos são gravados em UTF-8 com BOM e quebras de linha CRLF: o Delphi precisa do BOM para ler os acentos, e a IDE se perde ao alterar um `.dpk` com quebras só LF. O `.gitattributes` da raiz mantém o CRLF ao clonar o repositório.

## Validação

Esta versão não foi compilada num Delphi real. O código foi verificado com o Free Pascal em modo Delphi, trocando as units VCL por equivalentes da LCL, e o demo foi executado assim (grade, temas, linha de filtro, abas e listas FX). Ao compilar no Delphi, avise se aparecer algum erro.
