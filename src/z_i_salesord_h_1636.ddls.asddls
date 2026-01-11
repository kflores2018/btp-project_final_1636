@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_SALESORD_H_1636
  as select from zsalesord_h_1636 as Header
  composition [0..*] of Z_I_SALESORD_I_1636 as _Item 
{
  
  key header_id,
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
      _Item
}
