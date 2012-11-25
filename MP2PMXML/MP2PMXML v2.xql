xquery version "1.0" encoding "UTF-8";
module namespace modul="http://example.com/modul" ;
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace transform="http://exist-db.org/xquery/transform";
declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";
declare default element namespace "http://www.w3.org/1999/xhtml";

declare function modul:metadata() as element()*
{   
    let $leader := string(doc("sample.xml")/*/*[name()='Author'])
    let $date := string(doc("sample.xml")/*/*[name()='LastSaved'])
    let $projectname := string(doc("sample.xml")/*/*[name()='Subject'])
    let $metadata := ( 
                        <InstanceData xmlns="">
                            <UserID>1</UserID>
                            <UserName>{$leader}</UserName>
                            <AppName>2007</AppName>
                            <AppVersion>2007</AppVersion>
                            <Generated>{$date}</Generated>
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
    {for $resource in doc("sample.xml")/*/*[name()='Resources']/*[name()='Resource']
    return
    <PoolResource xmlns="" ResourceID="{string($resource/*[name()='ID'])}">
            <PersistentID>{string($resource/*[name()='UID'])}</PersistentID>
            <FormattedName>{string($resource/*[name()='Name'])}</FormattedName>
            <FirstName></FirstName>
            <LastName></LastName>
            <MiddleName></MiddleName>
            <Initials>{string($resource/*[name()='Initials'])}</Initials>
            <EmailAddress></EmailAddress>
            <MaxQuantity>{string($resource/*[name()='MaxUnits'])}</MaxQuantity>
            <Type>{string($resource/*[name()='Type'])}</Type>
            <Cost>{string($resource/*[name()='Cost'])}</Cost>
            <OvertimeCost>{string($resource/*[name()='OvertimeCost'])}</OvertimeCost>
            <Rate>{string($resource/*[name()='StandardRate'])}</Rate>
            <OvertimeWork>{substring-after(substring-before($resource/*[name()='OvertimeWork'],'H'), 'PT')}</OvertimeWork>
            <PlannedStart></PlannedStart>
            <PlannedFinish></PlannedFinish>
            <ActualStart></ActualStart>
            <ActualFinish></ActualFinish>
            <ActualWork>{substring-after(substring-before($resource/*[name()='ActualWork'],'H'), 'PT')}</ActualWork>
            <ActualOvertimeWork>{substring-after(substring-before($resource/*[name()='ActualOvertimeWork'],'H'), 'PT')}</ActualOvertimeWork>
            <ActualCost>{string($resource/*[name()='ActualCost'])}</ActualCost>
            <ActualOvertimeCost>{string($resource/*[name()='ActualOvertimeCost'])}</ActualOvertimeCost>
            <RemainingWork>{substring-after(substring-before($resource/*[name()='RemainingWork'],'H'), 'PT')}</RemainingWork>
            <RemainingOvertimeWork>{substring-after(substring-before($resource/*[name()='RemainingOvertimeWork'],'H'), 'PT')}</RemainingOvertimeWork>
            <RemainingCost>{string($resource/*[name()='RemainingCost'])}</RemainingCost>
            <RemainingOvertimeCost>{string($resource/*[name()='RemainingOvertimeCost'])}</RemainingOvertimeCost>
            <ACWP>{string($resource/*[name()='ACWP'])}</ACWP>
            <BCWP>{string($resource/*[name()='BCWP'])}</BCWP>
            <BCWS>{string($resource/*[name()='BCWS'])}</BCWS>
            <CostVariance>{string($resource/*[name()='CostVariance'])}</CostVariance>
            <EarlyStart></EarlyStart>
            <EarlyFinish></EarlyFinish>
            <LateStart></LateStart>
            <LateFinish></LateFinish>
        </PoolResource>}
        </PoolResources> )
    
        
  return $resources
};



declare function modul:projects() as element()*
{
    
    let $projectname := string(doc("sample.xml")/*/*[name()='Subject'])
    let $leader := string(doc("sample.xml")/*/*[name()='Author'])
    let $title := string(doc("sample.xml")/*/*[name()='Title'])
    let $lastmodified := string(doc("sample.xml")/*/*[name()='LastSaved'])
    let $startdate := string(doc("sample.xml")/*/*[name()='StartDate'])
    let $finishdate := string(doc("sample.xml")/*/*[name()='FinishDate'])
    let $company := string(doc("sample.xml")/*/*[name()='Company'])
    let $manager := string(doc("sample.xml")/*/*[name()='Manager'])
    let $dayspermonth := string(doc("sample.xml")/*/*[name()='DaysPerMonth'])
    let $hoursperday := string(doc("sample.xml")/*/*[name()='MinutesPerDay'] div 60)
    let $hoursperweek := string(doc("sample.xml")/*/*[name()='MinutesPerWeek'] div 60)
    let $weekstartdate := string(doc("sample.xml")/*/*[name()='WeekStartDay'])
    let $projects :=( <Projects count="0">
    {for $project in doc("sample.xml")/*[name()='Project']
    return 
        <Project xmlns="" ProjectID="1">
            <PersistentID application="1">1</PersistentID>
            <ProjectName>{$projectname}</ProjectName>
            <LastModified>{$lastmodified}</LastModified>
            <Description></Description>
            <Title>{$title}</Title>
            <Author>{$leader}</Author>
            <Category></Category>
            <Company>{$company}</Company>
            <StatusDate></StatusDate>
            <Manager>{$manager}</Manager>
            <Subject>{$projectname}</Subject>
            <CreatedDate></CreatedDate>
            <HoursPerDay>{$hoursperday}</HoursPerDay> 
            <DaysPerMonth>{$dayspermonth}</DaysPerMonth>
            <WeekStartDay>{$weekstartdate}</WeekStartDay>
            <HoursPerWeek>{$hoursperweek}</HoursPerWeek> 
            <PlannedStart>{$startdate}</PlannedStart>
            <PlannedFinish>{$finishdate}</PlannedFinish>
            <Resources>
             {
                for $resource in doc("sample.xml")/*/*[name()='Resources']/*[name()='Resource']
                return
                <Resource ResourceID="{string($resource/*[name()='ID'])}"/>
              }
            </Resources> 
            <Tasks>
              {
                for $task in doc("sample.xml")/*/*[name()='Tasks']/*[name()='Task']
                return
                <Task TaskID="{string($task/*[name()='ID'])}">
                    <PersistentID>{string($task/*[name()='UID'])}</PersistentID>
                    <TaskName>{string($task/*[name()='Name'])}</TaskName>
                    <IsSummary>{string($task/*[name()='Summary'])}</IsSummary>
                    <OutlineLevel>{string($task/*[name()='OutlineLevel'])}</OutlineLevel>
                    <TaskOrderID>{string($task/*[name()='ID'])}</TaskOrderID>
                    <ParentTaskID>{if (contains(data($task/*[name()='WBS']), '.')) then xs:integer(substring-before(data($task/*[name()='WBS']),'.')) else 0 }</ParentTaskID>
                    <FixedCost>{xs:decimal(data($task/*[name()='FixedCost']))}</FixedCost>  
                    <IsMilestone>{string($task/*[name()='Milestone'])}</IsMilestone> 
                    <IsCritical>{string($task/*[name()='Critical'])}</IsCritical> 
                    <TaskNotes>{string($task/*[name()='Notes'])}</TaskNotes>
                    <PercentComplete>{string($task/*[name()='PercentComplete'])}</PercentComplete>
                    <PercentWorkComplete>{string($task/*[name()='PercentWorkComplete'])}</PercentWorkComplete>  
                    <Priority>{data($task/*[name()='Priority'])}</Priority>
                    <WBS>{data($task/*[name()='WBS'])}</WBS>
                    <PlannedStart></PlannedStart>
                    <PlannedFinish></PlannedFinish>
                    <PlannedDuration>{substring-after(substring-before($task/*[name()='Duration'],'H'), 'PT')}</PlannedDuration>
                    <ActualStart>{string($task/*[name()='Start'])}</ActualStart>
                    <ActualFinish>{string($task/*[name()='Finish'])}</ActualFinish>
                    <ActualDuration>{substring-after(substring-before($task/*[name()='ActualDuration'],'H'), 'PT')}</ActualDuration>
                    <ActualWork>{substring-after(substring-before($task/*[name()='ActualWork'],'H'), 'PT')}</ActualWork>
                    <ActualOvertimeWork>{substring-after(substring-before($task/*[name()='ActualOvertimeWork'],'H'), 'PT')}</ActualOvertimeWork>
                    <ActualCost>{string($task/*[name()='ActualCost'])}</ActualCost>
                    <ActualOvertimeCost>{string($task/*[name()='ActualOvertimeCost'])}</ActualOvertimeCost>
                    <RemainingDuration>{substring-after(substring-before($task/*[name()='RemainingDuration'],'H'), 'PT')}</RemainingDuration>
                    <RemainingWork>{substring-after(substring-before($task/*[name()='RemainingWork'],'H'), 'PT')}</RemainingWork>
                    <RemainingOvertimeWork>{substring-after(substring-before($task/*[name()='RemainingOvertimeWork'],'H'), 'PT')}</RemainingOvertimeWork>
                    <RemainingCost>{string($task/*[name()='RemainingCost'])}</RemainingCost>
                    <RemainingOvertimeCost>{string($task/*[name()='RemainingOvertimeCost'])}</RemainingOvertimeCost>
                    <ACWP>{string($task/*[name()='ACWP'])}</ACWP>
                    <BCWP>{string($task/*[name()='BCWP'])}</BCWP>
                    <BCWS>{string($task/*[name()='BCWS'])}</BCWS>
                    <StartVariance>{string($task/*[name()='StartVariance'])}</StartVariance>
                    <FinishVariance>{string($task/*[name()='FinishVariance'])}</FinishVariance>
                    <EarlyStart>{string($task/*[name()='EarlyStart'])}</EarlyStart>
                    <EarlyFinish>{string($task/*[name()='EarlyFinish'])}</EarlyFinish>
                    <LateStart>{string($task/*[name()='LateStart'])}</LateStart>
                    <LateFinish>{string($task/*[name()='LateFinish'])}</LateFinish>
                    <TotalSlack>{string($task/*[name()='TotalSlack'])}</TotalSlack>
                    <FreeSlack>{string($task/*[name()='FreeSlack'])}</FreeSlack>  
                </Task>
                } 
            </Tasks>
            <Assignments>
            {
                for $assignment in doc("sample.xml")/*/*[name()='Assignments']/*[name()='Assignments']
                return
               <Assignment AssignmentID="{string($assignment/*[name()='UID'])}" ResourceID="{string($assignment/*[name()='ResourceUID'])}" TaskID="{string($assignment/*[name()='TaskUID'])}">
                    <PersistentID>{string($assignment/*[name()='UID'])}</PersistentID>
                    <ResourcePersistentID>{string($assignment/*[name()='ResourceUID'])}</ResourcePersistentID>
                    <TaskPersistentID>{string($assignment/*[name()='TaskUID'])}</TaskPersistentID>
                    <Quantity>{string($assignment/*[name()='Units'])}</Quantity>
                    <ActualStart>{string($assignment/*[name()='Start'])}</ActualStart>
                    <ActualFinish>{string($assignment/*[name()='Finish'])}</ActualFinish>
                    <ActualWork>{string($assignment/*[name()='ActualWork'])}</ActualWork>
                    <ActualOvertimeWork>{string($assignment/*[name()='ActualOvertimeWork'])}</ActualOvertimeWork>
                    <ActualCost>{string($assignment/*[name()='ActualCost'])}</ActualCost>
                    <ActualOvertimeCost>{string($assignment/*[name()='ActualOvertimeCost'])}</ActualOvertimeCost>
                    <RemainingWork>{string($assignment/*[name()='RemainingWork'])}</RemainingWork>
                    <RemainingOvertimeWork>{string($assignment/*[name()='RemainingOvertimeWork'])}</RemainingOvertimeWork>
                    <RemainingCost>{string($assignment/*[name()='RemainingCost'])}</RemainingCost>
                    <RemainingOvertimeCost>{string($assignment/*[name()='RemainingOvertimeCost'])}</RemainingOvertimeCost>
                    <ACWP>{string($assignment/*[name()='ACWP'])}</ACWP>
                    <BCWP>{string($assignment/*[name()='BCWP'])}</BCWP>
                    <BCWS>{string($assignment/*[name()='BCWS'])}</BCWS>
                    <StartVariance>{string($assignment/*[name()='StartVariance'])}</StartVariance>
                    <FinishVariance>{string($assignment/*[name()='FinishVariance'])}</FinishVariance>
                    <CostVariance>{string($assignment/*[name()='CostVariance'])}</CostVariance>
                    <PercentWorkComplete>{string($assignment/*[name()='PercentWorkComplete'])}</PercentWorkComplete>
                </Assignment>
                }
            </Assignments> 
        </Project>}
        </Projects>)
        
      return $projects

}; 

