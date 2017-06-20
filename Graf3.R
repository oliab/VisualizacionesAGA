
### Proyectos en etapa de ejecuci´pn agrupada por seccion

proy<-as.data.frame.matrix(table(aga$Sector, aga$Etapa))
names <- rownames(proy)
rownames(proy) <- NULL
proy<- cbind(names,proy)
colnames(proy)[1]<-"Sector"

top_labels <- c('Conclusion', 'Contratacion', 'Ejecucion', 'Planeacion')

  plot_ly(proy, x = ~Sector, y = ~Planeación, type = 'bar', name = 'Planeacion', marker = list(color = 'rgb(49,130,189)')) %>%
  add_trace(y = ~Ejecución, name = 'Ejecucion', marker = list(color = 'rgb(204,204,204)')) %>%
  add_trace(y = ~Contratación, name = 'Contratacion', marker = list(color = 'rgb(28,208,204)')) %>%  
  add_trace(y = ~Conclusión, name = 'Conclusion', marker = list(color = 'rgb(254,204,204)')) %>%
    
  layout(xaxis = list(title = "", tickangle = -45),
         yaxis = list(title = ""),
         margin = list(b = 100),
         barmode = 'group')
