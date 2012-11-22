xquery version "1.0" encoding "UTF-8";
import module namespace modul="http://example.com/modul" at "file:/home/cris/Disertatie/KP2PMXML/KPlato2PMXML.xql";
declare namespace xf = "http://www.w3.org/2002/xforms";
declare namespace ev = "http://www.w3.org/2001/xml-events"; 
declare default element namespace "http://www.w3.org/1999/xhtml"; 

(:let $pro:=<?oxygen NVDLSchema="file:/C:/Program%20Files%20(x86)/Oxygen%20XML%20Editor%2012/samples/nvdl/xhtml-xforms.nvdl"?>:)

let $pro1:=5

return 
   ( 
   <ProjectManagementSchema xmlns="http://www.pacificedge.com/PMXML" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.pacificedge.com/PMXML file:/home/cris/Disertatie/KP2PMXML/pmxml_schema.xsd">
    {modul:metadata()}
    {modul:resources()}
    {modul:projects()}
    </ProjectManagementSchema>
    )