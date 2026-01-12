@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Header 1636'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSALESORDH_I_1636
  provider contract transactional_interface
  as projection on ZSALESORDH_R_1636
{
  key HeaderUUID,
      HeaderID,
      Email,
      Firstname,
      Lastname,
      Country,
      Createon,
      Deliverydate,
      Orderstatus,
      Imageurl,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Item : redirected to composition child ZSALESORDI_I_1636      
}
