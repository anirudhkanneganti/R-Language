library(tidyverse)

nz <- map_data("world")
nz <- map_data("usa")
tb<-as.tibble(nz)
View(tb)
?map_data

ggplot(nz, aes(long, lat, group = group,color=region)) +
  geom_polygon(fill = "green",colour="black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()
county <- map_data("county")
install.packages("mapproj")
install.packages("maptools")
install.packages("ggthemes")
install.packages("viridis")
install.packages("mapdata")
library(ggplot2)
library(maptools)
library(mapdata)
library(ggthemes)
library(tibble)
library(viridis)
library(mapproj)
us <- map_data("state")

choro_dat <- data_frame(some_other_name=unique(us$region),
                        some_critical_value=sample(10000, length(some_other_name)))
county <- map_data("county")

gg <- ggplot()
gg <- gg + geom_map(data=us, map=us,
                    aes(long, lat, map_id=region),
                    color="#2b2b2b", fill=NA, size=0.15)
gg <- gg + geom_map(data=choro_dat, map=us,
                    aes(fill=some_critical_value,
                        map_id=some_other_name),
                    color="white", size=0.15)
gg <- gg + scale_fill_viridis(name="Value")
gg <- gg + coord_map("polyconic")
gg <- gg + theme_map()
gg <- gg + theme(plot.margin=margin(20,20,20,20))
gg <- gg + theme(legend.position=c(0.85, 0.2))
gg



gg <- ggplot()
gg <- gg + geom_map(data=county, map=county,
                    aes(long, lat, map_id=region),
                    color="#2b2b2b", fill=NA, size=0.15)
gg <- gg + coord_map("polyconic")
gg <- gg + theme_map()
gg <- gg + theme(plot.margin=margin(20,20,20,20))
gg

install.packages("raster")
install.packages("rgdal")
install.packages("rgeos")
library(raster)
library(rgdal)
library(rgeos)
library(ggplot2)
library(dplyr)



india <- getData("GADM", country = "India", level = 1)

map <- fortify(india)
map$id <- as.integer(map$id)

dat <- data.frame(id = 1:(length(india@data$NAME_1)), state = india@data$NAME_1)
map_df <- inner_join(map, dat, by = "id")

centers <- data.frame(gCentroid(india, byid = TRUE))
centers$state <- dat$state

ggplot() +
  geom_map(data = map_df, map = map_df,
           aes(map_id = id, x = long, y = lat, group = group),
           color = "#ffffff", fill = "#bbbbbb", size = 0.25) +
  geom_text(data = centers, aes(label = state, x = x, y = y), size = 2) +
  coord_map()

ggplot() +
  geom_map(data = map_df, map = map_df,
           aes(map_id = id, x = long, y = lat, group = group,fill=state),
           color = "#ffffff", size = 0.25) +
  geom_text(data = centers, aes(label = state, x = x, y = y), size = 2) +
  coord_map() +
  labs(x = "", y = "", title = "India State")

######################################################################

india <- getData("GADM", country = "India", level = 1)

### Choose Andhra Pradesh
ap <- subset(india, NAME_1 == "Andhra Pradesh")

### SPDF to DF
map <- fortify(ap)
View(map)
### Draw a map

ggplot() +
  geom_map(data = map, map = map, aes(x = long, y = lat, map_id = id, group = group),fill="blue")+ coord_map()

###########################################################################
library(sp)
library(RColorBrewer)
load(IND_adm1.rds)
readRDS("IND_adm1.rds")
load("IND_adm1.RData")
ind1 = gadm

india <- getData("GADM", country = "India", level = 2)
View(india)
ap <- subset(india, NAME_1 == "Andhra Pradesh")
map <- fortify(ap)
View(map)

ggplot() +
  geom_map(data = map, map = map, aes(x = long, y = lat, map_id = id, group = group,fill=id))+ coord_map()

india <- getData("GADM", country = "India", level = 3)
ap <- subset(india, NAME_2 == "Samastipur")
View(ap)
map <- fortify(ap)
View(map)

ggplot() +
  geom_map(data = map, map = map, aes(x = long, y = lat, map_id = id, group = group,fill=id))+ coord_map()

ap$NAME_3 = as.factor(ap$NAME_3)
col = rainbow(length(levels(ap$NAME_3)))
spplot(ap,"NAME_3", main = "Taluk, District - Karnataka", colorkey=T,col.regions=col,scales=list(draw=T))


map <- qmap('Bapatla', zoom = 15, maptype = 'hybrid')
map
install.packages("ggmap")
library(ggmap)
?qmap

map1 <- qmap('Bapatla Engineering College', zoom = 18, maptype = 'hybrid')
map1

mapit <- qmap('QuintilesIMS, Prestige Techpark 2, Maratahalli', zoom = 19, maptype = 'hybrid')
mapit
