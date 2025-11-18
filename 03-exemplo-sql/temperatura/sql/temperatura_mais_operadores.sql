SELECT 0::celsius < 32::fahrenheit AS lt1;
SELECT 100::celsius > 212::fahrenheit AS gt1;

SELECT 10::celsius < 20::celsius AS lt2;
SELECT 20::celsius > 10::celsius AS gt2;

SELECT 212::fahrenheit > 100::celsius AS gt3;
