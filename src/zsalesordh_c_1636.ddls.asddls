@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Header 1636'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'HeaderID' ]
define root view entity ZSALESORDH_C_1636
 provider contract transactional_query
  as projection on ZSALESORDH_R_1636
{
  key HeaderUUID,
  
      @Search.defaultSearchElement: true
      HeaderID,
      Email,
      Firstname,
      Lastname,
      Country,
      Createon,
      Deliverydate,
      @EndUserText.label: 'Orden Estado'      
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIR_ELEM_SADL_C1636'
      virtual EstadoOrden: abap.char( 10 ),
      Orderstatus,                   
      Imageurl,
      LocalCreateBy,
      LocalCreateAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Item : redirected to composition child ZSALESORDI_C_1636      
}
