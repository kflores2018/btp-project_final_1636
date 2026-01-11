@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption - Item 1636'
@Metadata.allowExtensions: true
define view entity Z_C_SALESORD_I_1636
  as projection on Z_I_SALESORD_I_1636
{
  key header_id as HeaderID,
  key id,
      name,
      description,
      releasedate,
      discontinueddate,
      price,
      @Semantics.quantity.unitOfMeasure : 'unitofmeasure'
      height,
      @Semantics.quantity.unitOfMeasure : 'unitofmeasure'
      width,
      depth,
      quantity,
      unitofmeasure,
      _Header : redirected to parent Z_C_SALESORD_H_1636
}
