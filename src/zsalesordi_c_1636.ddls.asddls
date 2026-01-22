@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Item 1636'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'ItemID' ]
define view entity ZSALESORDI_C_1636 as projection on ZSALESORDI_R_1636
{
    key ItemUUID,
    HeaderUUID,
    @Search.defaultSearchElement: true
    ItemID,
    Name,
    Description,
    Releasedate,
    Discontinueddate,
    Price,
    @Semantics.quantity.unitOfMeasure: 'Unitofmeasure'
    Height,
    @Semantics.quantity.unitOfMeasure: 'Unitofmeasure'
    Width,
    Depth,
    Quantity,
    Unitofmeasure,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    /* Associations */
    _Header : redirected to parent ZSALESORDH_C_1636    
}
