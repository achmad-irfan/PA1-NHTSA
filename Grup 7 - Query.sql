--data validation
select  count(consecutive_number) from crash ;
select  count(distinct consecutive_number) from crash ; -- data OK
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

-- Mengecek waktu lokal
select	localtime

-- Mengganti timestamp (tidak digunakan)
select now()
set time zone 'America/Los_Angeles'
set time zone 'Asia/Jakarta'

-- Menambah kolom baru
alter table	crash
add column	timezone_code text,
add column	local_time timestamp

-- Mengisi data kode timezone masing-masing state dengan referensi tabel timezone yang sudah diimport ke database
update	crash
set 	timezone_code =
	(select code
	from	timezone
	where	crash.state_name = timezone.state_name)

-- Mengisi data kolom localtime sesuai dengan kode timezone nya
update	crash
set		local_time = timestamp_of_crash at time zone timezone_code

-- Mengecek waktu lokal di luar tahun 2021
select	*
from	crash
where	local_time not between '2021-01-01 00:00:00' and '2021-12-31 23:59:59'


-- Menghapus waktu lokal di luar tahun 2021
delete
from	crash
where	local_time not between '2021-01-01 00:00:00' and '2021-12-31 23:59:59'

-- kondisi yang meningkatkan resiko kecelakaan.
select	*
from	crash

-- 10 teratas negara bagian di mana kecelakaan paling banyak terjadi.
select	state_name,
		count(consecutive_number) as jumlah_kecelakaan
from	crash
group by	1
order by	2 desc
limit	10

-- Jumlah rerata kecelakaan yang terjadi setiap jam.
select	to_char(local_time,'HH24') as jam,
		count(consecutive_number)/(select extract(day from (max(local_time)-min(local_time)))+1 from crash)rata2_kecelakaan
from crash
group by	jam
order by	rata2_kecelakaan desc

-- Persentase kecelakaan yang disebabkan oleh pengemudi yang mabuk.
select	mabuk.kondisi,
		count(mabuk.kondisi) as jumlah
from
	(select	consecutive_number, 
			case
				when number_of_drunk_drivers = 0
					then 'tidak mabuk'
				else 'mabuk'
			end kondisi
	from crash) as mabuk
group by 1

-- Persentase kecelakaan di daerah pedesaan dan perkotaan.
select	land,
		sum(count)
from 
	(select	land_use_name,
	 		count(consecutive_number),
			case
				when land_use_name ='Rural'
					then 'Rural'
				when land_use_name ='Urban'
					then 'Urban'
				else 'Others'
			end land
		from crash
		group by land_use_name) as x
group by land

-- Jumlah kecelakaan berdasarkan hari
select	hari,
		jumlah
from 
	(select	to_char(local_time,'D') harii,
	 		to_char(local_time,'Day') hari,
	 		count(consecutive_number) jumlah
	from crash
	group by hari,harii) as x
order by harii

-- Insight tambahan
select	jp.negara_bagian,
		jp.jumlah_penduduk,
		count(c.consecutive_number) as jumlah_kecelakaan
from	crash as c
inner join	jumlah_penduduk as jp
	on	c.state_name = jp.negara_bagian
group by	1,2
order by	2 desc