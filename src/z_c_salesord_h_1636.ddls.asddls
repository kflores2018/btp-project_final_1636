@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption - Header 1636'
@Metadata.allowExtensions: true
define root view entity Z_C_SALESORD_H_1636 as projection on Z_I_SALESORD_H_1636
{
      key header_id as HeaderID,
      email,
      firstname,
      lastname,
      country,
      createon,
      deliverydate,
      orderstatus,
      imageurl,
      @Semantics.user.createdBy: true
      create_by,
      @Semantics.systemDateTime.createdAt: true
      create_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,         
      _Item : redirected to composition child Z_C_SALESORD_I_1636
      
}
