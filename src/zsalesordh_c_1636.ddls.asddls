@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Header 1636'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZSALESORDH_C_1636
 provider contract transactional_query
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
      LocalCreateBy,
      LocalCreateAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Item : redirected to composition child ZSALESORDI_C_1636      
}
