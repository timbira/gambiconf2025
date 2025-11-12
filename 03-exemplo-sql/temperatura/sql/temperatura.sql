SELECT celsius(0), fahrenheit(32);

SELECT 100::celsius = 212::fahrenheit AS eq1;

SELECT 0::celsius = 32::fahrenheit AS eq2;

SELECT 32::fahrenheit = 0::celsius AS eq3;
