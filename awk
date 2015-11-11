BEGIN {greadings=5 					# count of sensors
MAXINT=9999						# Variable used to be bigger than our avarage sensor data
FS= "[/ ]"						# / or space field seperator
}{
for(readings = 1; readings <= greadings; readings++){ 	# Cycle used to write data in massive
	i[$2]++						# It is still works well without for cycle(as Myroslav did)
	reading[$2]+=$3
	if ($1 == readings) {sen[$1]=$2}		# Same thing for second file
	}
}
END{
for(a=1; a <= greadings; a++){avg[a]=reading[a]/i[a]}	# Define avarage data
for (z=1;z<=greadings;z++){				# Min sort for avg. data
	min=avg[z]
	for (y=1;y<=greadings;y++){
	if (avg[y]<min){min=avg[y]}
	}
for (q=1;q<=greadings;q++){				# Overwrite our min variable with MAXINT variable
	if (avg[q]==min){
		avg[q]=MAXINT
		qmincurrent=q}				# Remember current sensor with minimal avg. data
	}
printf("%s\t",sen[qmincurrent])				# Print name of sensor starting from minimum
printf("%d\n",min+=min<0?-0.5:0.5)			# Print sensor avarage data with good rounding
}
print "======================================"
}
