xquery version "1.0" encoding "UTF-8";
import module namespace modul="http://example.com/modul" at "file:/home/cris/Disertatie/PMXML2YAWL/PMXML2YAWL.xql";
declare namespace xf = "http://www.w3.org/2002/xforms";
declare namespace ev = "http://www.w3.org/2001/xml-events"; 
declare default element namespace "http://www.w3.org/1999/xhtml"; 

(:let $pro:=<?oxygen NVDLSchema="file:/C:/Program%20Files%20(x86)/Oxygen%20XML%20Editor%2012/samples/nvdl/xhtml-xforms.nvdl"?>:)

let $pro1:=5

return 
   ( 
    <specificationSet xmlns="http://www.yawlfoundation.org/yawlschema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.2"
                          xsi:schemaLocation="http://www.yawlfoundation.org/yawlschema file:/home/cris/Disertatie/PMXML2YAWL/YAWL_Schema2.2.xsd">
    {modul:metadata()}
    {modul:layout()}
    </specificationSet>
    )
