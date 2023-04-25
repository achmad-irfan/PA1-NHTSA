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
<p style="font-family: Arial";text-align: center>  count(consecutive_number) from crash ; </p>
<p style="font-family: Arial";text-align: center> select  count(distinct consecutive_number) from crash ; -- data OK /p>
select  distinct state_name from crash ;
select  max(number_of_vehicle_forms_submitted_all), min(number_of_vehicle_forms_submitted_all) from crash ;
select  max(number_of_motor_vehicles_in_transport_mvit), min(number_of_motor_vehicles_in_transport_mvit) from crash;
select  max(number_of_parked_working_vehicles), min(number_of_parked_working_vehicles) from crash;
select  max(number_of_forms_submitted_for_persons_not_in_motor_vehicles), min(number_of_forms_submitted_for_persons_not_in_motor_vehicles) from crash  ;
select  max(number_of_persons_in_motor_vehicles_in_transport_mvit), min(number_of_persons_in_motor_vehicles_in_transport_mvit) from crash ;
select  max(number_of_persons_not_in_motor_vehicles_in_transport_mvit), min(number_of_persons_not_in_motor_vehicles_in_transport_mvit) from crash ;
select distinct land_use_name from crash ;
select distinct functional_system_name from crash ;
select min(milepoint),max(milepoint) from crash ;
select distinct manner_of_collision_name from crash ;
select distinct type_of_intersection_name from crash   ;
select distinct light_condition_name from crash ;
select distinct atmospheric_conditions_1_name from crash ;
select distinct number_of_fatalities from crash   ;
select distinct number_of_drunk_drivers from crash  ;
select min(timestamp_of_crash),max(timestamp_of_crash) from crash  ; -- ditemukan data timezonenya tidak sesuai dengan lokal time state amerika dan ada sebagian data di luar tahun 2021


</div>





<h4>Data Cleansing</h4>
<h3>Dashboard result:</h3>
<h4>Page Customer Data:</h4>
<p align="center"> 
<img src="fsp1.png" class="img-fluid" alt="">  
</p>
<h5>Dashboard Customer Data Component:</h5>
<p align="center"> 
<img src="fsp1s.png" class="img-fluid" alt="">  
</p>
<h4>Page Sales Report Branch:</h4>
<p align="center"> 
<img src="fsp2.png" class="img-fluid" alt="">  
</p>
<h5>Dashboard Sales Report Branch Component:</h5>
<p align="center"> 
<img src="fsp2s.png" class="img-fluid" alt="">  
</p>
<h4>Page Sales Report Menu:</h4>
<p align="center"> 
<img src="fsp3.png" class="img-fluid" alt="">  
</p>
<h5>Dashboard Sales Report Menu Component:</h5>
<p align="center"> 
<img src="fsp3s.png" class="img-fluid" alt="">  
</p>
<h4>Page Sales Report Customer:</h4>
<p align="center"> 
<img src="fsp4.png" class="img-fluid" alt="">  
</p>
<h5>Dashboard Sales Report Customer Component:</h5>
<p align="center"> 
<img src="fsp4s.png" class="img-fluid" alt="">  
</p>
<h3>Insight and Recomendation:</h3>
<p>• Focus on improving delivery services by providing service promises, for example orders can be received 30 minutes after orders are placed within a 5 km radius. </p>
<p>• Providing special discounts for users who use the service more than 25 times, with the aim of increasing user interest to use the service more often so as to increase turnover.</p>

<p>• Special discounts that are only valid at certain hours (for example 7-8 am) are expected to be used during order hours so as to avoid miss opportunities due to time constraints, especially at 11-1 pm.</p>
<p>• Making the Sawah Besar branch a role model for other branches in terms of spatial planning, decoration, uniforms, how to serve customers and other aspects.</p>
<p>• the cost of stock availability, especially for chicken and beef raw materials as well as complementary raw materials in the form of rice and others to avoid miss-opportunities due to running out of raw materials while there are still orders.</p>
<p>•Introducing promos at the right time is expected to increase the number of users. For example, discounts are only valid at 7-9 am, discounts that are only valid on weekends.</p>

