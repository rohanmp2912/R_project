bustime = read.csv("bus.csv")
bustime
z<-Sys.time()
z=format(z,format = "%I:%M")
c=0
for(i in bustime[4]){
  if(c<2){
    if(i[1]<z){
      cat("Next bus is AT : ",i[1])
      c=c+1
    }
  }else break
}
