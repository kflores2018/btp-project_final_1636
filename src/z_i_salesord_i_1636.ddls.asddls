@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_SALESORD_I_1636 as select from zsalesord_i_1636 as Item
 association to parent Z_I_SALESORD_H_1636 as _Header on
 $projection.header_id = _Header.header_id
 
{   
      key header_id,
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
      unitofmeasure ,    
      _Header
}
