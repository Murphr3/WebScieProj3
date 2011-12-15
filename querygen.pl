#!/usr/bin/perl

use warnings;
use strict;

my @states = ("AL","MT", "AK","NE","AZ","NV","AR","NH","CA","NJ","CO","NM","CT","NY","DE","NC","FL","ND","GA","OH",
"HI","OK","ID","OR","IL","PA","IN","RI","IA","SC","KS","SD","KY","TN","LA","TX","ME","UT","MD","VT","MA","VA","MI","WA","MN","WV","MS","WI","MO","WY");

foreach my $temp (@states){
	my $filename ="final_finalUS-${temp}.sparql";
	open my $fh, '>',"$filename";
	print $fh "SELECT distinct ?year ?stack_air ?fugitive_air
 WHERE {{
 GRAPH <http://logd.tw.rpi.edu/source/data-gov/dataset/2575/version/2010-Sep-28>{
 
   ?s1  <http://logd.tw.rpi.edu/source/data-gov/dataset/2575/vocab/raw/year> ?year.
   ?s1  <http://logd.tw.rpi.edu/source/data-gov/dataset/2575/vocab/raw/st> \"${temp}\" .
   ?s1  <http://logd.tw.rpi.edu/source/data-gov/dataset/2575/vocab/raw/p_5_2_stack_air> ?stack_air.
   ?s1  <http://logd.tw.rpi.edu/source/data-gov/dataset/2575/vocab/raw/p_5_1_fugitive_air> ?fugitive_air.
 }
}UNION{
  GRAPH <http://logd.tw.rpi.edu/source/data-gov/dataset/3733/version/2010-Dec-17>{ 
   ?s5  <http://logd.tw.rpi.edu/source/data-gov/dataset/3733/vocab/raw/year> ?year.
   ?s5  <http://logd.tw.rpi.edu/source/data-gov/dataset/3733/vocab/raw/st> \"${temp}\" .
   ?s5  <http://logd.tw.rpi.edu/source/data-gov/dataset/3733/vocab/raw/p_5_2_stack_air> ?stack_air.
   ?s5  <http://logd.tw.rpi.edu/source/data-gov/dataset/3733/vocab/raw/p_5_1_fugitive_air> ?fugitive_air. 
 }
 }
}
ORDER BY ?year ?st";
	close $fh or die;
}
