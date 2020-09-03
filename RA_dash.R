
## Setting working directory
setwd('~/repos/GA_COVID19_summary/')

#data taken from GDPH daily status reports https://dph.georgia.gov/covid-19-daily-status-report
#note that we were unable to measure the records on 2020/4/18
#These go from 24/March to 1/June at 7pm
recordedCases= c(1097,1387,1643,2198,2446,2683,3032,4117,4748,5444,5967,6383,6742,7558,9156,9901,10885,11859,12261,12550,13621,14578,15409,16369,17432,17669,18489,19398,20166,21102,21883,22491,23216,23481,23913,24854,25646,26155,27492,28331,28671,29442,30526,30738,31600,32181,32586,33508,34002,34848,35427,35977,36772,37212,37552,38283,38855,39801,40663,41482,42242,42902,43400,43983,44638,45266,45863,46331,47063,47899)
recordedDeaths = c(38,47,56,65,79,83,102,125,154,176,198,208,219,294,348,362,412,425,432,442,480,524,579,617,668,673,689,774,818,846,881,899,907,916,971,1036,1096,1120,1167,1175,1179,1244,1302,1327,1352,1399,1401,1405,1444,1494,1517,1544,1588,1598,1606,1649,1675,1697,1775,1808,1822,1827,1848,1895,1933,1973,1984,2004,2053,2089)
recordedHospitalised = c(361,438,509,607,660,678,773,885,1013,1129,1222,1266,1296,1393,1899,1993,2298,2454,2491,2518,2702,2858,3024,3260,3395,3420,3489,3702,3885,4018,4154,4322,4353,4377,4681,4897,5076,5156,5311,5388,5405,5537,5699,5785,5866,5976,5989,5999,6036,6227,6308,6374,6518,6767,6835,6992,7076,7171,7289,7376,7431,7450,7507,7640,7745,7829,7914,7927,7951,8302) 
#LAST UPDATE 7pm 27th May 2020

#These data go from 2nd June at 3pm
recordedCases= c(recordedCases,48207,48894,49847,50621,51359,51898,52497,53249,53980,54973,55783,56801,57681,58414,59078,60030,60912,62009,63809,64701,65928,67678,69381,71095,72995,74985,77210,79247,81291,84237,87709,90493,93319,95516,97064,100470,103890,106727,111211,114401,116926,120569,123963,127834,131275,135183,139872,143123,145575,148988,152302,156588,161401,165188,167953,170843,175052,178323,182286,186382,190012,193177,195435,197948,201713,204895,209004,213427,216596,219025,222588,226153,228668,231895,235168,237030,238861,241677,
243982,246741,249630,252222,253949,256253,258354,260590,263074,265372,267758,268973,270471,272697,274613,277288)
recordedDeaths = c(recordedDeaths,2102,2123,2147,2174,2178,2180,2208,2285,2329,2375,2418,2446,2451,2494,2529,2575,2605,2636,2642,2643,2648,2688,2698,2745,2770,2776,2778,2784,2805,2827,2849,2856,2857,2860,2878,2899,2922,2930,2965,2996,3001,3026,3054,3091,3104,3132,3168,3173,3176,3254,3335,3360,3442,3495,3498,3509,3563,3642,3671,3752,3825,3840,3842,3921,3984,4026,4117,4186,4199,4229,4351,4456,4538,4573,4669,4702,4727,4794,4849,4904,4998,5092,5132,5156,5262,5311,5393,5471,5576,5604,5632,5733,5795,5868)
recordedHospitalised = c(recordedHospitalised,8334,8419,8557,8646,8682,8685,8746,8872,8974,9073,9181,9224,9248,9322,9454,9543,9663,9772,9837,9864,9953,10123,10313,10457,10605,10689,10711,10824,11051,11275,11500,11653,11743,11775,11919,12226,12500,12606,12937,13205,13259,13476,13685,14102,14346,14647,14961,15010,15047,15494,15922,16353,16752,17029,17091,17138,17544,17964,18303,18689,18995,19064,19124,19426,19788,20002,20282,20556,20628,20676,21031,21379,21581,21818,22028,22087,22133,22429,22664,22880,23125,23325,23369,23425,23717,23939,24127,24335,24533,24572,24604,24847,25025,25259)


#from GEMA Sit. Reports
currentHospitalised = c(1500,1440,1410,1377,1343,1339,1309,1227,1179,1144,1133,1125,1091,1060,1029,1005,1010,1025,986,959,919,889,848,848,892,854,907,902,891,850,853,841,828,815,807,790,788,783,819,834,817,842,836,810,829,865,875,881,921,937,944,960,1000,1056,1124,1135,1184,1178,1236,1359,1459,1570,1649,1671,1726,1805,1962,2096,2215,2322,2443,2446,2512,2600,2741,2786,2841,2902,2929,3036,3183,3155,3179,3157,3135,3094,3079,3181,3157,3188,3200,3155,3095,3069,3111,3094,3077,3006,2981,2878,2865,2871,2881,2865,2807,2691,2586,2603,2626,2596,2573,2506,2408,2361,2360,2350,2260,2227,2129,2081,1978,1938,1929,1916,1859,1793)


#positive PCR (from 9th July)
PCRTotToday = c(19013,26926,18525,18543,24551,23067,23949,23239,20456,33128,23513,18462,21510,21533,20094,45506,25396,21105,24018,34363,25138,28925,33298,21398,28555,21761,18011,30812,29538,28367,44837,37082,26914,33523,21257,25868,27443,18013,17207,24429,30617,15378,21138,23267,29068,22714,33297,25669,18051,19936,18147,25195,15311,16144,24864,13139,29028)
PCRposToday = c(2727,3557,2615,2417,3799,3156,3251,3466,3279,4373,3077,2537,2988,2647,3430,5103,3431,2679,3388,4131,2937,3649,3896,3096,3278,2611,2288,3375,3041,3234,4347,3034,2243,2703,2338,2256,2990,1557,1831,1953,2506,1606,1947,2398,2685,1910,4899,2003,1620,1631,1634,2193,1324,1755,1906,1114,2245)
PCRpercentToday = 100*PCRposToday/PCRTotToday

## LAST UPDATED SEPTEMBER 1 2020

TODAY = Sys.Date()

### Look at PCR data

#DatPCR = seq(as.Date("2020-07-09"),as.Date(TODAY),by=1)

#RA_PT =c()
#RA_PTot=c()
#RA_P =c()
#WINDOW = 7
#for(aa in 1:(length(PCRpercentToday)-WINDOW)){
#	RA_P[aa] = mean(PCRpercentToday[aa:(aa+WINDOW)])
#	RA_PTot[aa] = mean(PCRTotToday[aa:(aa+WINDOW)])
#	RA_PT[aa] = max(DatPCR[(aa+1):(aa+WINDOW+1)])
#}

#THING = PCRpercentToday #PCRTotToday
#plot(DatPCR, THING,col=NA,ylab="% of days PCR tests positive",xlab="",ylim=c(7,19))
#WEEKENDS
#SAT = modDatesRec[5]
#SUN = modDatesRec[6]
#for (aa in 1:50){
#	polygon(c(SAT - 0.5, SUN+0.5,SUN+0.5,SAT-0.5), c(-5000,-5000,500000,500000),col="grey",border=NA)
#	SAT = SAT+7
#	SUN= SUN+7
#}
#points(DatPCR, THING,pch=19)
#lines(RA_PT,RA_P,col=COL,lwd=5)
#box()
#legend("topleft",c("7 day moving average"),col=COL,lty=1,lwd=5, box.col = "lightblue", bg = "lightblue")


### Make summary figure



CurrHTime = seq(as.Date("2020-05-01"),as.Date(TODAY),by=1)
DATESRECORD = seq(as.Date("2020-03-24"),as.Date(TODAY),by=1)
modDatesRec = as.Date(DATESRECORD)

LREC = length(recordedCases)

#calculate cases per day and deaths per day
recordedCPD = recordedCases[2:LREC] - recordedCases[1:(LREC-1)]
recordedDPD = recordedDeaths[2:LREC] - recordedDeaths[1:(LREC-1)]
recordedHPD = recordedHospitalised[2:LREC] - recordedHospitalised[1:(LREC-1)]



#7day rolling AVG
RA_C=c()
RA_D=c()
RA_H=c()
RA_T =c()
WINDOW = 7
for(aa in 1:(length(recordedCPD)-WINDOW)){
	RA_C[aa] = mean(recordedCPD[aa:(aa+WINDOW)])
	RA_D[aa] = mean(recordedDPD[aa:(aa+WINDOW)])
	RA_H[aa]  = mean(recordedHPD[aa:(aa+WINDOW)])
	RA_T[aa] = max(modDatesRec[(aa+1):(aa+WINDOW+1)])
}


######################################

dev.new(width=12, height=10, unit="in")
WINDOWSIZE = 90

XLIM = c(as.Date(TODAY) - WINDOWSIZE ,as.Date(TODAY)+1)

COL="royalblue"
AXCEX = 1.1
AXCEX2 = 1.4
TIMES = c(XLIM[1], as.Date(c("2020-03-24","2020-04-01","2020-04-15","2020-05-01","2020-05-15","2020-06-01","2020-06-15","2020-07-01","2020-07-15","2020-08-01","2020-08-15","2020-09-01","2020-09-15")) , as.Date(DATESRECORD[length(DATESRECORD)]))
par(mfrow=c(3,3),mar= c(3.8,5.5,1,1))

plot(0,0,xaxt="n",yaxt="n",col=NA,axes="F",ylab="",xlab="")
text(0,0.4,paste("COVID-19 status for GA\nover the last",WINDOWSIZE,"days"),font=2,cex=2.2)
text(0,-0.1,paste("Reported today (",TODAY,"):\n","+",recordedCPD[LREC-1]," cases   +",recordedHPD[LREC-1]," hospitalizations   +",recordedDPD[LREC-1]," deaths",sep=""),font=2,cex=1.2,col="red4")

text(-1,-0.7,"This reflects differences since yesterdays report.\n\nData gathered from:\nGA DPH:  dph.georgia.gov/covid-19-daily-status-report \nGEMA:  gema.georgia.gov/coronavirus \n\nFor more details on risk, and county-level risk assessments\nvisit:  covid19risk.biosci.gatech.edu ",cex=0.9,pos=4)

#CASES
#per day
plot(modDatesRec[2:(LREC)],recordedCPD,ylab="New recorded\ncases per day",xlab="",pch =19,ylim=c(0,5000),xaxt="n",col=NA,xlim=XLIM,xaxs="i",cex.lab=AXCEX2,cex.axis=AXCEX)
axis.Date(1,at=TIMES,format="%e %b",las=2,cex.axis=AXCEX)
#WEEKENDS
SAT = modDatesRec[5]
SUN = modDatesRec[6]
for (aa in 1:50){
	polygon(c(SAT - 0.5, SUN+0.5,SUN+0.5,SAT-0.5), c(-5000,-5000,500000,500000),col="grey",border=NA)
	SAT = SAT+7
	SUN= SUN+7
}
legend("topleft",c("7 day moving average"),col=COL,lty=1,lwd=5, box.col = "lightblue", bg = "lightblue")#box.col = rgb(1,0,0,0.5), bg = rgb(1,0,0,0.5))
lines(RA_T,RA_C,lwd=5,col=COL)
points(modDatesRec[2:(LREC)],recordedCPD,pch=19)
box()
#cumulative
plot(modDatesRec,recordedCases,ylab="Cumulative cases",xaxt="n",col=NA,xlab="",xlim=XLIM,xaxs="i",cex.lab=AXCEX2,cex.axis=AXCEX)
axis.Date(1,at=TIMES,format="%e %b",las=2,cex.axis=AXCEX)
#WEEKENDS
SAT = modDatesRec[5]
SUN = modDatesRec[6]
for (aa in 1:50){
	polygon(c(SAT - 0.5, SUN+0.5,SUN+0.5,SAT-0.5), c(-10000,-100000,500000,500000),col="grey",border=NA)
	SAT = SAT+7
	SUN= SUN+7
}
points(modDatesRec,recordedCases,pch=19)
box()


abline(v= modDatesRec[which(recordedCases>recordedCases[LREC]/4)[1]])
abline(v= modDatesRec[which(recordedCases>recordedCases[LREC]/2)[1]])
abline(v= modDatesRec[which(recordedCases>recordedCases[LREC]/4*3)[1]])


#RISK
ActiveInf = c()
AI_T=c()
Ascertainty = c(6,14)
GAPOP = 10617423
WINDOW=14
for(aa in 1:(length(recordedCases)-WINDOW)){
	ActiveInf[aa] = recordedCases[aa+WINDOW] - recordedCases[aa]
}
AI_T = modDatesRec[(1+WINDOW):length(modDatesRec)]
pH = Ascertainty[2]*ActiveInf/GAPOP
pL = Ascertainty[1]*ActiveInf/GAPOP

n = 10
n2 = 30
n3 = 75

plot(AI_T,1-(1-pL)^n,col=NA,ylim=c(0,100),ylab="Risk one or more in a\ngroup are infectious (%)",xaxt="n",xaxs="i",xlab="",xlim=XLIM,cex.lab=AXCEX2,cex.axis=AXCEX)
axis.Date(1,at=TIMES,format="%e %b",las=2,cex.axis=AXCEX)
#WEEKENDS
SAT = modDatesRec[5]
SUN = modDatesRec[6]
for (aa in 1:50){
	polygon(c(SAT - 0.5, SUN+0.5,SUN+0.5,SAT-0.5), c(-100,-100,500000,500000),col="grey",border=NA)
	SAT = SAT+7
	SUN= SUN+7
}
abline(h = 0,lty=3,col=rgb(0.6,0.6,0.6))
abline(h = 20,lty=3,col=rgb(0.6,0.6,0.6))
abline(h = 40,lty=3,col=rgb(0.6,0.6,0.6))
abline(h = 60,lty=3,col=rgb(0.6,0.6,0.6))
abline(h = 80,lty=3,col=rgb(0.6,0.6,0.6))
abline(h = 100,lty=3,col=rgb(0.6,0.6,0.6))

polygon(c(AI_T, rev(AI_T)), c(100*(1-(1-pL)^n), rev(100*(1-(1-pH)^n))),col=rgb(1.0, 0, 0, 0.25),border=NA)#,col = 'indianred2',border = NA)
polygon(c(AI_T, rev(AI_T)), c(100*(1-(1-pL)^n2), rev(100*(1-(1-pH)^n2))),col=rgb(1.0, 0, 0, 0.5),border=NA)#,col = 'tomato2',border = NA)
polygon(c(AI_T, rev(AI_T)), c(100*(1-(1-pL)^n3), rev(100*(1-(1-pH)^n3))),col=rgb(1, 0, 0, 0.75),border=NA)#,col = 'red4',border = NA)
rect(XLIM[1],75,XLIM[1]+40,105,col="lightblue",border=NA)
text(XLIM[1]+20,87.5, paste("Uncertainty assumes\nbetween",Ascertainty[1],"and",Ascertainty[2],"\nunrecorded cases for\nevery recorded case\n"))

XIND = length(pL)-20
text( XLIM-20,mean(c(100*(1-(1-pL[XIND])^n),100*(1-(1-pH[XIND])^n))),paste("Group of",n),cex=1.2,font=2)
text( XLIM-20,mean(c(100*(1-(1-pL[XIND])^n2),100*(1-(1-pH[XIND])^n2))),paste("Group of",n2),cex=1.2,font=2)
text( XLIM-20,mean(c(100*(1-(1-pL[XIND])^n3),100*(1-(1-pH[XIND])^n3))),paste("Group of",n3),cex=1.2,font=2)
box()


#DEATHS
#per day
plot(modDatesRec[2:(LREC)],recordedDPD,ylab="New recorded\ndeaths per day",xlab="",pch=19,xaxt="n",col=NA,xlim=XLIM,xaxs="i",cex.lab=AXCEX2,cex.axis=AXCEX)
axis.Date(1,at=TIMES,format="%e %b",las=2,cex.axis=AXCEX)
#WEEKENDS
SAT = modDatesRec[5]
SUN = modDatesRec[6]
for (aa in 1:50){
	polygon(c(SAT - 0.5, SUN+0.5,SUN+0.5,SAT-0.5), c(-100,-100,500000,500000),col="grey",border=NA)
	SAT = SAT+7
	SUN= SUN+7
}
legend("topleft",c("7 day moving average"),col=COL,lty=1,lwd=5, box.col = "lightblue", bg = "lightblue")# box.col = rgb(1,0,0,0.5), bg = rgb(1,0,0,0.5))
lines(RA_T,RA_D,lwd=5,col=COL)
points(modDatesRec[2:(LREC)],recordedDPD,pch=19)
box()
#cumulative
plot(modDatesRec,recordedDeaths,ylab="Cumulative deaths",xaxt="n",col=NA,xlab="",xlim=XLIM,xaxs="i",cex.lab=AXCEX2,cex.axis=AXCEX)
axis.Date(1,at=TIMES,format="%e %b",las=2,cex.axis=AXCEX)
#WEEKENDS
SAT = modDatesRec[5]
SUN = modDatesRec[6]
for (aa in 1:50){
	polygon(c(SAT - 0.5, SUN+0.5,SUN+0.5,SAT-0.5), c(-10000,-10000,500000,500000),col="grey",border=NA)
	SAT = SAT+7
	SUN= SUN+7
}
points(modDatesRec,recordedDeaths,pch=19)
box()

abline(v= modDatesRec[which(recordedDeaths>recordedDeaths[LREC]/4)[1]])
abline(v= modDatesRec[which(recordedDeaths>recordedDeaths[LREC]/2)[1]])
abline(v= modDatesRec[which(recordedDeaths>recordedDeaths[LREC]/4*3)[1]])


#CURR H
plot(CurrHTime,currentHospitalised,xlim=XLIM,col=NA,xlab="",xaxt="n",xaxs="i",ylab="Currently hospitalized\nwith COVID-19",cex.lab=AXCEX2,cex.axis=AXCEX,ylim=c(0,max(currentHospitalised)+(max(currentHospitalised)-min(currentHospitalised))*0.04))
axis.Date(1,at=TIMES,format="%e %b",las=2,cex.axis=AXCEX)
#WEEKENDS
SAT = modDatesRec[5]
SUN = modDatesRec[6]
for (aa in 1:50){
	polygon(c(SAT - 0.5, SUN+0.5,SUN+0.5,SAT-0.5), c(-5000,-5000,500000,500000),col="grey",border=NA)
	SAT = SAT+7
	SUN= SUN+7
}
points(CurrHTime,currentHospitalised,pch=19)
box()

#HOSPS
#per day
plot(modDatesRec[2:(LREC)],recordedHPD,ylab="New recorded \nhospitalizations per day",xlab="",pch=19,xaxt="n",col=NA,xlim=XLIM,xaxs="i",cex.lab=AXCEX2,cex.axis=AXCEX)
axis.Date(1,at=TIMES,format="%e %b",las=2,cex.axis=AXCEX)
#WEEKENDS
SAT = modDatesRec[5]
SUN = modDatesRec[6]
for (aa in 1:50){
	polygon(c(SAT - 0.5, SUN+0.5,SUN+0.5,SAT-0.5), c(-100,-100,500000,500000),col="grey",border=NA)
	SAT = SAT+7
	SUN= SUN+7
}
legend("topleft",c("7 day moving average"),col=COL,lty=1,lwd=5,inset=-0.01, box.col = "lightblue", bg = "lightblue")# box.col = rgb(1,0,0,0.5), bg = rgb(1,0,0,0.5))
lines(RA_T,RA_H,lwd=5,col=COL)
points(modDatesRec[2:(LREC)],recordedHPD,pch=19)
box()
#cumulative
plot(modDatesRec,recordedHospitalised,ylab="Cumulative hospitalizations",xaxt="n",col=NA,xlab="",xlim=XLIM,xaxs="i",cex.lab=AXCEX2,cex.axis=AXCEX)
axis.Date(1,at=TIMES,format="%e %b",las=2,cex.axis=AXCEX)
#WEEKENDS
SAT = modDatesRec[5]
SUN = modDatesRec[6]
for (aa in 1:50){
	polygon(c(SAT - 0.5, SUN+0.5,SUN+0.5,SAT-0.5), c(-10000,-10000,500000,500000),col="grey",border=NA)
	SAT = SAT+7
	SUN= SUN+7
}
points(modDatesRec,recordedHospitalised,pch=19)
box()


abline(v= modDatesRec[which(recordedHospitalised>recordedHospitalised[LREC]/4)[1]])
abline(v= modDatesRec[which(recordedHospitalised>recordedHospitalised[LREC]/2)[1]])
abline(v= modDatesRec[which(recordedHospitalised>recordedHospitalised[LREC]/4*3)[1]])


dev.copy(jpeg,paste0(Sys.Date(),".jpg"),width=12, height=10, units="in",res=1000)
dev.off()










