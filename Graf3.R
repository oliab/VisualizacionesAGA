
### Proyectos en etapa de ejecuci´pn agrupada por seccion

proy<-as.data.frame.matrix(table(aga$Sector, aga$Etapa))
names <- rownames(proy)
rownames(proy) <- NULL
proy<- cbind(names,proy)
colnames(proy)[1]<-"Sector"

top_labels <- c('Conclusion', 'Contratacion', 'Ejecucion', 'Planeacion')

ejec<-  plot_ly(proy, x = ~Planeación, y = ~Sector, type = 'bar', name = 'Planeacion', marker = list(color = 'rgb(49,130,189)'), orientation="h") %>%
  add_trace(x = ~Ejecución, name = 'Ejecucion', marker = list(color = 'rgba(222,45,38,0.8)')) %>%
  add_trace(x = ~Contratación, name = 'Contratacion', marker = list(color = 'rgb(28,208,204)')) %>%  
  add_trace(x = ~Conclusión, name = 'Conclusion', marker = list(color = 'rgb(345,204,204)')) %>%
    
  layout(title = 'Número de proyectos por sector',
        xaxis = list(title = "", tickangle = -45),
         yaxis = list(title = ""),
         margin = list(b = 100),
         barmode = 'group',
         margin=list(
           l = 550,
           r = 50,
           b = 100,
           t = 100,
           pad = 4
        ))
  
  link_ejec = api_create(ejec, filename = "Aga-Ejec")
  
  link_ejec
