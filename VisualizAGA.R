library(plotly)
library(readr)
library(plyr)

###Carga de documento central####

aga <-read_csv("~/Documents/VisualizacionAGA/BD_AGA-_Alianza_de_Gobierno_Abierto.csv")
View(aga)

###las credenciales para subir las gr`àficas`
oli <- plotly(username="oliabherrera", key="1Cth6ncpLnml54WrFpoY")

##Principales inversiones por estado y por infraestructura

####Hago los cambios para quitar signos de pesos y transformar a numerico
aga$Inversion<-substring(aga$Inversion,2, nchar(aga$Inversion) )
aga$Inversion<-as.numeric(aga$Inversion)
inv<-aggregate(aga[c("Inversion")], by=list(aga$Estado, aga$Sector), "sum")  ###inv es el agregado de inversi´ón por estao t oir sector

colnames(inv)[1]<-"Estado"
colnames(inv)[2]<-"Sector"

subsecretaria<- as.data.frame(unique(aga$Sector))
estados<-as.data.frame(unique(aga$Estado))
colnames(estados)[1]<-"Estado"

prueba<-cbind(data$Estado,data$Inversion)
prueba<-as.data.frame(prueba)
colnames(prueba)[1]<-"Estado"
colnames(prueba)[2]<-as.character(subsecretaria[i,])

i<-1

for ( i in 1: 5){
  sector<-subset(inv, Sector==subsecretaria[i,])
  colnames(sector)[1]<-"Estado"
  colnames(sector)[2]<-"Subsector"
  
  data <- merge(estados, sector, by=c("Estado"), all = TRUE)
  data[is.na(data)] <- 0
  data$Subsector<-subsecretaria[i,]
  data<-as.data.frame(data)
  data$Estado<-as.character(data$Estado)
  data$Subsector<-as.character(data$Subsector)
  
  if (i==1){
    prueba<-cbind(data$Estado,data$Inversion)
    prueba<-as.data.frame(prueba)
    colnames(prueba)[1]<-"Estado"
    colnames(prueba)[2]<-as.character(subsecretaria[i,])
    i<-i+1
  } else {
    
    prueba<-as.data.frame(cbind(prueba, data$Inversion))
    
    colnames(prueba)[ncol(prueba)]<-as.character(subsecretaria[i,])
    i<-i+1
    
  }
}


inv<-plot_ly(prueba, x = ~Estado, y = ~Aeropuertos, type = 'bar', name = 'Aeropuertos') %>%
  add_trace(y = ~Carreteras, name = 'Carreteras') %>%
  add_trace(y = ~Marítimo, name = 'Marítimo') %>%
  add_trace(y = ~Ferroviario, name = 'Ferroviario') %>%
  add_trace(y = ~Telecomunicaciones, name = 'Telecomunicaciones') %>%
  layout(yaxis = list(title = 'Inversión Total'), barmode = 'stack')

chart_link = api_create(inv, filename = "Aga-InvTotal")

chart_link
