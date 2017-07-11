library(plotly)
library(readr)
library(plyr)
library("knitr")
library("devtools")

source("VisualizAGA.R")
source("Graf2.R")
source("Graf3.R")
source("Grafica_proy_Edoej.R")

chart_link
link_inv_sec
link_ejec
link_edo


url<-"https://plot.ly/~oliabherrera/7.embed" 
plotly_iframe <- paste("<center><iframe scrolling='no' seamless='seamless' style='border:none' src='", url, 
                       "/800/1200' width='800' height='1200'></iframe><center>", sep = "")