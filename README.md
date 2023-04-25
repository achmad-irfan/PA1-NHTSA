<p align="right"> <a href="https://achmadirfana.github.io/portofolio/portfolio-NHTSA.html">Back</a></p>


<h2> NHTSA</h2>
<p> URL Dashoboard project : <a href="https://app.powerbi.com/view?r=eyJrIjoiMjI5NDY4NGMtNjg2Zi00ZjA1LWI4Y2UtYWJjOTNhZDYxNmU0IiwidCI6ImRmODY3OWNkLWE4MGUtNDVkOC05OWFjLWM4M2VkN2ZmOTVhMCJ9">NHTSA</a></p>
<h3> Background Project :</h3>
<p> NHTSA is one such department government in the United States focused on reducing the number
traffic accident on the highway.
Currently NHTSA is brewing a new regulation that will be implemented next year
. I was asked to
analyze the data collected during 2021. This data is data
complete information about accidents that occurred during 2021.</p>
<h3>Purpose:</h3>
<p> The main purpose is to provide a number of recommendations
about how to reduce the number of accidents on the highway. To do this,
first I  need to identify the following data:</p>
<p>•  Conditions that increase the risk of an accident </p>
<p>•  Top 10 states where the most accidents occur </p>
<p>•  The average number of accidents per day by hour accident </p>
<p>•  Percentage of accidents caused by drunk drivers </p>
<p>•  Percentage of accidents in rural and urban areas </p>
<p>•  Number of accidents by day </p>


<h3>Dataset:</h3>
<p>Data can be access in the following link : <a href="https://drive.google.com/file/d/1wiFf1VpFRXXUz9XpHjb--6vFDoNiCVDK/view?usp=sharing">Click here</a></p>
<h3>Data Preparation</h3>
<h4>Data Validation</h4>
<p> All the data must be checked whetever there is a abnormal data. The  queery for data checking and validating :</p>
<div style="height:200px;width:1000px;overflow:auto;border:4px solid black;padding:2%">
<p style="font-family:verdana"> count(consecutive_number) from crash ;-- no abnormal data found </p>
<p style="font-family: Arial"> select count(distinct consecutive_number) from crash ; -- data OK </p>
<p style="font-family:verdana"> select  distinct state_name from crash ;</p>
<p style="font-family:verdana"> select  max(number_of_vehicle_forms_submitted_all), min(number_of_vehicle_forms_submitted_all) from crash ;</p>
<p style="font-family:verdana"> select  max(number_of_motor_vehicles_in_transport_mvit), min(number_of_motor_vehicles_in_transport_mvit) from crash;</p>
<p style="font-family:verdana"> select  max(number_of_parked_working_vehicles), min(number_of_parked_working_vehicles) from crash;</p>
<p style="font-family:verdana"> select  max(number_of_forms_submitted_for_persons_not_in_motor_vehicles), min(number_of_forms_submitted_for_persons_not_in_motor_vehicles) from crash  ;</p>
<p style="font-family:verdana"> select  max(number_of_persons_in_motor_vehicles_in_transport_mvit), <p style="font-family:verdana"> min(number_of_persons_in_motor_vehicles_in_transport_mvit) from crash ;</p>
<p style="font-family:verdana"> select  max(number_of_persons_not_in_motor_vehicles_in_transport_mvit), min(number_of_persons_not_in_motor_vehicles_in_transport_mvit) from crash ;</p>
<p style="font-family:verdana"> select distinct land_use_name from crash ;</p>
<p style="font-family:verdana"> select distinct functional_system_name from crash ;</p>
<p style="font-family:verdana"> select min(milepoint),max(milepoint) from crash ;</p>
<p style="font-family:verdana"> select distinct manner_of_collision_name from crash ;</p>
<p style="font-family:verdana"> select distinct type_of_intersection_name from crash   ;</p>
<p style="font-family:verdana"> select distinct light_condition_name from crash ;</p>
<p style="font-family:verdana"> select distinct atmospheric_conditions_1_name from crash ;</p>
<p style="font-family:verdana"> select distinct number_of_fatalities from crash   ;</p>
<p style="font-family:verdana"> select distinct number_of_drunk_drivers from crash  ;</p>
<p style="font-family:verdana"> select min(timestamp_of_crash),max(timestamp_of_crash) from crash  ; -- ditemukan data timezonenya tidak sesuai dengan lokal time state amerika dan ada sebagian data di luar tahun 2021 </div>
  </div>

<h4>Data Cleansing</h4>

