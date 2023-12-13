library(terra)

setwd("C:\\aaa_lavori\\lav_moloch_pasi")


dem_ita02=readRDS("dem2km_mol.rds") # anydem
r_ita02=dem_ita02*0
coast_medit=vect("medit_coast_diss.shp")
coast_medit_mol <- project(coast_medit, crs(r_ita02))

saveRDS(coast_medit_mol,"coast_medit_projmol.rds")



landmask0na <- mask(r_ita02, coast_medit_mol)
saveRDS(landmask0na,"landmask0na.rds")

png("landmask0na.png")
plot(landmask0na)
dev.off()


landmask1na<-landmask0na+1
saveRDS(landmask1na,"landmask1na.rds")
png("landmask1na.png")
plot(landmask1na)
dev.off()

landmask10=ifel(is.na(landmask1na),0,1)
saveRDS(landmask10,"landmask10.rds")

png("landmask10.png")
plot(landmask10)
dev.off()


seamask01=ifel(landmask10==1,0,1)
seamask1na=ifel(seamask01==0,NA,1)
seamask0na=ifel(seamask01==0,NA,0)
saveRDS(seamask01,"seamask01.rds")
png("seamask01.png")
plot(seamask01)
dev.off()

saveRDS(seamask1na,"seamask1na.rds")
png("seamask1na.png")
plot(seamask1na)
dev.off()
saveRDS(seamask0na,"seamask0na.rds")
png("seamask0na.png")
plot(seamask0na)
dev.off()

fill=readRDS("fillrkmoloch.rds")

fillrkmoloch02=values(r_ita02)+1
fillrkmoloch02[1:2]=2
saveRDS(fillrkmoloch02,"fillrkmoloch02.rds")
