xquery version "1.0" encoding "UTF-8";
module namespace modul="http://example.com/modul" ;
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";
declare default element namespace "http://www.w3.org/1999/xhtml";

declare function modul:metadata() as element()*
{   
    let $application_name := string(doc("maindoc.xml")/*[name()='kplato']/@editor)
    let $application_version := string(doc("maindoc.xml")/*[name()='kplato']/@version)
    let $userid := string(doc("maindoc.xml")/*/*/@id)
    let $leader := string(doc("maindoc.xml")/*/*/@leader)
    let $projectname := string(doc("maindoc.xml")/*/*/@name)
    let $metadata := ( 
                        <InstanceData xmlns="">
                            <UserID>1</UserID>
                            <UserName>{$leader}</UserName>
                            <AppName>1</AppName>
                            <AppVersion>{$application_version}</AppVersion>
                            <Generated></Generated>
                            <SchemaVersion></SchemaVersion>
                            <Projects>
                                    <ProjectName projectID="1">{$projectname}</ProjectName>
                            </Projects>
                        </InstanceData>
                      )
        
  return $metadata
};


declare function modul:resources() as element()*
{
    let $resources :=( <PoolResources>
    {for $resource in doc("maindoc.xml")/*/*/*[name()='resource-group']/*[name()='resource']
    return
    <PoolResource xmlns="" ResourceID="1">
            <PersistentID>1</PersistentID>
            <FormattedName>{string($resource/@name)}</FormattedName>
            <FirstName></FirstName>
            <LastName></LastName>
            <MiddleName></MiddleName>
            <Initials>{string($resource/@initials)}</Initials>
            <EmailAddress>{string($resource/@email)}</EmailAddress>
            <MaxQuantity>{string($resource/@units)}</MaxQuantity>
            <Type>{if (string($resource/@type)='Work') then '1' else '0'}</Type>
            <Cost>{substring-after($resource/@normal-rate, '€ ')}</Cost>
            <OvertimeCost>{substring-after($resource/@overtime-rate, '€ ')}</OvertimeCost>
            <PlannedStart>{string($resource/@available-from)}</PlannedStart>
            <PlannedFinish>{string($resource/@available-until)}</PlannedFinish>
            <ActualStart></ActualStart>
            <ActualFinish></ActualFinish>
            <AvailableFrom>{string($resource/@available-from)}</AvailableFrom>
            <AvailableTo>{string($resource/@available-until)}</AvailableTo> 
        </PoolResource>}
        </PoolResources> )
    
        
  return $resources
};



declare function modul:projects() as element()*
{
    let $projectname := string(doc("maindoc.xml")/*/*/@name)
    let $description := string(doc("maindoc.xml")/*/*/@description)
    let $leader := string(doc("maindoc.xml")/*/*/@leader)
    let $start-time:= string(doc("maindoc.xml")/*/*/@start-time)
    let $end-time := string(doc("maindoc.xml")/*/*/@end-time)
    let $projects :=( <Projects count="0">
    {for $project in doc("maindoc.xml")/*/*[name()='project']
    return 
        <Project xmlns="" ProjectID="1">
            <PersistentID application="1">1</PersistentID>
            <ProjectName>{$projectname}</ProjectName>
            <LastModified></LastModified>
            <Description>{$description}</Description>
            <Title>{$projectname}</Title>
            <Author>{$leader}</Author>
            <Category></Category>
            <Company></Company>
            <StatusDate></StatusDate>
            <Manager>{$leader}</Manager>
            <Subject>{$projectname}</Subject>
            <CreatedDate></CreatedDate>
            <HoursPerDay>{substring-before(string($project/standard-worktime/@day), 'h')}</HoursPerDay>
            <DaysPerMonth>{xs:int(substring-before(string($project/standard-worktime/@month), 'h')) div xs:int(substring-before(string($project/standard-worktime/@day), 'h'))}</DaysPerMonth>
            <HoursPerWeek>{substring-before(string($project/standard-worktime/@week), 'h')}</HoursPerWeek>
            <PlannedStart>{$start-time}</PlannedStart>
            <PlannedFinish>{$end-time}</PlannedFinish>
            <ActualStart></ActualStart>
            <ActualFinish></ActualFinish>     
            <EarlyStart></EarlyStart>
            <EarlyFinish></EarlyFinish>
            <LateStart></LateStart>
            <LateFinish></LateFinish>
            <Resources>
             {
                for $resource in doc("maindoc.xml")/*/*/*[name()='resource-group']/*[name()='resource']
                return
                <Resource ResourceID="1"/>
              }
            </Resources>
            <Tasks>
              {
                for $task in doc("maindoc.xml")/*/*/*[name()='task']
                return
                <Task TaskID="1">
                    <PersistentID>1</PersistentID>
                    <TaskName>{string($task/@name)}</TaskName>
                    <IsSummary>1</IsSummary>
                    <OutlineLevel>0</OutlineLevel>
                    <TaskOrderID>{xs:int(data($task/@wbs))}</TaskOrderID>
                    <ParentTaskID>0</ParentTaskID>
                    <ParentPersistentID>0</ParentPersistentID>
                    <IsMilestone>0</IsMilestone>
                    <IsCritical>{string($task/*[name()='schedules']/*[name()='schedule']/@in-critical-path)}</IsCritical>
                    <TaskNotes></TaskNotes>
                  <!--  <PercentComplete></PercentComplete>
                    <PercentWorkComplete></PercentWorkComplete>
                    <Priority></Priority> -->
                    <WBS>{string($task/@wbs)}</WBS>
                    <PlannedStart>{string($task/@constraint-starttime)}</PlannedStart>
                    <PlannedFinish>{string($task/@constraint-endtime)}</PlannedFinish>
                    <ActualStart>{string($task/*[name()='schedules']/*[name()='schedule']/@start)}</ActualStart>
                    <ActualFinish>{string($task/*[name()='schedules']/*[name()='schedule']/@finish)}</ActualFinish>
              <!--      <ActualDuration>{string($task/*[name()='schedules']/*[name()='schedule']/@duration)}</ActualDuration> -->  
                    <EarlyStart>{string($task/*[name()='schedules']/*[name()='schedule']/@earlystart)}</EarlyStart>
                    <EarlyFinish></EarlyFinish>
                    <LateStart></LateStart>
                    <LateFinish>{string($task/*[name()='schedules']/*[name()='schedule']/@latefinish)}</LateFinish> 
                </Task>
                }  
                {
                for $subtask in doc("maindoc.xml")/*/*/*[name()='task']/*[name()='task']
                return
                <Task TaskID="1">
                    <PersistentID>1</PersistentID>
                    <TaskName>{string($subtask/@name)}</TaskName>
                    <IsSummary>0</IsSummary>
                    <OutlineLevel>0</OutlineLevel>
                    <TaskOrderID>{xs:int(substring-after(data($subtask/@wbs), '.'))}</TaskOrderID>
                    <ParentTaskID>{xs:int(substring-before($subtask/@wbs, '.'))}</ParentTaskID>
                    <ParentPersistentID>{xs:int(substring-before($subtask/@wbs, '.'))}</ParentPersistentID>
                    <IsMilestone>0</IsMilestone>
                    <IsCritical>{string($subtask/*[name()='schedules']/*[name()='schedule']/@in-critical-path)}</IsCritical>
                    <TaskNotes>{string($subtask/*[name()='progress']/*[name()='completition-entry']/@note)}</TaskNotes>
                   <!--  <PercentComplete>{xs:int(string($subtask/*[name()='progress']/*[name()='completition-entry']/@percent-finished))}</PercentComplete>
                    <PercentWorkComplete></PercentWorkComplete>
                    <Priority></Priority> -->
                    <WBS>{string($subtask/@wbs)}</WBS>
                    <PlannedStart>{string($subtask/@constraint-starttime)}</PlannedStart>
                    <PlannedFinish>{string($subtask/@constraint-endtime)}</PlannedFinish>
                    <ActualStart>{string($subtask/*[name()='schedules']/*[name()='schedule']/@start)}</ActualStart>
                    <ActualFinish>{string($subtask/*[name()='schedules']/*[name()='schedule']/@end)}</ActualFinish>
                <!--    <ActualDuration>{string($subtask/*[name()='schedules']/*[name()='schedule']/@duration)}</ActualDuration> 
                    <RemainingDuration>{string($subtask/*[name()='progress']/*[name()='completition-entry']/@remaining-effort)}</RemainingDuration> -->
                    <EarlyStart>{string($subtask/*[name()='schedules']/*[name()='schedule']/@earlystart)}</EarlyStart>
                    <EarlyFinish>{string($subtask/*[name()='schedules']/*[name()='schedule']/@earlyfinish)}</EarlyFinish>
                    <LateStart>{string($subtask/*[name()='schedules']/*[name()='schedule']/@latestart)}</LateStart>
                    <LateFinish>{string($subtask/*[name()='schedules']/*[name()='schedule']/@latefinish)}</LateFinish>  
                </Task>
                }  
            </Tasks>
            <Assignments>
            {
                for $appointment in doc("maindoc.xml")/*/*/*[name()='schedules']/*[name()='plan']/*[name()='schedule']/*[name()='appointment']
                return
                <Assignment AssignmentID="1" ResourceID="1" TaskID="1">
                    <PersistentID>1</PersistentID>
                    <ResourcePersistentID>1</ResourcePersistentID>
                    <TaskPersistentID>1</TaskPersistentID>
                    <Quantity>0</Quantity>
                    <Notes></Notes>
                    <PlannedStart></PlannedStart>
                    <PlannedFinish></PlannedFinish> 
                    <ActualStart>{string($appointment/interval[1]/@start)}</ActualStart>
                    <ActualFinish>{string($appointment/interval[last()]/@end)}</ActualFinish>  
                    <EarlyStart></EarlyStart>
                    <EarlyFinish></EarlyFinish>
                    <LateStart></LateStart>
                    <LateFinish></LateFinish>
                </Assignment>
                }
            </Assignments>
        </Project>}
        </Projects>)
    
        
  return $projects
};

