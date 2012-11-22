xquery version "1.0" encoding "UTF-8";
module namespace modul="http://example.com/modul" ;
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";
declare default element namespace "http://www.w3.org/1999/xhtml";

declare function modul:metadata() as element()*
{
    let $metadata := ( 
    <metaData>
      <creator>cris</creator>
      <description>No description has been given.</description>
      <version>1.1</version>
      <persistent>false</persistent>
      <identifier>UID_bb69af42-714e-4a05-87dc-6d11cad683be</identifier>
    </metaData>
    )
        
  return $metadata
};

declare function modul:maintask() as node()* 
{ 
    let $maintask :=  let $name := doc("maindoc.xml")/*/*/*[@wbs]/@name
                        let $mtask := (
    <decomposition id="Eto" isRootNet="true" xsi:type="NetFactsType">
      <processControlElements>
        <inputCondition id="InputCondition">
          <flowsInto>
            <nextElementRef id="{$name[1]}" />
          </flowsInto>
        </inputCondition>
        {       for $task at $j in doc("maindoc.xml")/*/*/*[@wbs]
                    let $name := $task/@name
                    let $j := $j+1                    
               return 
        <task id="{$name}">
          <name>{data($name)}</name>
          <flowsInto>
            <nextElementRef id="{if (doc("maindoc.xml")/*/*/*[@wbs][$j]/@name != '' ) then doc("maindoc.xml")/*/*/*[@wbs][$j]/@name else "OutputCondition"}" />
           </flowsInto>
          <join code="xor" />
          <split code="and" />
          <decomposesTo id="{$name}" />
        </task> }
        <outputCondition id="OutputCondition" />
         </processControlElements>
        </decomposition> )
       return $mtask
return $maintask

};

declare function modul:task() as node()* 
{ 
    let $taskval := for $task in doc("maindoc.xml")/*/*/*[@wbs]
                    let $name := $task/@name
                     
                    let $var := (
             
    <decomposition id="{$name}" xsi:type="NetFactsType">
         <processControlElements>
            <inputCondition id="InputCondition">
                <flowsInto>
                    <nextElementRef id="{$task/*[@wbs][1]/@name}" />
                </flowsInto>
            </inputCondition>
           { 
             
             for  $subtask at $i in $task/*[@wbs]/@name
             let $i := $i+1
               return 
            <task id="{$subtask}">
                <name>
                  {data($subtask)}
                </name>
                <flowsInto>
                    <nextElementRef id="{if ($task/*[@wbs][$i]/@name != '' ) then $task/*[@wbs][$i]/@name else "OutputCondition"}" />
                </flowsInto>
                <join code="xor" />
                <split code="and" />
            </task>
            }
            <outputCondition id="OutputCondition" />
         </processControlElements>
        </decomposition> )
        
        return  $var
    return $taskval    
       
 };


declare function modul:layout() as element()*
{   let $name := doc("maindoc.xml")/*/*/*[@wbs]/@name
    let $layout := ( 
    <layout>
    <locale language="en" country="US" />
    <specification id="Eto">
      <size w="137" h="117" />
      {for $task in doc("maindoc.xml")/*/*/*[@wbs]
                    let $name := $task/@name                   
                    return 
                    <net id="{$name}">
                        <bounds x="0" y="0" w="1198" h="285" />
                        <frame x="2" y="24" w="1201" h="288" />
                        <viewport x="0" y="0" w="1201" h="288" />
                        <vertex id="InputCondition">
                        <attributes>
                            <bounds x="36.0" y="112.0" w="32.0" h="32.0" />
                        </attributes>
                        </vertex>
                        <vertex id="OutputCondition">
                        <attributes>
                            <bounds x="676.0" y="112.0" w="32.0" h="32.0" />
                        </attributes>
                        </vertex>
                        { for $subtask in $task/*[@wbs]/@name
                    return
                        <container id="{$subtask}">
                            <vertex>
                                <attributes>
                                    <bounds x="328.0" y="48.0" w="32.0" h="32.0" />
                                </attributes>
                            </vertex>
                            <label>
                                <attributes>
                                    <bounds x="296.0" y="80.0" w="96.0" h="18.0" />
                                </attributes>
                            </label>
                        </container>}
                        <flow source="InputCondition" target="">
          <ports in="13" out="12" />
          <attributes>
            <lineStyle>11</lineStyle>
          </attributes>
        </flow>
                        { for $subtask at $k in $task/*[@wbs]/@name
                            let $k := $k+1
                    return
                        <flow source="{$subtask}" target="{if (data($task/*[@wbs][$k]/@name) != '') then $task/*[@wbs][$k]/@name else "OutputCondition"}">  
                            <ports in="13" out="12" />  
                                <attributes>
                                    <lineStyle>11</lineStyle>
                                </attributes>
                        </flow>}
                    </net>
                    }
                    <net id="Eto">
        <bounds x="0" y="0" w="1198" h="285" />
        <frame x="2" y="24" w="1201" h="288" />
        <viewport x="0" y="0" w="1201" h="288" />
        <vertex id="InputCondition">
          <attributes>
            <bounds x="36.0" y="112.0" w="32.0" h="32.0" />
          </attributes>
        </vertex>
        <vertex id="OutputCondition">
          <attributes>
            <bounds x="1124.0" y="112.0" w="32.0" h="32.0" />
          </attributes>
        </vertex>
        <flow source="InputCondition" target="{$name[1]}">
          <ports in="13" out="12" />
          <attributes>
            <lineStyle>11</lineStyle>
          </attributes>
        </flow>
        {for $task at $j in doc("maindoc.xml")/*/*/*[@wbs]
         let $name := $task/@name
         let $j := $j+1                    
         return 
        <flow source="{$name}" target="{if (doc("maindoc.xml")/*/*/*[@wbs][$j]/@name != '' ) then doc("maindoc.xml")/*/*/*[@wbs][$j]/@name else "OutputCondition"}">
          <ports in="13" out="12" />
          <attributes>
            <lineStyle>11</lineStyle>
          </attributes>
        </flow>}
        {for $task at $j in doc("maindoc.xml")/*/*/*[@wbs]
         let $name := $task/@name
         let $j := $j+1                    
         return 
         <container id="{$name}">
          <vertex>
            <attributes>
              <bounds x="132.0" y="112.0" w="32.0" h="32.0" />
            </attributes>
          </vertex>
          <label>
            <attributes>
              <bounds x="100.0" y="144.0" w="96.0" h="18.0" />
            </attributes>
          </label>
        </container>}
        </net>
    </specification>
    </layout>
    )
    return $layout
};

