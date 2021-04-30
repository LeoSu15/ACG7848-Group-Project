/* Bitecoin */
proc import datafile = 'bitcoin_finaldf.csv'
out = B_data
dbms = CSV
;
run;
data B_data;
set B_data;
logmarkcap = log(Marketcap);
logvolume = log(Volume);
lag_Social_Volume_x = lag(Social_Volume_x);
run;
proc summary


proc surveyreg data = B_data;
model bit_return = Age_Consumed Development_Activity lag_Social_Volume_x/solution;
run;


proc surveyreg data = B_data;
model bit_return = logmarkcap logvolume Age_Consumed Development_Activity lag_Social_Volume_x/solution;
run;
/*This line of code can be manipulated to run a scatterplot graph with any variable, this one i chose bitcoing return as the dependent and volume as the independent*/
proc sgplot data=B_data noautolegend;
reg y= bit_return x= Volume  ;
run;
/*Code to plot all variables in different visualizations to display residuals*/
proc reg data= B_data;
model  bit_return = Age_Consumed Development_Activity lag_Social_Volume_x;
run;




/* Litecoin */
proc import datafile = 'Litecoin_finaldf.csv'
out = L_data
dbms = CSV
;
run;
data L_data;
set L_data;
logmarkcap = log(Marketcap__LTC_);
logvolume = log(Volume);
lag_Social_Volume = lag(Social_Volume);
run;



proc surveyreg data = L_data;
model lite_return = Age_Consumed Dev__Activity__Litecoin_ lag_Social_Volume/solution;
run;


proc surveyreg data = L_data;
model lite_return =  logmarkcap  logvolume Age_Consumed Dev__Activity__Litecoin_ lag_Social_Volume/solution;
run;
proc reg data= L_data;
model  lite_return = logmarkcap  logvolume Age_Consumed Dev__Activity__Litecoin_ lag_Social_Volume;
run;
