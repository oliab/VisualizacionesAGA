

#####Total de proyectos por estado en etapa de ejecucuón

##Total de proyectos por estado
proy_edo<- table(aga$Estado)
proy_edo<-as.data.frame(proy_edo)
colnames(proy_edo)[1]<- "Estado"
colnames(proy_edo)[2]<- "ProyectosTotales"

proy_edo_ejec<-subset(aga, Etapa=="Ejecución")
proy_edo_ejec<-table(proy_edo_ejec$Estado)
proy_edo_ejec<-as.data.frame(proy_edo_ejec)
colnames(proy_edo_ejec)[1]<-"Estado"
colnames(proy_edo_ejec)[2]<-"ProyectosenEjecucion"
proy_edo_ejec <- merge(estados, proy_edo_ejec, by=c("Estado"), all = TRUE)
proy_edo_ejec[is.na(proy_edo_ejec)] <- 0


final<-merge(proy_edo,proy_edo_ejec)
vec_resta<-final$ProyectosTotales-final$ProyectosenEjecucion
final<-cbind(final,vec_resta)


edo<-plot_ly(final, x = ~Estado, y = ~ProyectosenEjecucion, type = 'bar', name = 'Proyectos en Ejecucion') %>%
  add_trace(y = ~vec_resta, name = 'Proyectos en otras etapas') %>%
  layout(yaxis = list(title = 'Proyectos en Ejecuci´ón por estado'), barmode = 'stack')

link_edo = api_create(edo, filename = "Aga-EstadoEjec")

link_edo