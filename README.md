<p align="right"> <a href="https://achmadirfana.github.io/portofolio/portfolio-NHTSA.html">Back</a></p>


<h2> NHTSA</h2>
<p> URL Dashoboard project : <a href="https://app.powerbi.com/view?r=eyJrIjoiMjI5NDY4NGMtNjg2Zi00ZjA1LWI4Y2UtYWJjOTNhZDYxNmU0IiwidCI6ImRmODY3OWNkLWE4MGUtNDVkOC05OWFjLWM4M2VkN2ZmOTVhMCJ9">NHTSA</a></p>
<h3> 1. Background Project :</h3>
<p style="margin-left: 20px;text-align:justify"> NHTSA is one such department government in the United States focused on reducing the number traffic accident on the highway. Currently NHTSA is brewing a new regulation that will be implemented next year. I was asked to analyze the data collected during 2021. This data is a complete information about accidents that occurred during 2021.</p>
<h3>2. Purpose:</h3>
<p style="margin-left: 20px;text-align:justify">  The main purpose is to provide a number of recommendations
about how to reduce the number of accidents on the highway. To do this,
first I  need to identify the following data:</p>
<p style="margin-left: 20px">•  Conditions that increase the risk of an accident </p>
<p style="margin-left: 20px">•  Top 10 states where the most accidents occur </p>
<p style="margin-left: 20px">•  The average number of accidents per day by hour accident </p>
<p style="margin-left: 20px">•  Percentage of accidents caused by drunk drivers </p>
<p style="margin-left: 20px">•  Percentage of accidents in rural and urban areas </p>
<p style="margin-left: 20px">•  Number of accidents by day </p>

<h3>3. Dataset:</h3>
<p style="margin-left: 20px">Data can be access in the following link : <a href="https://drive.google.com/file/d/1wiFf1VpFRXXUz9XpHjb--6vFDoNiCVDK/view?usp=sharing">Click here</a></p>
<h3>4. Data Preparation</h3>
<h4 style="margin-left: 10px">4.1 Data Validation</h4>
<p style="margin-left: 30px"> All the data must be checked whetever there is a abnormal data. The  queery for data checking and validating :</p>

<div style="margin-left: 30px;height:200px;width:1000px;border:1px solid #ccc;font:8px/12px Georgia, Garamond, Serif;overflow:auto;">
<p style="font-family:verdana"> count(consecutive_number) from crash ;-- to count consecutive number (unique code in every traffic accident) </p>
<p style="font-family:verdana"> select count(distinct consecutive_number) from crash ; -- data is equivalent with previous queery </p>
<p style="font-family:verdana"> select  distinct state_name from crash ; --no abnormal data </p> 
<p style="font-family:verdana"> select  max(number_of_vehicle_forms_submitted_all), min(number_of_vehicle_forms_submitted_all) from crash ; --no abnormal data </p>
<p style="font-family:verdana"> select  max(number_of_motor_vehicles_in_transport_mvit), min(number_of_motor_vehicles_in_transport_mvit) from crash; --no abnormal data</p>
<p style="font-family:verdana"> select  max(number_of_parked_working_vehicles), min(number_of_parked_working_vehicles) from crash; --no abnormal data</p>
 <p style="font-family:verdana"> select  max(number_of_forms_submitted_for_persons_not_in_motor_vehicles), min(number_of_forms_submitted_for_persons_not_in_motor_vehicles) from crash --no abnormal data ;</p>
<p style="font-family:verdana"> select  max(number_of_persons_in_motor_vehicles_in_transport_mvit), min(number_of_persons_in_motor_vehicles_in_transport_mvit) from crash ; --no abnormal data </p>
<p style="font-family:verdana"> select  max(number_of_persons_not_in_motor_vehicles_in_transport_mvit), min(number_of_persons_not_in_motor_vehicles_in_transport_mvit) from crash ; --no abnormal data</p>
<p style="font-family:verdana"> select distinct land_use_name from crash ; --no abnormal data</p>
<p style="font-family:verdana"> select distinct functional_system_name from crash ; --no abnormal data</p>
<p style="font-family:verdana"> select min(milepoint),max(milepoint) from crash ; --no abnormal data</p>
<p style="font-family:verdana"> select distinct manner_of_collision_name from crash ;--no abnormal data</p>
<p style="font-family:verdana"> select distinct type_of_intersection_name from crash   ;--no abnormal data</p>
<p style="font-family:verdana"> select distinct light_condition_name from crash ;--no abnormal data</p>
<p style="font-family:verdana"> select distinct atmospheric_conditions_1_name from crash ;--no abnormal data</p>
<p style="font-family:verdana"> select distinct number_of_fatalities from crash   ; --no abnormal data</p>
<p style="font-family:verdana"> select distinct number_of_drunk_drivers from crash  ; --no abnormal data</p>
<p style="font-family:verdana"> select min(timestamp_of_crash),max(timestamp_of_crash) from crash  ; -- found that time is not in local state of USA, so it must to convert to local time</p>
</div>
<h4>4.2 Data Cleansing</h4>
<p> From data validation, found that data time in column timestamp_of_crash  isn't displayed in local time, so it must be converted to local time in every states in USA, the step to convert time is shown in this following item: </p>
<h4>Import table local time of states USA to the same server as main table</h4>
<p> this table is contain the code of local time is every states in USA, new table can be access in the following link : <a href="https://docs.google.com/spreadsheets/d/1I4XkiuiteYmqRUeOvniIAuO7CPi0wFmr8j85eGVXJJQ/edit?usp=sharing">Click here</a></p>
<p>output:<p>
<h4>Add new coloumn in main table </h4>
<p>Querry for add new coloumn in table crash:
 <div style="height:50px;width:1000px;border:1px solid #ccc;font:16px/26px Georgia, Garamond, Serif;overflow:auto;">
  <p style="font-family:verdana"> alter table	crash </p>
  <p style="font-family:verdana">add column	timezone_code text,</p>
  <p style="font-family:verdana">add column	local_time timestamp </p>
  </div>
<h4>Insert data in new coloumn </h4>
<p>Querry for add data in column timezone_code in  table crash based on data in table us_timezone:
 <div style="height:50px;width:1000px;border:1px solid #ccc;font:16px/26px Georgia, Garamond, Serif;overflow:auto;">
  <p style="font-family:verdana"> update	crash</p>
  <p style="font-family:verdana"> set 	timezone_code = </p>
 <p style="font-family:verdana">	(select code </p>
	 <p style="font-family:verdana"> from	timezone </p>
	 <p style="font-family:verdana"> where	crash.state_name = timezone.state_name) </p>
  </div>
  <p>Querry for add data in column local_time in  table crash :
 <div style="height:50px;width:1000px;border:1px solid #ccc;font:16px/26px Georgia, Garamond, Serif;overflow:auto;">
   <p style="font-family:verdana"> update	crash </p>
   <p style="font-family:verdana"> set		local_time = timestamp_of_crash at time zone timezone_code </p>
  </div>
<h4>Remove data before and after 2022 </h4>
<p>Querry for Remove data before and after 2022 table crash :
 <div style="height:50px;width:1000px;border:1px solid #ccc;font:16px/26px Georgia, Garamond, Serif;overflow:auto;">
	 <p style="font-family:verdana">  delete from	crash </p>
  <p style="font-family:verdana">  where local_time not between '2021-01-01 00:00:00' and '2021-12-31 23:59:59' </p>
  </div>
  

