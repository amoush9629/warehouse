/*

  Program : warehouse.p

  Purpose : warehouse Maintenance

*/

 

define variable l_Warehouse    like Warehouse.WarehouseNum no-undo.

define buffer buf_warehouse   for warehouse.

 

form

    l_Warehouse        colon 19

    WarehouseName      colon 19

    Warehouse.County   colon 19

    Warehouse.Address   colon 19

    Warehouse.Address2  colon 19

with frame a width 80 side-labels.

 

repeat :

  update  l_Warehouse with frame a.

  find Warehouse no-lock

    where Warehouse.WarehouseNum = l_Warehouse no-error.

  if not available Warehouse then do:

     create warehouse.

              assign Warehouse.WarehouseNum = l_Warehouse.

  end. /*if not available Warehouse then do:*/

  update

    
   WarehouseName     

   Warehouse.County  

   Warehouse.Address   

   Warehouse.Address2  

  with frame a.  

end. /*repeat*/

 