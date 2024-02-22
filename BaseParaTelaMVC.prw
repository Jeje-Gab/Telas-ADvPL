#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'
#INCLUDE 'fwmbrowse.ch'

// Func Pai (Engloba tela MVC)
User Function TPadMVC()
  Local aArea := GetArea()
  Local oBrowse
  Private aRotina := MenuDef()

  oBrowse := FWMBrowse():New()

  oBrowse:SetAlias("ZA1")
  oBrowse:AddLegend( "ZA1_MARCA!='Fiat' .AND. ZA1_MARCA!='Toyota'","RED","Outro" )
  oBrowse:AddLegend( "ZA1_MARCA=='Toyota'","YELLOW","Toyota" )
  oBrowse:AddLegend( "ZA1_MARCA=='Fiat'","BLUE","Fiat" )

  oBrowse:SetDescription("Cadastro de Carro")

  oBrowse:SetMenuDef("TPadMVC")
  oBrowse:Activate()
  
  RestArea(aArea)
Return NIL

// Retorna MENUS do Browse
Static Function MenuDef()
	Local aArea      := GetArea()
	Local aRotina    := {}

	ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.TPadMVC' OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.TPadMVC' OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.TPadMVC' OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.TPadMVC' OPERATION 5 ACCESS 0
	ADD OPTION aRotina TITLE 'Imprimir' ACTION 'VIEWDEF.TPadMVC' OPERATION 8 ACCESS 0
	ADD OPTION aRotina TITLE 'Copiar' ACTION 'VIEWDEF.TPadMVC' OPERATION 9 ACCESS 0

  RestArea(aArea)
Return aRotina

// Model (Regra de Negocio)
Static Function ModelDef()

  oStrutZA1 := FWFormStruct():New(1,"ZA1") 
  oModel := MPFormModel():New('TPadMVC_M')

  oModel:AddFields('ZA1MASTER', /*cOwner*/,oStrutZA1)
  oModel:Description("Inclusão de carros")

  oModel:GetModel('ZA1MASTER'):Description("Dados - Item carro")
return oModel

// View (Teslas geradas a partir das informações obtidas do Model)
Static Function ViewDef()
  oModel := FWLoadModel('TPadMVC')
  oView := FWFormView():New()

  oView:SetModel(oModel)

  oView:AddField('VIEW_ZA1',oStrutZA1,'ZA1MASTER') 

  oView:CreateHorizontalBox( 'TELA' , 100 )

  oView:SetOwnerView( 'VIEW_ZA1', 'TELA' )
Return oView



