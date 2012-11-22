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
            <PersistentID>{string($resource/*[name()='ID'])}</PersistentID>
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
            <!--<PlannedDuration></PlannedDuration>
            <PlannedWork></PlannedWork>
            <PlannedOvertimeWork></PlannedOvertimeWork>
            <PlannedCost></PlannedCost>
            <PlannedOvertimeCost></PlannedOvertimeCost>-->
            <ActualStart></ActualStart>
            <ActualFinish></ActualFinish>
          <!--  <ActualDuration></ActualDuration> -->
            <ActualWork>{substring-after(substring-before($resource/*[name()='ActualWork'],'H'), 'PT')}</ActualWork>
            <ActualOvertimeWork>{substring-after(substring-before($resource/*[name()='ActualOvertimeWork'],'H'), 'PT')}</ActualOvertimeWork>
            <ActualCost>{string($resource/*[name()='ActualCost'])}</ActualCost>
            <ActualOvertimeCost>{string($resource/*[name()='ActualOvertimeCost'])}</ActualOvertimeCost>
           <!-- <BaselineStart></BaselineStart>
            <BaselineFinish></BaselineFinish>
            <BaselineDuration></BaselineDuration>
            <BaselineWork></BaselineWork>
            <BaselineOvertimeWork></BaselineOvertimeWork>
            <BaselineCost></BaselineCost>
            <BaselineOvertimeCost></BaselineOvertimeCost>
            <RemainingDuration></RemainingDuration> -->
            <RemainingWork>{substring-after(substring-before($resource/*[name()='RemainingWork'],'H'), 'PT')}</RemainingWork>
            <RemainingOvertimeWork>{substring-after(substring-before($resource/*[name()='RemainingOvertimeWork'],'H'), 'PT')}</RemainingOvertimeWork>
            <RemainingCost>{string($resource/*[name()='RemainingCost'])}</RemainingCost>
            <RemainingOvertimeCost>{string($resource/*[name()='RemainingOvertimeCost'])}</RemainingOvertimeCost>
            <ACWP>{string($resource/*[name()='ACWP'])}</ACWP>
            <BCWP>{string($resource/*[name()='BCWP'])}</BCWP>
            <BCWS>{string($resource/*[name()='BCWS'])}</BCWS>
          <!--  <StartVariance></StartVariance>
            <FinishVariance></FinishVariance> -->
            <CostVariance>{string($resource/*[name()='CostVariance'])}</CostVariance>
            <EarlyStart></EarlyStart>
            <EarlyFinish></EarlyFinish>
            <LateStart></LateStart>
            <LateFinish></LateFinish>
           <!-- <TotalSlack></TotalSlack>
            <FreeSlack></FreeSlack> 
            <MaterialLabel></MaterialLabel>
            <CustomCosts>
                <Cost01></Cost01>
                <Cost02></Cost02>
                <Cost03></Cost03>
            </CustomCosts> 
            <CustomFinishDates>
                <FinishDate01></FinishDate01>
                <FinishDate02></FinishDate02>
                <FinishDate03></FinishDate03>
            </CustomFinishDates>
            <CustomFlags>
                <Flag01></Flag01>
                <Flag02></Flag02>
                <Flag03></Flag03>
            </CustomFlags>  
            <CustomNumbers>
                <Number01></Number01>
                <Number02></Number02>
                <Number03></Number03>
            </CustomNumbers> 
            <CustomStartDates>
                <StartDate01></StartDate01>
                <StartDate02></StartDate02>
                <StartDate03></StartDate03>
            </CustomStartDates>
            <CustomText>
                <Text01></Text01>
                <Text02></Text02>
                <Text03></Text03>
            </CustomText>
            <CustomWork>
                <Work01></Work01>
                <Work02></Work02>
                <Work03></Work03>
            </CustomWork>
            <RateSchedule>
                <Start></Start>
                <Finish></Finish>
                <Rate></Rate>
                <RateUnits></RateUnits>
            </RateSchedule>
            <AvailableFrom></AvailableFrom>
            <AvailableTo></AvailableTo>
            <Availability resourceID="">
                <Start></Start>
                <Finish></Finish>
                <Quantity></Quantity>
            </Availability> 
            <ExtendedAttributes>
                <ExtendedAttribute AttributeID="" count=""></ExtendedAttribute>
                <ExtendedAttribute AttributeID="" count=""></ExtendedAttribute>
                <ExtendedAttribute AttributeID="" count=""></ExtendedAttribute>
                <ExtendedAttribute AttributeID="" count=""></ExtendedAttribute>
            </ExtendedAttributes> -->
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
         <!--   <HoursPerDay></HoursPerDay> -->
            <DaysPerMonth>{$dayspermonth}</DaysPerMonth>
         <!--   <WeekStartDay></WeekStartDay>
            <YearStartMonth></YearStartMonth>
            <HoursPerWeek></HoursPerWeek> -->
            <PlannedStart>{$startdate}</PlannedStart>
            <PlannedFinish>{$finishdate}</PlannedFinish>
          <!--  <PlannedDuration></PlannedDuration>
            <PlannedWork></PlannedWork>
            <PlannedOvertimeWork></PlannedOvertimeWork>
            <PlannedCost></PlannedCost>
            <PlannedOvertimeCost></PlannedOvertimeCost> 
            <ActualStart></ActualStart>
            <ActualFinish></ActualFinish>
            <ActualDuration></ActualDuration>
            <ActualWork></ActualWork>
            <ActualOvertimeWork></ActualOvertimeWork>
            <ActualCost></ActualCost>
            <ActualOvertimeCost></ActualOvertimeCost>
            <BaselineStart></BaselineStart>
            <BaselineFinish></BaselineFinish>
            <BaselineDuration></BaselineDuration>
            <BaselineWork></BaselineWork>
            <BaselineOvertimeWork></BaselineOvertimeWork>
            <BaselineCost></BaselineCost>
            <BaselineOvertimeCost></BaselineOvertimeCost>
            <RemainingDuration></RemainingDuration>
            <RemainingWork></RemainingWork>
            <RemainingOvertimeWork></RemainingOvertimeWork>
            <RemainingCost></RemainingCost>
            <RemainingOvertimeCost></RemainingOvertimeCost>
            <ACWP></ACWP>
            <BCWP></BCWP>
            <BCWS></BCWS>
            <StartVariance></StartVariance>
            <FinishVariance></FinishVariance>
            <CostVariance></CostVariance>
            <EarlyStart></EarlyStart>
            <EarlyFinish></EarlyFinish>
            <LateStart></LateStart>
            <LateFinish></LateFinish>
            <TotalSlack></TotalSlack>
            <FreeSlack></FreeSlack>
            <CustomCosts>
                <Cost01></Cost01>
                <Cost02></Cost02>
                <Cost03></Cost03>
            </CustomCosts>
            <CustomFinishDates>
                <FinishDate01></FinishDate01>
                <FinishDate02></FinishDate02>
                <FinishDate03></FinishDate03>
            </CustomFinishDates>
            <CustomFlags>
                <Flag01></Flag01>
                <Flag02></Flag02>
                <Flag03></Flag03>
            </CustomFlags>
            <CustomNumbers>
                <Number01></Number01>
                <Number02></Number02>
                <Number03></Number03>
            </CustomNumbers>
            <CustomStartDates>
                <StartDate01></StartDate01>
                <StartDate02></StartDate02>
                <StartDate03></StartDate03>
            </CustomStartDates>
            <CustomText>
                <Text01></Text01>
                <Text02></Text02>
                <Text03></Text03>
            </CustomText>
            <CustomWork>
                <Work01></Work01>
                <Work02></Work02>
                <Work03></Work03>
            </CustomWork>
            <ExtendedAttributeDefs>
                <ExtendedAttributeDef ID="-1073741773">
                    <Object>Object12</Object>
                    <FieldLength>0</FieldLength>
                    <DataType>DataType12</DataType>
                    <FieldName>FieldName12</FieldName>
                </ExtendedAttributeDef>
                <ExtendedAttributeDef ID="-1073741773">
                    <Object>Object13</Object>
                    <FieldLength>0</FieldLength>
                    <DataType>DataType13</DataType>
                    <FieldName>FieldName13</FieldName>
                </ExtendedAttributeDef>
                <ExtendedAttributeDef ID="-1073741773">
                    <Object>Object14</Object>
                    <FieldLength>0</FieldLength>
                    <DataType>DataType14</DataType>
                    <FieldName>FieldName14</FieldName>
                </ExtendedAttributeDef>
            </ExtendedAttributeDefs>
            <ExtendedAttributes>
                <ExtendedAttribute AttributeID="-1073741773" count="0">ExtendedAttribute28</ExtendedAttribute>
                <ExtendedAttribute AttributeID="-1073741773" count="0">ExtendedAttribute29</ExtendedAttribute>
                <ExtendedAttribute AttributeID="-1073741773" count="0">ExtendedAttribute30</ExtendedAttribute>
            </ExtendedAttributes> -->
            <LocalResources count="0">
                <LocalResource ResourceID="-1073741773">
                    <PersistentID application="0">-1073741773</PersistentID>
                    <FormattedName>FormattedName16</FormattedName>
                    <FirstName>FirstName16</FirstName>
                    <LastName>LastName16</LastName>
                    <MiddleName>MiddleName16</MiddleName>
                    <Initials>Initials16</Initials>
                    <EmailAddress>EmailAddress16</EmailAddress>
                    <IsOverallocated>0</IsOverallocated>
                    <MaxQuantity>0</MaxQuantity>
                    <Notes>Notes28</Notes>
                    <Type>0</Type>
                    <Cost>0</Cost>
                    <OvertimeCost>0</OvertimeCost>
                    <Rate>0</Rate>
                    <OvertimeWork>0</OvertimeWork>
                    <PlannedStart>PlannedStart44</PlannedStart>
                    <PlannedFinish>PlannedFinish44</PlannedFinish>
                    <PlannedDuration>0</PlannedDuration>
                    <PlannedWork>0</PlannedWork>
                    <PlannedOvertimeWork>0</PlannedOvertimeWork>
                    <PlannedCost>0</PlannedCost>
                    <PlannedOvertimeCost>0</PlannedOvertimeCost>
                    <ActualStart>ActualStart44</ActualStart>
                    <ActualFinish>ActualFinish44</ActualFinish>
                    <ActualDuration>0</ActualDuration>
                    <ActualWork>0</ActualWork>
                    <ActualOvertimeWork>0</ActualOvertimeWork>
                    <ActualCost>0</ActualCost>
                    <ActualOvertimeCost>0</ActualOvertimeCost>
                    <BaselineStart>BaselineStart44</BaselineStart>
                    <BaselineFinish>BaselineFinish44</BaselineFinish>
                    <BaselineDuration>0</BaselineDuration>
                    <BaselineWork>0</BaselineWork>
                    <BaselineOvertimeWork>0</BaselineOvertimeWork>
                    <BaselineCost>0</BaselineCost>
                    <BaselineOvertimeCost>0</BaselineOvertimeCost>
                    <RemainingDuration>0</RemainingDuration>
                    <RemainingWork>0</RemainingWork>
                    <RemainingOvertimeWork>0</RemainingOvertimeWork>
                    <RemainingCost>0</RemainingCost>
                    <RemainingOvertimeCost>0</RemainingOvertimeCost>
                    <ACWP>0</ACWP>
                    <BCWP>0</BCWP>
                    <BCWS>0</BCWS>
                    <StartVariance>0</StartVariance>
                    <FinishVariance>0</FinishVariance>
                    <CostVariance>0</CostVariance>
                    <EarlyStart>EarlyStart44</EarlyStart>
                    <EarlyFinish>EarlyFinish44</EarlyFinish>
                    <LateStart>LateStart44</LateStart>
                    <LateFinish>LateFinish44</LateFinish>
                    <TotalSlack>-1073741773</TotalSlack>
                    <FreeSlack>-1073741773</FreeSlack>
                    <MaterialLabel>MaterialLabel16</MaterialLabel>
                    <CustomCosts>
                    </CustomCosts>
                    <CustomFinishDates>
                    </CustomFinishDates>
                    <CustomFlags>
                    </CustomFlags>
                    <CustomNumbers>
                    </CustomNumbers>
                    <CustomStartDates>
                    </CustomStartDates>
                    <CustomText>
                    </CustomText>
                    <CustomWork>
                    </CustomWork>
                    <RateSchedule>
                        <Rate>0</Rate>
                        <RateUnits>USD</RateUnits>
                    </RateSchedule>
                    <AvailableFrom>AvailableFrom16</AvailableFrom>
                    <AvailableTo>
                    </AvailableTo>
                    <Availability resourceID="-1073741773">
                    </Availability>
                    <Availability resourceID="-1073741773">
                    </Availability>
                    <Availability resourceID="-1073741773">
                    </Availability>
                    <Availability resourceID="-1073741773">
                    </Availability>
                    <ExtendedAttributes>
                    </ExtendedAttributes>
                </LocalResource>
                <LocalResource ResourceID="-1073741773">
                    <PersistentID application="0">-1073741773</PersistentID>
                    <FormattedName>FormattedName17</FormattedName>
                    <FirstName>FirstName17</FirstName>
                    <LastName>LastName17</LastName>
                    <MiddleName>MiddleName17</MiddleName>
                    <Initials>Initials17</Initials>
                    <EmailAddress>EmailAddress17</EmailAddress>
                    <IsOverallocated>0</IsOverallocated>
                    <MaxQuantity>0</MaxQuantity>
                    <Notes>Notes29</Notes>
                    <Type>0</Type>
                    <Cost>0</Cost>
                    <OvertimeCost>0</OvertimeCost>
                    <Rate>0</Rate>
                    <OvertimeWork>0</OvertimeWork>
                    <PlannedStart>PlannedStart45</PlannedStart>
                    <PlannedFinish>PlannedFinish45</PlannedFinish>
                    <PlannedDuration>0</PlannedDuration>
                    <PlannedWork>0</PlannedWork>
                    <PlannedOvertimeWork>0</PlannedOvertimeWork>
                    <PlannedCost>0</PlannedCost>
                    <PlannedOvertimeCost>0</PlannedOvertimeCost>
                    <ActualStart>ActualStart45</ActualStart>
                    <ActualFinish>ActualFinish45</ActualFinish>
                    <ActualDuration>0</ActualDuration>
                    <ActualWork>0</ActualWork>
                    <ActualOvertimeWork>0</ActualOvertimeWork>
                    <ActualCost>0</ActualCost>
                    <ActualOvertimeCost>0</ActualOvertimeCost>
                    <BaselineStart>BaselineStart45</BaselineStart>
                    <BaselineFinish>BaselineFinish45</BaselineFinish>
                    <BaselineDuration>0</BaselineDuration>
                    <BaselineWork>0</BaselineWork>
                    <BaselineOvertimeWork>0</BaselineOvertimeWork>
                    <BaselineCost>0</BaselineCost>
                    <BaselineOvertimeCost>0</BaselineOvertimeCost>
                    <RemainingDuration>0</RemainingDuration>
                    <RemainingWork>0</RemainingWork>
                    <RemainingOvertimeWork>0</RemainingOvertimeWork>
                    <RemainingCost>0</RemainingCost>
                    <RemainingOvertimeCost>0</RemainingOvertimeCost>
                    <ACWP>0</ACWP>
                    <BCWP>0</BCWP>
                    <BCWS>0</BCWS>
                    <StartVariance>0</StartVariance>
                    <FinishVariance>0</FinishVariance>
                    <CostVariance>0</CostVariance>
                    <EarlyStart>EarlyStart45</EarlyStart>
                    <EarlyFinish>EarlyFinish45</EarlyFinish>
                    <LateStart>LateStart45</LateStart>
                    <LateFinish>LateFinish45</LateFinish>
                    <TotalSlack>-1073741773</TotalSlack>
                    <FreeSlack>-1073741773</FreeSlack>
                    <MaterialLabel>MaterialLabel17</MaterialLabel>
                    <CustomCosts>
                    </CustomCosts>
                    <CustomFinishDates>
                    </CustomFinishDates>
                    <CustomFlags>
                    </CustomFlags>
                    <CustomNumbers>
                    </CustomNumbers>
                    <CustomStartDates>
                    </CustomStartDates>
                    <CustomText>
                    </CustomText>
                    <CustomWork>
                    </CustomWork>
                    <RateSchedule>
                        <Rate>0</Rate>
                        <RateUnits>USD</RateUnits>
                    </RateSchedule>
                    <AvailableFrom>AvailableFrom17</AvailableFrom>
                    <AvailableTo>
                    </AvailableTo>
                    <Availability resourceID="-1073741773">
                    </Availability>
                    <Availability resourceID="-1073741773">
                    </Availability>
                    <Availability resourceID="-1073741773">
                    </Availability>
                    <Availability resourceID="-1073741773">
                    </Availability>
                    <ExtendedAttributes>
                    </ExtendedAttributes>
                </LocalResource>
                <LocalResource ResourceID="-1073741773">
                    <PersistentID application="0">-1073741773</PersistentID>
                    <FormattedName>FormattedName18</FormattedName>
                    <FirstName>FirstName18</FirstName>
                    <LastName>LastName18</LastName>
                    <MiddleName>MiddleName18</MiddleName>
                    <Initials>Initials18</Initials>
                    <EmailAddress>EmailAddress18</EmailAddress>
                    <IsOverallocated>0</IsOverallocated>
                    <MaxQuantity>0</MaxQuantity>
                    <Notes>Notes30</Notes>
                    <Type>0</Type>
                    <Cost>0</Cost>
                    <OvertimeCost>0</OvertimeCost>
                    <Rate>0</Rate>
                    <OvertimeWork>0</OvertimeWork>
                    <PlannedStart>PlannedStart46</PlannedStart>
                    <PlannedFinish>PlannedFinish46</PlannedFinish>
                    <PlannedDuration>0</PlannedDuration>
                    <PlannedWork>0</PlannedWork>
                    <PlannedOvertimeWork>0</PlannedOvertimeWork>
                    <PlannedCost>0</PlannedCost>
                    <PlannedOvertimeCost>0</PlannedOvertimeCost>
                    <ActualStart>ActualStart46</ActualStart>
                    <ActualFinish>ActualFinish46</ActualFinish>
                    <ActualDuration>0</ActualDuration>
                    <ActualWork>0</ActualWork>
                    <ActualOvertimeWork>0</ActualOvertimeWork>
                    <ActualCost>0</ActualCost>
                    <ActualOvertimeCost>0</ActualOvertimeCost>
                    <BaselineStart>BaselineStart46</BaselineStart>
                    <BaselineFinish>BaselineFinish46</BaselineFinish>
                    <BaselineDuration>0</BaselineDuration>
                    <BaselineWork>0</BaselineWork>
                    <BaselineOvertimeWork>0</BaselineOvertimeWork>
                    <BaselineCost>0</BaselineCost>
                    <BaselineOvertimeCost>0</BaselineOvertimeCost>
                    <RemainingDuration>0</RemainingDuration>
                    <RemainingWork>0</RemainingWork>
                    <RemainingOvertimeWork>0</RemainingOvertimeWork>
                    <RemainingCost>0</RemainingCost>
                    <RemainingOvertimeCost>0</RemainingOvertimeCost>
                    <ACWP>0</ACWP>
                    <BCWP>0</BCWP>
                    <BCWS>0</BCWS>
                    <StartVariance>0</StartVariance>
                    <FinishVariance>0</FinishVariance>
                    <CostVariance>0</CostVariance>
                    <EarlyStart>EarlyStart46</EarlyStart>
                    <EarlyFinish>EarlyFinish46</EarlyFinish>
                    <LateStart>LateStart46</LateStart>
                    <LateFinish>LateFinish46</LateFinish>
                    <TotalSlack>-1073741773</TotalSlack>
                    <FreeSlack>-1073741773</FreeSlack>
                    <MaterialLabel>MaterialLabel18</MaterialLabel>
                    <CustomCosts>
                    </CustomCosts>
                    <CustomFinishDates>
                    </CustomFinishDates>
                    <CustomFlags>
                    </CustomFlags>
                    <CustomNumbers>
                    </CustomNumbers>
                    <CustomStartDates>
                    </CustomStartDates>
                    <CustomText>
                    </CustomText>
                    <CustomWork>
                    </CustomWork>
                    <RateSchedule>
                        <Rate>0</Rate>
                        <RateUnits>USD</RateUnits>
                    </RateSchedule>
                    <AvailableFrom>AvailableFrom18</AvailableFrom>
                    <AvailableTo>
                    </AvailableTo>
                    <Availability resourceID="-1073741773">
                    </Availability>
                    <Availability resourceID="-1073741773">
                    </Availability>
                    <Availability resourceID="-1073741773">
                    </Availability>
                    <Availability resourceID="-1073741773">
                    </Availability>
                    <ExtendedAttributes>
                    </ExtendedAttributes>
                </LocalResource>
            </LocalResources>
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
                    <PersistentID>{string($task/*[name()='ID'])}</PersistentID>
                    <TaskName>{string($task/*[name()='Name'])}</TaskName>
                    <IsSummary>true</IsSummary>
                    <OutlineLevel>1</OutlineLevel>
                    <TaskOrderID>1</TaskOrderID>
                    <ParentTaskID>1</ParentTaskID>
                 <!--   <ParentPersistentID></ParentPersistentID>
                    <FixedCost></FixedCost> 
                    <IsMilestone></IsMilestone> 
                    <IsCritical></IsCritical> 
                    <TaskNotes></TaskNotes>
                    <PercentComplete></PercentComplete>
                    <PercentWorkComplete></PercentWorkComplete>  -->
                    <Priority>{data($task/*[name()='Priority'])}</Priority>
                    <WBS>{data($task/*[name()='WBS'])}</WBS>
                    <PlannedStart>{string($task/*[name()='Start'])}</PlannedStart>
                    <PlannedFinish>{string($task/*[name()='Finish'])}</PlannedFinish>
                    <PlannedDuration>{substring-after(substring-before($task/*[name()='Duration'],'H'), 'PT')}</PlannedDuration>
                 <!--   <PlannedWork></PlannedWork>
                    <PlannedOvertimeWork></PlannedOvertimeWork>
                    <PlannedCost></PlannedCost>
                    <PlannedOvertimeCost></PlannedOvertimeCost>
                    <ActualStart></ActualStart>
                    <ActualFinish></ActualFinish> -->
                    <ActualDuration>{substring-after(substring-before($task/*[name()='ActualDuration'],'H'), 'PT')}</ActualDuration>
                    <ActualWork>{substring-after(substring-before($task/*[name()='ActualWork'],'H'), 'PT')}</ActualWork>
                    <ActualOvertimeWork>{substring-after(substring-before($task/*[name()='ActualOvertimeWork'],'H'), 'PT')}</ActualOvertimeWork>
                    <ActualCost>{string($task/*[name()='ActualCost'])}</ActualCost>
                    <ActualOvertimeCost>{string($task/*[name()='ActualOvertimeCost'])}</ActualOvertimeCost>
                   <!-- <BaselineStart></BaselineStart>
                    <BaselineFinish></BaselineFinish>
                    <BaselineDuration></BaselineDuration>
                    <BaselineWork></BaselineWork>
                    <BaselineOvertimeWork></BaselineOvertimeWork>
                    <BaselineCost></BaselineCost>
                    <BaselineOvertimeCost></BaselineOvertimeCost> -->
                    <RemainingDuration>{substring-after(substring-before($task/*[name()='RemainingDuration'],'H'), 'PT')}</RemainingDuration>
                    <RemainingWork>{substring-after(substring-before($task/*[name()='RemainingWork'],'H'), 'PT')}</RemainingWork>
                    <RemainingOvertimeWork>{substring-after(substring-before($task/*[name()='RemainingOvertimeWork'],'H'), 'PT')}</RemainingOvertimeWork>
                    <RemainingCost>{string($task/*[name()='RemainingCost'])}</RemainingCost>
                    <RemainingOvertimeCost>{string($task/*[name()='RemainingOvertimeCost'])}</RemainingOvertimeCost>
                    <ACWP>{string($task/*[name()='ACWP'])}</ACWP>
                    <BCWP>{string($task/*[name()='BCWP'])}</BCWP>
                    <BCWS>{string($task/*[name()='BCWS'])}</BCWS>
                  <!--  <StartVariance></StartVariance>
                    <FinishVariance></FinishVariance>
                    <CostVariance></CostVariance>  -->
                    <EarlyStart>{string($task/*[name()='EarlyStart'])}</EarlyStart>
                    <EarlyFinish>{string($task/*[name()='EarlyFinish'])}</EarlyFinish>
                    <LateStart>{string($task/*[name()='LateStart'])}</LateStart>
                    <LateFinish>{string($task/*[name()='LateFinish'])}</LateFinish>
                 <!--   <TotalSlack></TotalSlack>
                    <FreeSlack></FreeSlack>  -->
                    <CustomCosts>
                    </CustomCosts>
                    <CustomFinishDates>
                    </CustomFinishDates>
                    <CustomFlags>
                    </CustomFlags>
                    <CustomNumbers>
                    </CustomNumbers>
                    <CustomStartDates>
                    </CustomStartDates>
                    <CustomText>
                    </CustomText>
                    <CustomWork>
                    </CustomWork>
                    <ExtendedAttributes>
                    </ExtendedAttributes>
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
                    <Quantity></Quantity>
                    <Notes></Notes>
                    <PlannedStart></PlannedStart>
                    <PlannedFinish></PlannedFinish>
                    <PlannedDuration></PlannedDuration>
                    <PlannedWork></PlannedWork>
                    <PlannedOvertimeWork></PlannedOvertimeWork>
                    <PlannedCost></PlannedCost>
                    <PlannedOvertimeCost></PlannedOvertimeCost>
                    <ActualStart>{string($assignment/*[name()='Start'])}</ActualStart>
                    <ActualFinish>{string($assignment/*[name()='Finish'])}</ActualFinish>
                    <ActualDuration></ActualDuration>
                    <ActualWork>{string($assignment/*[name()='ActualWork'])}</ActualWork>
                    <ActualOvertimeWork>{string($assignment/*[name()='ActualOvertimeWork'])}</ActualOvertimeWork>
                    <ActualCost>{string($assignment/*[name()='ActualCost'])}</ActualCost>
                    <ActualOvertimeCost>{string($assignment/*[name()='ActualOvertimeCost'])}</ActualOvertimeCost>
                    <BaselineStart></BaselineStart>
                    <BaselineFinish></BaselineFinish>
                    <BaselineDuration></BaselineDuration>
                    <BaselineWork></BaselineWork>
                    <BaselineOvertimeWork></BaselineOvertimeWork>
                    <BaselineCost></BaselineCost>
                    <BaselineOvertimeCost></BaselineOvertimeCost>
                    <RemainingDuration></RemainingDuration>
                    <RemainingWork>{string($assignment/*[name()='RemainingWork'])}</RemainingWork>
                    <RemainingOvertimeWork>{string($assignment/*[name()='RemainingOvertimeWork'])}</RemainingOvertimeWork>
                    <RemainingCost>{string($assignment/*[name()='RemainingCost'])}</RemainingCost>
                    <RemainingOvertimeCost>{string($assignment/*[name()='RemainingOvertimeCost'])}</RemainingOvertimeCost>
                    <ACWP>{string($assignment/*[name()='ACWP'])}</ACWP>
                    <BCWP>{string($assignment/*[name()='BCWP'])}</BCWP>
                    <BCWS>{string($assignment/*[name()='BCWS'])}</BCWS>
                    <StartVariance></StartVariance>
                    <FinishVariance></FinishVariance>
                    <CostVariance></CostVariance>
                    <EarlyStart></EarlyStart>
                    <EarlyFinish></EarlyFinish>
                    <LateStart></LateStart>
                    <LateFinish></LateFinish>
                    <TotalSlack></TotalSlack>
                    <FreeSlack></FreeSlack>
                    <PercentWorkComplete>{string($assignment/*[name()='PercentWorkComplete'])}</PercentWorkComplete>
                    <CustomCosts>
                    </CustomCosts>
                    <CustomFinishDates>
                    </CustomFinishDates>
                    <CustomFlags>
                    </CustomFlags>
                    <CustomNumbers>
                    </CustomNumbers>
                    <CustomStartDates>
                    </CustomStartDates>
                    <CustomText>
                    </CustomText>
                    <CustomWork>
                    </CustomWork>
                    <RateSchedule>
                        <Rate></Rate>
                        <RateUnits></RateUnits>
                    </RateSchedule>
                    <Allocation>
                        <Start></Start>
                        <Finish></Finish>
                        <Quantity></Quantity>
                    </Allocation>
                    <ExtendedAttributes>
                    </ExtendedAttributes>
                </Assignment>
                }
            </Assignments> 
        </Project>}
        </Projects>)
    
        
  return $projects
}; 

