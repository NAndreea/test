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
                            <UserID>{$userid}</UserID>
                            <UserName>{$leader}</UserName>
                            <AppName>{$application_name}</AppName>
                            <AppVersion>{$application_version}</AppVersion>
                            <Generated></Generated>
                            <SchemaVersion></SchemaVersion>
                            <Projects>
                                    <ProjectName projectID="">{$projectname}</ProjectName>
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
    <PoolResource xmlns="" ResourceID="{string($resource/@id)}">
            <PersistentID>{string($resource/@id)}</PersistentID>
            <FormattedName>{string($resource/@name)}</FormattedName>
            <FirstName>FirstName0</FirstName>
            <LastName>LastName0</LastName>
            <MiddleName>MiddleName0</MiddleName>
            <Initials>{string($resource/@initials)}</Initials>
            <EmailAddress>{string($resource/@email)}</EmailAddress>
            <MaxQuantity>{string($resource/@units)}</MaxQuantity>
            <Type>{string($resource/@type)}</Type>
            <Cost>{string($resource/@normal-rate)}</Cost>
            <OvertimeCost>{string($resource/@overtime-rate)}</OvertimeCost>
            <Rate>0</Rate>
            <OvertimeWork>0</OvertimeWork>
            <PlannedStart>{string($resource/@available-from)}</PlannedStart>
            <PlannedFinish>{string($resource/@available-until)}</PlannedFinish>
            <PlannedDuration>0</PlannedDuration>
            <PlannedWork>0</PlannedWork>
            <PlannedOvertimeWork>0</PlannedOvertimeWork>
            <PlannedCost>0</PlannedCost>
            <PlannedOvertimeCost>0</PlannedOvertimeCost>
            <ActualStart>ActualStart0</ActualStart>
            <ActualFinish>ActualFinish0</ActualFinish>
            <ActualDuration>0</ActualDuration>
            <ActualWork>0</ActualWork>
            <ActualOvertimeWork>0</ActualOvertimeWork>
            <ActualCost>0</ActualCost>
            <ActualOvertimeCost>0</ActualOvertimeCost>
            <BaselineStart>BaselineStart0</BaselineStart>
            <BaselineFinish>BaselineFinish0</BaselineFinish>
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
            <EarlyStart>EarlyStart0</EarlyStart>
            <EarlyFinish>EarlyFinish0</EarlyFinish>
            <LateStart>LateStart0</LateStart>
            <LateFinish>LateFinish0</LateFinish>
            <TotalSlack>-1073741773</TotalSlack>
            <FreeSlack>-1073741773</FreeSlack>
            <MaterialLabel>MaterialLabel0</MaterialLabel>
            <CustomCosts>
                <Cost01>0</Cost01>
                <Cost02>0</Cost02>
                <Cost03>0</Cost03>
            </CustomCosts>
            <CustomFinishDates>
                <FinishDate01>FinishDate010</FinishDate01>
                <FinishDate02>FinishDate020</FinishDate02>
                <FinishDate03>FinishDate030</FinishDate03>
            </CustomFinishDates>
            <CustomFlags>
                <Flag01>0</Flag01>
                <Flag02>0</Flag02>
                <Flag03>0</Flag03>
            </CustomFlags>
            <CustomNumbers>
                <Number01>0</Number01>
                <Number02>0</Number02>
                <Number03>0</Number03>
            </CustomNumbers>
            <CustomStartDates>
                <StartDate01>StartDate010</StartDate01>
                <StartDate02>StartDate020</StartDate02>
                <StartDate03>StartDate030</StartDate03>
            </CustomStartDates>
            <CustomText>
                <Text01>Text010</Text01>
                <Text02>Text020</Text02>
                <Text03>Text030</Text03>
            </CustomText>
            <CustomWork>
                <Work01>0</Work01>
                <Work02>0</Work02>
                <Work03>0</Work03>
            </CustomWork>
            <RateSchedule>
                <Start>Start0</Start>
                <Finish>Finish0</Finish>
                <Rate>0</Rate>
                <RateUnits>USD</RateUnits>
            </RateSchedule>
            <AvailableFrom>{string($resource/@available-from)}</AvailableFrom>
            <AvailableTo>{string($resource/@available-until)}</AvailableTo>
            <Availability resourceID="-1073741773">
                <Start>Start1</Start>
                <Finish>Finish1</Finish>
                <Quantity>0</Quantity>
            </Availability> 
            <ExtendedAttributes>
                <ExtendedAttribute AttributeID="-1073741773" count="0">ExtendedAttribute0</ExtendedAttribute>
                <ExtendedAttribute AttributeID="-1073741773" count="0">ExtendedAttribute1</ExtendedAttribute>
                <ExtendedAttribute AttributeID="-1073741773" count="0">ExtendedAttribute2</ExtendedAttribute>
                <ExtendedAttribute AttributeID="-1073741773" count="0">ExtendedAttribute3</ExtendedAttribute>
            </ExtendedAttributes>
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
        <Project xmlns="" ProjectID="">
            <PersistentID application=""></PersistentID>
            <ProjectName>{$projectname}</ProjectName>
            <LastModified>LastModified3</LastModified>
            <Description>{$description}</Description>
            <Title>Title3</Title>
            <Author>{$leader}</Author>
            <Category>Category3</Category>
            <Company>Company3</Company>
            <StatusDate>StatusDate3</StatusDate>
            <Manager>Manager3</Manager>
            <Subject>Subject3</Subject>
            <CreatedDate>CreatedDate3</CreatedDate>
            <HoursPerDay>12</HoursPerDay>
            <DaysPerMonth>16</DaysPerMonth>
            <WeekStartDay>3</WeekStartDay>
            <YearStartMonth>6</YearStartMonth>
            <HoursPerWeek>84</HoursPerWeek>
            <PlannedStart>{$start-time}</PlannedStart>
            <PlannedFinish>{$end-time}</PlannedFinish>
            <PlannedDuration>0</PlannedDuration>
            <PlannedWork>0</PlannedWork>
            <PlannedOvertimeWork>0</PlannedOvertimeWork>
            <PlannedCost>0</PlannedCost>
            <PlannedOvertimeCost>0</PlannedOvertimeCost>
            <ActualStart>ActualStart43</ActualStart>
            <ActualFinish>ActualFinish43</ActualFinish>
            <ActualDuration>0</ActualDuration>
            <ActualWork>0</ActualWork>
            <ActualOvertimeWork>0</ActualOvertimeWork>
            <ActualCost>0</ActualCost>
            <ActualOvertimeCost>0</ActualOvertimeCost>
            <BaselineStart>BaselineStart43</BaselineStart>
            <BaselineFinish>BaselineFinish43</BaselineFinish>
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
            <EarlyStart>EarlyStart43</EarlyStart>
            <EarlyFinish>EarlyFinish43</EarlyFinish>
            <LateStart>LateStart43</LateStart>
            <LateFinish>LateFinish43</LateFinish>
            <TotalSlack>-1073741773</TotalSlack>
            <FreeSlack>-1073741773</FreeSlack>
            <CustomCosts>
                <Cost01>0</Cost01>
                <Cost02>0</Cost02>
                <Cost03>0</Cost03>
            </CustomCosts>
            <CustomFinishDates>
                <FinishDate01>FinishDate017</FinishDate01>
                <FinishDate02>FinishDate027</FinishDate02>
                <FinishDate03>FinishDate037</FinishDate03>
            </CustomFinishDates>
            <CustomFlags>
                <Flag01>0</Flag01>
                <Flag02>0</Flag02>
                <Flag03>0</Flag03>
            </CustomFlags>
            <CustomNumbers>
                <Number01>0</Number01>
                <Number02>0</Number02>
                <Number03>0</Number03>
            </CustomNumbers>
            <CustomStartDates>
                <StartDate01>StartDate017</StartDate01>
                <StartDate02>StartDate027</StartDate02>
                <StartDate03>StartDate037</StartDate03>
            </CustomStartDates>
            <CustomText>
                <Text01>Text017</Text01>
                <Text02>Text027</Text02>
                <Text03>Text037</Text03>
            </CustomText>
            <CustomWork>
                <Work01>0</Work01>
                <Work02>0</Work02>
                <Work03>0</Work03>
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
            </ExtendedAttributes>
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
                <LocalResource ResourceID="-1073741773">
                    <PersistentID application="0">-1073741773</PersistentID>
                    <FormattedName>FormattedName19</FormattedName>
                    <FirstName>FirstName19</FirstName>
                    <LastName>LastName19</LastName>
                    <MiddleName>MiddleName19</MiddleName>
                    <Initials>Initials19</Initials>
                    <EmailAddress>EmailAddress19</EmailAddress>
                    <IsOverallocated>0</IsOverallocated>
                    <MaxQuantity>0</MaxQuantity>
                    <Notes>Notes31</Notes>
                    <Type>0</Type>
                    <Cost>0</Cost>
                    <OvertimeCost>0</OvertimeCost>
                    <Rate>0</Rate>
                    <OvertimeWork>0</OvertimeWork>
                    <PlannedStart>PlannedStart47</PlannedStart>
                    <PlannedFinish>PlannedFinish47</PlannedFinish>
                    <PlannedDuration>0</PlannedDuration>
                    <PlannedWork>0</PlannedWork>
                    <PlannedOvertimeWork>0</PlannedOvertimeWork>
                    <PlannedCost>0</PlannedCost>
                    <PlannedOvertimeCost>0</PlannedOvertimeCost>
                    <ActualStart>ActualStart47</ActualStart>
                    <ActualFinish>ActualFinish47</ActualFinish>
                    <ActualDuration>0</ActualDuration>
                    <ActualWork>0</ActualWork>
                    <ActualOvertimeWork>0</ActualOvertimeWork>
                    <ActualCost>0</ActualCost>
                    <ActualOvertimeCost>0</ActualOvertimeCost>
                    <BaselineStart>BaselineStart47</BaselineStart>
                    <BaselineFinish>BaselineFinish47</BaselineFinish>
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
                    <EarlyStart>EarlyStart47</EarlyStart>
                    <EarlyFinish>EarlyFinish47</EarlyFinish>
                    <LateStart>LateStart47</LateStart>
                    <LateFinish>LateFinish47</LateFinish>
                    <TotalSlack>-1073741773</TotalSlack>
                    <FreeSlack>-1073741773</FreeSlack>
                    <MaterialLabel>MaterialLabel19</MaterialLabel>
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
                    <AvailableFrom>AvailableFrom19</AvailableFrom>
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
                for $resource in doc("maindoc.xml")/*/*/*[name()='resource-group']/*[name()='resource']
                return
                <Resource ResourceID="{string($resource/@id)}"/>
              }
            </Resources>
            <Tasks>
              {
                for $task in doc("maindoc.xml")/*/*/*[name()='task']
                return
                <Task TaskID="{string($task/@id)}">
                    <PersistentID>{string($task/@id)}</PersistentID>
                    <TaskName>{string($task/@name)}</TaskName>
                    <IsSummary>true</IsSummary>
                    <OutlineLevel>0</OutlineLevel>
                    <TaskOrderID>{string($task/@wbs)}</TaskOrderID>
                    <ParentTaskID></ParentTaskID>
                    <ParentPersistentID></ParentPersistentID>
                    <FixedCost>0</FixedCost>
                    <IsMilestone>false</IsMilestone>
                    <IsCritical>false</IsCritical>
                    <TaskNotes>TaskNotes12</TaskNotes>
                    <PercentComplete>-16334</PercentComplete>
                    <PercentWorkComplete>-16334</PercentWorkComplete>
                    <Priority>0</Priority>
                    <WBS>{string($task/@wbs)}</WBS>
                    <PlannedStart>{string($task/@constraint-starttime)}</PlannedStart>
                    <PlannedFinish>{string($task/@constraint-endtime)}</PlannedFinish>
                    <PlannedDuration></PlannedDuration>
                    <PlannedWork>0</PlannedWork>
                    <PlannedOvertimeWork>0</PlannedOvertimeWork>
                    <PlannedCost>0</PlannedCost>
                    <PlannedOvertimeCost>0</PlannedOvertimeCost>
                    <ActualStart>{string($task/*[name()='schedules']/*[name()='schedule']/@start)}</ActualStart>
                    <ActualFinish>{string($task/*[name()='schedules']/*[name()='schedule']/@finish)}</ActualFinish>
                    <ActualDuration>{string($task/*[name()='schedules']/*[name()='schedule']/@duration)}</ActualDuration>
                    <ActualWork>0</ActualWork>
                    <ActualOvertimeWork>0</ActualOvertimeWork>
                    <ActualCost>0</ActualCost>
                    <ActualOvertimeCost>0</ActualOvertimeCost>
                    <BaselineStart>BaselineStart48</BaselineStart>
                    <BaselineFinish>BaselineFinish48</BaselineFinish>
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
                    <EarlyStart>{string($task/*[name()='schedules']/*[name()='schedule']/@earlystart)}</EarlyStart>
                    <EarlyFinish></EarlyFinish>
                    <LateStart></LateStart>
                    <LateFinish>{string($task/*[name()='schedules']/*[name()='schedule']/@latefinish)}</LateFinish>
                    <TotalSlack>-1073741773</TotalSlack>
                    <FreeSlack>-1073741773</FreeSlack>
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
                {
                for $subtask in doc("maindoc.xml")/*/*/*[name()='task']/*[name()='task']
                return
                <Task TaskID="{string($subtask/@id)}">
                    <PersistentID>{string($subtask/@id)}</PersistentID>
                    <TaskName>{string($subtask/@name)}</TaskName>
                    <IsSummary>false</IsSummary>
                    <OutlineLevel>0</OutlineLevel>
                    <TaskOrderID>{string($subtask/@wbs)}</TaskOrderID>
                    <ParentTaskID></ParentTaskID>
                    <ParentPersistentID></ParentPersistentID>
                    <FixedCost>0</FixedCost>
                    <IsMilestone>false</IsMilestone>
                    <IsCritical>false</IsCritical>
                    <TaskNotes>{string($subtask/*[name()='progress']/*[name()='completition-entry']/@note)}</TaskNotes>
                    <PercentComplete>{string($subtask/*[name()='progress']/*[name()='completition-entry']/@percent-finished)}</PercentComplete>
                    <PercentWorkComplete>-16334</PercentWorkComplete>
                    <Priority>0</Priority>
                    <WBS>{string($subtask/@wbs)}</WBS>
                    <PlannedStart>{string($subtask/@constraint-starttime)}</PlannedStart>
                    <PlannedFinish>{string($subtask/@constraint-endtime)}</PlannedFinish>
                    <PlannedDuration></PlannedDuration>
                    <PlannedWork>0</PlannedWork>
                    <PlannedOvertimeWork>0</PlannedOvertimeWork>
                    <PlannedCost>0</PlannedCost>
                    <PlannedOvertimeCost>0</PlannedOvertimeCost>
                    <ActualStart>{string($subtask/*[name()='schedules']/*[name()='schedule']/@start)}</ActualStart>
                    <ActualFinish>{string($subtask/*[name()='schedules']/*[name()='schedule']/@end)}</ActualFinish>
                    <ActualDuration>{string($subtask/*[name()='schedules']/*[name()='schedule']/@duration)}</ActualDuration>
                    <ActualWork>0</ActualWork>
                    <ActualOvertimeWork>0</ActualOvertimeWork>
                    <ActualCost>0</ActualCost>
                    <ActualOvertimeCost>0</ActualOvertimeCost>
                    <BaselineStart>BaselineStart48</BaselineStart>
                    <BaselineFinish>BaselineFinish48</BaselineFinish>
                    <BaselineDuration>0</BaselineDuration>
                    <BaselineWork>0</BaselineWork>
                    <BaselineOvertimeWork>0</BaselineOvertimeWork>
                    <BaselineCost>0</BaselineCost>
                    <BaselineOvertimeCost>0</BaselineOvertimeCost>
                    <RemainingDuration>{string($subtask/*[name()='progress']/*[name()='completition-entry']/@remaining-effort)}</RemainingDuration>
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
                    <EarlyStart>{string($subtask/*[name()='schedules']/*[name()='schedule']/@earlystart)}</EarlyStart>
                    <EarlyFinish>{string($subtask/*[name()='schedules']/*[name()='schedule']/@earlyfinish)}</EarlyFinish>
                    <LateStart>{string($subtask/*[name()='schedules']/*[name()='schedule']/@latestart)}</LateStart>
                    <LateFinish>{string($subtask/*[name()='schedules']/*[name()='schedule']/@latefinish)}</LateFinish>
                    <TotalSlack>-1073741773</TotalSlack>
                    <FreeSlack>-1073741773</FreeSlack>
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
                for $appointment in doc("maindoc.xml")/*/*/*[name()='schedules']/*[name()='plan']/*[name()='schedule']/*[name()='appointment']
                return
                <Assignment AssignmentID="-1073741773" ResourceID="{string($appointment/@resource-id)}" TaskID="{string($appointment/@task-id)}">
                    <PersistentID>-1073741773</PersistentID>
                    <ResourcePersistentID>{string($appointment/@resource-id)}</ResourcePersistentID>
                    <TaskPersistentID>{string($appointment/@task-id)}</TaskPersistentID>
                    <Quantity>0</Quantity>
                    <Notes>Notes32</Notes>
                    <PlannedStart>PlannedStart52</PlannedStart>
                    <PlannedFinish>PlannedFinish52</PlannedFinish>
                    <PlannedDuration>0</PlannedDuration>
                    <PlannedWork>0</PlannedWork>
                    <PlannedOvertimeWork>0</PlannedOvertimeWork>
                    <PlannedCost>0</PlannedCost>
                    <PlannedOvertimeCost>0</PlannedOvertimeCost>
                    <ActualStart>ActualStart52</ActualStart>
                    <ActualFinish>ActualFinish52</ActualFinish>
                    <ActualDuration>0</ActualDuration>
                    <ActualWork>0</ActualWork>
                    <ActualOvertimeWork>0</ActualOvertimeWork>
                    <ActualCost>0</ActualCost>
                    <ActualOvertimeCost>0</ActualOvertimeCost>
                    <BaselineStart>BaselineStart52</BaselineStart>
                    <BaselineFinish>BaselineFinish52</BaselineFinish>
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
                    <EarlyStart>EarlyStart52</EarlyStart>
                    <EarlyFinish>EarlyFinish52</EarlyFinish>
                    <LateStart>LateStart52</LateStart>
                    <LateFinish>LateFinish52</LateFinish>
                    <TotalSlack>-1073741773</TotalSlack>
                    <FreeSlack>-1073741773</FreeSlack>
                    <PercentWorkComplete>-1</PercentWorkComplete>
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
                    <Allocation>
                        <Start>Start32</Start>
                        <Finish>Finish32</Finish>
                        <Quantity>0</Quantity>
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

