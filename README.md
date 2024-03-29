<p align="right"> <a href="https://achmadirfana.github.io/portofolio/portfolio-NHTSA.html">Back</a></p>


<h2> NHTSA</h2>
<p> URL Dashoboard project (Bonus) : <a href="https://app.powerbi.com/view?r=eyJrIjoiMjI5NDY4NGMtNjg2Zi00ZjA1LWI4Y2UtYWJjOTNhZDYxNmU0IiwidCI6ImRmODY3OWNkLWE4MGUtNDVkOC05OWFjLWM4M2VkN2ZmOTVhMCJ9">NHTSA</a></p>
<h3> 1. Background Project :</h3>
<p style="margin-left: 20px;text-align:justify"> NHTSA is one such department government in the United States focused on reducing the number traffic accident on the highway. Currently NHTSA is brewing a new regulation that will be implemented next year. I was asked to analyze the data collected during 2021. This data is a complete information about accidents that occurred during 2021.</p>
<h3>2. Purpose:</h3>
<p style="margin-left: 20px;text-align:justify">  The main purpose is to provide a number of recommendations about how to reduce the number of accidents on the highway. To do this,
first I  need to identify the following data:</p>
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

<div style="margin-left: 30px;height:200px;width:1000px;border:1px solid #ccc;font:10px/12px Georgia, Garamond, Serif;overflow:auto;">
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

<h4 style="margin-left: 10px">4.2 Data Cleansing</h4>
<p style="margin-left: 30px"> From data validation, found that data time in column timestamp_of_crash  isn't displayed in local time, so it must be converted to local time in every states in USA, the step to convert time is shown in this following item: </p>
<h4 style="margin-left: 45px">• Import table local time of states USA to the same server as main table</h4>
<p style="margin-left: 50px"> This table is contain the code of local time is every states in USA, new table can be access in the following link : <a href="https://docs.google.com/spreadsheets/d/1I4XkiuiteYmqRUeOvniIAuO7CPi0wFmr8j85eGVXJJQ/edit?usp=sharing">Click here</a></p>
<p style="margin-left: 47px">output:<p>
<p align="center"> 
<img src="importnewtable.png" class="img-fluid" alt="">  
</p>
<h4 style="margin-left: 43px">• Add new coloumn in main table </h4>
<p style="margin-left: 50px">Querry for add new coloumn in table crash:
 <div style="margin-left: 50px;height:50px;width:1000px;border:1px solid #ccc;font:10px/12px Georgia, Garamond, Serif;overflow:auto;">
  <p style="font-family:verdana"> alter table	crash </p>
  <p style="font-family:verdana">add column	timezone_code text,</p>
  <p style="font-family:verdana">add column	local_time timestamp </p>
  </div>
  <p style="margin-left: 47px">output:<p>
<p align="center"> 
<img src="addcolumn.png" class="img-fluid" alt="">  
</p>
<h4 style="margin-left: 43px">• Insert data in new coloumn </h4>
<p style="margin-left: 50px">Querry for add data in column timezone_code in  table crash based on data in table us_timezone:
 <div style="margin-left: 50px;height:50px;width:1000px;border:1px solid #ccc;font:10px/12px Georgia, Garamond, Serif;overflow:auto;">
  <p style="font-family:verdana"> update	crash</p>
  <p style="font-family:verdana"> set 	timezone_code = </p>
 <p style="font-family:verdana">	(select code </p>
	 <p style="font-family:verdana"> from	timezone </p>
	 <p style="font-family:verdana"> where	crash.state_name = timezone.state_name) </p>
  </div>
   <p style="margin-left: 47px">output:<p>
<p align="center"> 
<img src="insertdata1.png" class="img-fluid" alt="">  
</p>
  <p style="margin-left: 43px">Querry for add data in column local_time in  table crash :
 <div style="margin-left: 50px;height:50px;width:1000px;border:1px solid #ccc;font:10px/12px Georgia, Garamond, Serif;overflow:auto;">
   <p style="font-family:verdana"> update	crash </p>
   <p style="font-family:verdana"> set		local_time = timestamp_of_crash at time zone timezone_code </p>
  </div>
    <p style="margin-left: 47px">output:<p>
<p align="center"> 
<img src="insertdata2.png" class="img-fluid" alt="">  
</p>
<h4 style="margin-left: 43px">• Remove data before and after 2022 </h4>
<p style="margin-left: 50px">Querry for Remove data before and after 2022 table crash :
 <div style="margin-left: 50px;height:50px;width:1000px;border:1px solid #ccc;font:10px/12px Georgia, Garamond, Serif;overflow:auto;">
	 <p style="font-family:verdana">  delete from	crash </p>
  <p style="font-family:verdana">  where local_time not between '2021-01-01 00:00:00' and '2021-12-31 23:59:59' </p>
  </div>
  
<h3>5. Data Analyze:</h3>
<p style="margin-left: 20px;text-align:justify">The querry for identify the following item  :</p>
<p style="margin-left: 30px">•  Top 10 states where the most accidents occur </p>
<p style="margin-left: 45px">Querry
   <div style="margin-left: 45px;height:50px;width:1000px;border:1px solid #ccc;font:10px/12px Georgia, Garamond, Serif;overflow:auto;">
   <p style="font-family:verdana"> select state_name, count(consecutive_number) as jumlah_kecelakaan </p>
   <p style="font-family:verdana"> from crash </p>
   <p style="font-family:verdana"> group by 1 </p>
   <p style="font-family:verdana"> order by 2 desc </p>
   <p style="font-family:verdana"> limit 10 </p>
   </div>
<p style="margin-left: 45px">Output
<p align="center"> 
<img src="dataanalyze1.png" class="img-fluid" alt="">  
</p>
<p style="margin-left: 30px">•  The average number of accidents per day by hour accident </p>
<p style="margin-left: 45px">Querry
	<div style="margin-left: 45px;height:50px;width:1000px;border:1px solid #ccc;font:10px/12px Georgia, Garamond, Serif;overflow:auto;">	
	<p style="font-family:verdana"> select	to_char(local_time,'HH24') as jam, </p>
	<p style="font-family:verdana"> count(consecutive_number)/(select extract(day from (max(local_time)-min(local_time)))+1 from crash)rata2_kecelakaan </p>
	<p style="font-family:verdana"> from crash </p>
	<p style="font-family:verdana"> group by jam </p>
	<p style="font-family:verdana"> order by rata2_kecelakaan desc </p>
	</div>
<p style="margin-left: 45px">Output
<p align="center"> 
<img src="dataanalyze2.png" class="img-fluid" alt="">  
</p>
<p style="margin-left: 30px">•  Percentage of accidents caused by drunk drivers </p>
<p style="margin-left: 45px">Querry
	<div style="margin-left: 45px;height:50px;width:1000px;border:1px solid #ccc;font:10px/12px Georgia, Garamond, Serif;overflow:auto;">
	<p style="font-family:verdana">select	mabuk.kondisi, count(mabuk.kondisi) as jumlah </p>
	<p style="font-family:verdana">	from </p>
	<p style="font-family:verdana"> (select	consecutive_number, </p>
	<p style="font-family:verdana"> case </p>
			<p style="font-family:verdana"> when number_of_drunk_drivers = 0 </p>
					<p style="font-family:verdana"> then 'tidak mabuk' </p>
				<p style="font-family:verdana"> else 'mabuk' </p>
			<p style="font-family:verdana"> end kondisi </p>
	<p style="font-family:verdana"> from crash) as mabuk </p>
	<p style="font-family:verdana">group by 1 </p>
	</div>
<p style="margin-left: 45px">Output
<p align="center"> 
<img src="dataanalyze3.png" class="img-fluid" alt="">  
</p>
<p style="margin-left: 30px">•  Percentage of accidents in rural and urban areas </p>
<p style="margin-left: 45px">Querry
	<div style="margin-left: 45px;height:50px;width:1000px;border:1px solid #ccc;font:10px/12px Georgia, Garamond, Serif;overflow:auto;">
		<p style="font-family:verdana"> select	land, sum(count) from </p>
		<p style="font-family:verdana"> (select	land_use_name,</p>
	 		<p style="font-family:verdana"> count(consecutive_number),</p>
			<p style="font-family:verdana"> case </p>
				<p style="font-family:verdana"> when land_use_name ='Rural'</p>
					<p style="font-family:verdana"> then 'Rural'</p>
				<p style="font-family:verdana"> when land_use_name ='Urban'</p>
					<p style="font-family:verdana"> then 'Urban'</p>
				<p style="font-family:verdana"> else 'Others'</p>
			<p style="font-family:verdana"> end land </p>
		<p style="font-family:verdana"> from crash </p>
		<p style="font-family:verdana"> group by land_use_name) as x </p>
		<p style="font-family:verdana">group by land </p>
		</div>
<p style="margin-left: 45px">Output
	<p align="center"> 
<img src="dataanalyze4.png" class="img-fluid" alt="">  
</p>
<p style="margin-left: 30px">•  Number of accidents by day </p>
<p style="margin-left: 45px">Querry
	<div style="margin-left: 45px;height:50px;width:1000px;border:1px solid #ccc;font:10px/12px Georgia, Garamond, Serif;overflow:auto;">
	<p style="font-family:verdana">select hari, jumlah from </p>
	<p style="font-family:verdana"> (select	to_char(local_time,'D') harii, to_char(local_time,'Day') hari, count(consecutive_number) jumlah </p>
	<p style="font-family:verdana"> from crash </p>
	<p style="font-family:verdana"> group by hari,harii) as x </p>
	<p style="font-family:verdana"> order by harii </p>
	</div>
<p style="margin-left: 45px">Output
<p align="center"> 
<img src="dataanalyze5.png" class="img-fluid" alt="">  
</p>

<h3>6. Insight and Recomendation</h3>
<p style="margin-left: 40px">•  Based on data, texas and california is states that have most traffic accident in 2022 </p>
<p style="margin-left: 40px">•  The interval time between 12-15 is the most prone to accident    </p>
<p style="margin-left: 40px">•  25% percent of traffic accident in usa is because people drunk    </p>
<p style="margin-left: 40px">•  The probability of traffic accident is 25% higher in weekend than weekday </p>
<p style="margin-left: 40px">•  Based on data, to reduce the number of traffic accident in 2022, We recommend increasing the number of sheriffs on duty during lunch hours, especially on weekends, as this is an accident-prone time in the Texas and California areas.</p>
