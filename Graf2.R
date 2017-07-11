

######Montos de inversi´ón por sector en etapa de ejecuci´ón

proy_ejec<-subset(aga, Etapa=="Ejecución")
proy_ejec<-as.data.frame(proy_ejec)
inv<-aggregate(proy_ejec[c("Inversion")], by=list(proy_ejec$Sector), "sum")
colnames(inv)[1]<-"Sector"

colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')

p <- plot_ly(inv, labels = ~Sector, values = ~Inversion, type = 'pie',
             textposition = 'inside',
             textinfo = 'label+percent',
             insidetextfont = list(color = '#FFFFFF'),
             hoverinfo = 'text',
             text = ~paste('$', Inversion, ' billions'),
             marker = list(colors = colors,
                           line = list(color = '#FFFFFF', width = 1)),
             #The 'pull' attribute can also be used to create space between the sectors
             showlegend = FALSE) %>%
  layout(title = 'Montos de inversión por sector en etapa de Ejecución',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p
