BEGIN {greadings=5 # count of sensors
MAXINT=9999
FS= "[/ ]"
}{
for(readings = 1; readings <= greadings; readings++){ 
	i[$2]++
	reading[$2]+=$3
	if ($1 == readings) {sen[$1]=$2}
	}
}
END{
for(a=1; a <= greadings; a++){avg[a]=reading[a]/i[a]}
for (z=1;z<=greadings;z++){
	min=avg[z]
	for (y=1;y<=greadings;y++){
	if (avg[y]<min){min=avg[y]}
	}
for (q=1;q<=greadings;q++){
	if (avg[q]==min){
		avg[q]=MAXINT
		qmincurrent=q}
	}
printf("%s\t",sen[qmincurrent])
printf("%d\n",min+=min<0?-0.5:0.5)
}
print "======================================"
}
