dati=mydata
#ricodifica e rinominazione delle variabili::
salari=dati$PY010N
dati$salari=dati$PY010N

nazione=as.factor(dati$PB020)
dati$nazione=as.factor(dati$PB020)
#cambio la baseline in Italia
nazione=relevel(nazione,"IT")
dati$nazione=relevel(dati$nazione,"IT")

eta=dati$PB010-dati$PB140
dati$eta=dati$PB010-dati$PB140
eta.classi=as.factor(ifelse(eta<=25, "15-25", 
                            ifelse(eta<35, "26-35",
                                   ifelse(eta<45,"36-45",
                                          ifelse(eta<55,"46-55",
                                                 ifelse(eta<=65,"56-65","over 65"))))))
dati$eta=dati$PB010-dati$PB140
dati$donna=ifelse(dati$PB150==2,1,0)
donna=ifelse(dati$PB150==2,1,0)

dati$sposato=ifelse(dati$PB190==2,1,0)
sposato=ifelse(dati$PB190==2,1,0)

dati$istruzione=as.factor(ifelse(dati$PE041<200,"istruzione secondaria inferiore",
                                 ifelse(dati$PE041<300,"istruzione secondaria superiore",
                                        ifelse(dati$PE041<400,"laurea triennale","studio superiore"))))
istruzione=as.factor(ifelse(dati$PE041<200,"istruzione secondaria inferiore",
                            ifelse(dati$PE041<300,"istruzione secondaria superiore",
                                   ifelse(dati$PE041<400,"laurea triennale","studio superiore"))))
#cambio baseline in "istruzione secondaria superiore"
dati$istruzione=relevel(dati$istruzione,"istruzione secondaria superiore")

job=dati$PL051A
lavoro=as.factor(ifelse(job>=10&job<20|job==0|job==1,"professioni di alta dirigenza",
                        ifelse(job>=20&job<30|job==2,"Professioni intellettuali, scientifiche e di elevata specializzazione",
                               ifelse(job>=30&job<40|job==3,"Professioni tecniche",
                                      ifelse(job>=40&job<50|job==4,"Professioni esecutive nel lavoro d'ufficio",
                                             ifelse(job>=50&job<60|job==5,"Professioni qualificate nelle attivita', commerciali e nei servizi",
                                                    ifelse(job>=60&job<70|job==6,"Artigiani, operai specializzati e agricoltori",
                                                           ifelse(job>=70&job<80|job==7,"Conduttori di impianti, operai di macchinari fissi e mobili e conducenti di veicoli",
                                                                  ifelse(job>=80&job<90|job==8,"Professioni non qualificate","forze armate")))))))))

dati$lavoro=as.factor(ifelse(job>=10&job<20|job==0|job==1,"professioni di alta dirigenza",
                             ifelse(job>=20&job<30|job==2,"Professioni intellettuali, scientifiche e di elevata specializzazione",
                                    ifelse(job>=30&job<40|job==3,"Professioni tecniche",
                                           ifelse(job>=40&job<50|job==4,"Professioni esecutive nel lavoro d'ufficio",
                                                  ifelse(job>=50&job<60|job==5,"Professioni qualificate nelle attivita', commerciali e nei servizi",
                                                         ifelse(job>=60&job<70|job==6,"Artigiani, operai specializzati e agricoltori",
                                                                ifelse(job>=70&job<80|job==7,"Conduttori di impianti, operai di macchinari fissi e mobili e conducenti di veicoli",
                                                                       ifelse(job>=80&job<90|job==8,"Professioni non qualificate","forze armate")))))))))
dati$lavoro=relevel(dati$lavoro,"Professioni esecutive nel lavoro d'ufficio")

lavoro_num=as.factor(ifelse(job>=10&job<20|job==0|job==1,1,
                            ifelse(job>=20&job<30|job==2,2,
                                   ifelse(job>=30&job<40|job==3,3,
                                          ifelse(job>=40&job<50|job==4,4,
                                                 ifelse(job>=50&job<60|job==5,5,
                                                        ifelse(job>=60&job<70|job==6,6,
                                                               ifelse(job>=70&job<80|job==7,7,
                                                                      ifelse(job>=80&job<90|job==8,8,9)))))))))


#creo nuova variabile categoriale per distinguere il genere e lo stato civile:
variabile=as.factor(ifelse(donna==1&sposato==1,"Donne sposate",
                           ifelse(donna==0&sposato==1,"uomo sposato",
                                  ifelse(donna==1&sposato==0,"donna nubile","uomo celibe"))))


dati$variabile=as.factor(ifelse(donna==1&sposato==1,"Donne sposate",
                                ifelse(donna==0&sposato==1,"uomo sposato",
                                       ifelse(donna==1&sposato==0,"donna nubile","uomo celibe"))))

#############
############
##########
########
######
####
##
#

par(mfrow=c(1,3))
# Salario medio per nazione ordinato
nation_salaries <- tapply(salari, nazione, mean)[order(-tapply(salari, nazione, mean))]
barplot(nation_salaries, col=rainbow(length(nation_salaries)),
        main="Salario Medio per Nazione", xlab="Nazione", ylab="Salario", names.arg=names(nation_salaries))

# Salario medio per tipo di occupazione
lavoro_num
job_salaries <- tapply(salari, lavoro_num, mean)
barplot(job_salaries, col=heat.colors(length(job_salaries)),
        main="Salario Medio per Tipo di Occupazione", xlab="Tipo di Occupazione", ylab="Salario", names.arg=names(job_salaries), cex.names=0.8)

# Scatter plot con jitter per genere e salario
plot(jitter(donna, 0.25), salari, cex=0.7, col=ifelse(donna==1, "lightpink", "lightblue"), 
     xlab="Genere", ylab="Salario", main="Scatter Plot Genere/Salario")
abline(h=mean(salari[donna==0]),col="lightblue")
abline(h=mean(salari[donna==1]),col="lightpink")
legend("center", legend=c("Uomo", "Donna"), col=c("lightblue", "lightpink"), pch=15)


#Modelli
library(arm)
# regressione dei salari in funzione del genere e controllando per nazione:
fit.1=lm(log(salari)~ donna+nazione,data=dati)
display(fit.1)
summary(fit.1)
coefplot(fit.1)
#tutti significativi
exp(-0.20)-1
#per significatività economica si va a confrontare coi grafici per nazione e per genere.

# per capire se la residenza in italia aumenti la discirmazione:
fit.2=lm(log(salari)~ donna+nazione+donna*nazione,data=dati)
display(fit.2)
# gfrafico di confronto tra boxplot di Germania, Italia e Portogallo:
par(mfrow=c(1,3))
boxplot(salari[nazione=="DE"]~donna[nazione=="DE"])
boxplot(salari[nazione=="IT"]~donna[nazione=="IT"])
boxplot(salari[nazione=="PT"]~donna[nazione=="PT"])


# modello con interazione.
fit.3=lm(log(salari)~ rescale(eta)+istruzione+donna+sposato+lavoro+nazione,data=dati)
display(fit.3,digits = 3)
summary(fit.3)
# salario del medio man è:
exp(9.84)
# presi due medio man con 23 anni di differenza mi aspetto un aumento del salario del 24% da parte del piu anziano
2*sd(eta)
exp(0.22)-1

# donne per ciascuna cateogria di lavoro:
tapply(donna,lavoro,mean)
#grafico:
barplot(tapply(donna,lavoro_num,mean))
# istruzione per ciascuna cateogira di lavoro:
tapply(istruzione,lavoro,table)
#frequenza relativa del titolo di studio superiore per ciascuna categoria di lavoro:
table(lavoro[istruzione=="studio superiore"])/table(lavoro)
#frequenza relativa di un titolo al più di studio secondario superiore per ciascuna cateogria di lavoro:
(table(lavoro[istruzione=="istruzione secondaria inferiore"])+table(lavoro[istruzione=="istruzione secondaria superiore"]))/table(lavoro)

#modello con interazione donna nazione
fit.3a=lm(log(salari)~ rescale(eta)+istruzione+donna+sposato+lavoro+nazione+donna*nazione,data=dati)
display(fit.3a,digits = 3)
summary(fit.3a)
coefplot(fit.3a)


# coefficiente di interazione come fatto prima.
fit.4=lm(log(salari)~ rescale(eta)+istruzione+donna+sposato+lavoro+nazione+donna*sposato,data=dati)
display(fit.4,digits = 3)
summary(fit.4)


#beta sposato: 0.119 
# beta donna: -0.174
# beta donna sposato: -0.126
#beta complessivo donna:

# bheta complessivo donna=-0.126*sposato-0.174---> -0.25918 se sposata mentre -0.15970 se non sposata
# bheta complessivo sposato=-0.126*donna+0.119---> 0.126367 se uomo mentre -0.00698 se donna



z.eta=(50-mean(dati$eta))/(sd(dati$eta)*2)
# confronto tra donna e uomo non sposato
x.new_uomo<-exp(coef(fit.4)[1] + coef(fit.4)[2]*z.eta + coef(fit.4)[5])
x.new_donna<-exp(coef(fit.4)[1] + coef(fit.4)[2]*z.eta + coef(fit.4)[5]+coef(fit.4)[6])
# confronto tra donna e uomo sposato:
x.new_uomo.s<-exp(coef(fit.4)[1] + coef(fit.4)[2]*z.eta + coef(fit.4)[5]+coef(fit.4)[7])
x.new_donna.s<-exp(coef(fit.4)[1] + coef(fit.4)[2]*z.eta + coef(fit.4)[5]+coef(fit.4)[6]+coef(fit.4)[7]+coef(fit.4)[31])
