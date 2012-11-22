xquery version "1.0" encoding "UTF-8";
import module namespace modul="http://example.com/modul" at "file:///../home/cris/Dizertatie/Yawl/KPlatoinYAWL.xql";
declare namespace xf = "http://www.w3.org/2002/xforms";
declare namespace ev = "http://www.w3.org/2001/xml-events"; 
declare default element namespace "http://www.w3.org/1999/xhtml"; 

let $pro:=<?oxygen NVDLSchema="file:/C:/Program%20Files%20(x86)/Oxygen%20XML%20Editor%2012/samples/nvdl/xhtml-xforms.nvdl"?>

return 
   ( 
   <specificationSet xmlns="http://www.yawlfoundation.org/yawlschema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.2">
   <specification uri="Eto">
    {modul:metadata()} 
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" />
    {modul:maintask()}
    {modul:task()} 
    </specification>
    {modul:layout()}
    </specificationSet>
    )
    

   

