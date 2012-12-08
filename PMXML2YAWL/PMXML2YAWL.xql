xquery version "1.0" encoding "UTF-8";
module namespace modul="http://example.com/modul" ;
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";
declare default element namespace "http://www.w3.org/1999/xhtml";

declare function modul:metadata() as element()*
{   
    let $creator := string(doc("output.xml")/*/*[name()='InstanceData']/*[name()='UserName'])
    let $date := substring-before(doc("output.xml")/*/*[name()='InstanceData']/*[name()='Generated'],'T')
    let $projectname := string(doc("output.xml")/*/*[name()='Projects']/*[name()='Project']/*[name()='ProjectName'])
    let $description := string(doc("output.xml")/*/*[name()='Projects']/*[name()='Project']/*[name()='Description'])
    let $subject := string(doc("output.xml")/*/*/*[name()='Project']/*[name()='Subject'])
    let $title := string(doc("output.xml")/*/*/*[name()='Project']/*[name()='Title'])
    let $metadata := ( 
                        <specification uri="http://www.oxygenxml.com/">
                            <name>{$projectname}</name>
                            <documentation>{$description}</documentation>
                            <metaData>
                                <title>{$title}</title>
                                <creator>{$creator}</creator>
                                <subject>{$subject}</subject>
                                <description>{$description}</description>
                                <created>{$date}</created> 
                                <version>0.1</version>
                                <persistent>false</persistent>
                                <identifier>UID_0a155373-c2ae-4307-a8bb-6c3905062143</identifier>
                            </metaData>
                            <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" />
                            <decomposition id="New_Net_1" isRootNet="true" xsi:type="NetFactsType">
                                <processControlElements>
                                   <inputCondition id="InputCondition_1">
                                     <flowsInto>
                                       <nextElementRef id="ID{data(doc("output.xml")/*/*[name()='Projects']/*[name()='Project']/*[name()='Tasks']/*[name()='Task'][1]/*[name()='TaskOrderID'])}" />
                                     </flowsInto>
                                   </inputCondition>
                                  { for $task in doc("output.xml")/*/*[name()='Projects']/*[name()='Project']/*[name()='Tasks']/*[name()='Task']
                                  return
                                   <task id="ID{string($task/*[name()='TaskOrderID'])}">
                                     <name>{string($task/*[name()='TaskName'])}</name>
                                     <flowsInto>
                                       <nextElementRef id="{if (string($task/*[name()='TaskOrderID'])=data(doc("output.xml")/*/*[name()='Projects']/*[name()='Project']/*[name()='Tasks']/*[name()='Task'][last()]/*[name()='TaskOrderID'])) then 'OutputCondition_2' else concat('ID',string($task/*[name()='TaskOrderID']+1))}" />
                                     </flowsInto>
                                     <join code="xor" />
                                     <split code="and" />
                                   </task>
                                   }
                                   <outputCondition id="OutputCondition_2" />
                                </processControlElements>
                               </decomposition>
                        </specification>
                      )
        
  return $metadata
};


declare function modul:layout() as element()*
{
 let $projectname := string(doc("output.xml")/*/*[name()='Projects']/*[name()='Project']/*[name()='ProjectName'])
 let $id := string(doc("output.xml")/*/*[name()='Projects']/*[name()='Project']/*[name()='PersistentID'])
 let $layout := (
                   <layout>
                     <locale language="en" country="US" />
                     <specification id="id1">
                       <size w="118" h="27" />
                       <net id="id1">
                         <bounds x="-141" y="0" w="1696" h="384" />
                         <frame x="2" y="24" w="505" h="275" />
                         <viewport x="0" y="0" w="505" h="275" />
                         <vertex id="InputCondition_1">
                             <attributes>
                               <bounds x="0.0" y="120.0" w="32.0" h="32.0" />
                             </attributes>
                         </vertex>
                         <vertex id="OutputCondition_2">
                             <attributes>
                               <bounds x="1644.0" y="108.0" w="32.0" h="32.0" />
                             </attributes>
                         </vertex>  
                        { for $task at $v in doc("output.xml")/*/*[name()='Projects']/*[name()='Project']/*[name()='Tasks']/*[name()='Task']
                            let $x_v := 72.0
                            let $y_v := 108.0
                            let $w_v := 32.0
                            let $h_v := 32.0
                            let $x_l := 40.0
                            let $y_l := 140.0
                            let $w_l := 96.0
                            let $h_l := 36.0
                         return
                         <container id="ID{string($task/*[name()='TaskOrderID'])}">
                            <vertex>
                                <attributes>
                                    <bounds x="{$x_v}" y="{$y_v}" w="{$w_v}" h="{$h_v}" />
                                </attributes>
                            </vertex>
                            <label>
                                <attributes>
                                    <bounds x="{$x_l}" y="{$y_l}" w="{$w_l}" h="{$h_l}" />
                                </attributes>
                            </label>
                         </container>
                         }
                          <flow source="InputCondition_1" target="ID{data(doc("output.xml")/*/*[name()='Projects']/*[name()='Project']/*[name()='Tasks']/*[name()='Task'][1]/*[name()='TaskOrderID'])}">
                            <ports in="13" out="12" />
                            <attributes>
                              <lineStyle>11</lineStyle>
                            </attributes>
                          </flow>
                         { for $task in doc("output.xml")/*/*[name()='Projects']/*[name()='Project']/*[name()='Tasks']/*[name()='Task']
                         return
                          <flow source="ID{string($task/*[name()='TaskOrderID'])}" target="{if (string($task/*[name()='TaskOrderID'])=data(doc("output.xml")/*/*[name()='Projects']/*[name()='Project']/*[name()='Tasks']/*[name()='Task'][last()]/*[name()='TaskOrderID'])) then 'OutputCondition_2' else concat('ID',string($task/*[name()='TaskOrderID']+1))}">
                            <ports in="13" out="12" />
                            <attributes>
                              <lineStyle>11</lineStyle>
                            </attributes>
                          </flow>
                          }
                        </net>
                     </specification>
                   </layout>
                )
 return $layout

};