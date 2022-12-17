ntok = read.csv("C:/Users/Dell/git/R_project/team_project/bus.csv")
ktou = read.csv("C:/Users/Dell/git/R_project/team_project/karlatoudp.csv")
btime = function ( z = Sys.time(),bustime = ntok){
  
  z=format(z,format = "%I:%M")
  
  c=0
  j=0
  
  for(i in bustime[[3]]){
    j=j+1
    if(c<2){
      
      if(i>z){
        
        cat("Next bus is AT : ",i,"\n")
        
        c=c+1
        
        if(c==1)  r=j
      }
      
    }else break
  }
  return(bustime[[4]][[r]])
}

main = function(){
  b = list(list(1,ntok),list(2,ktou))
  btime()
  repeat{
    cat("From :\n1->Nitte\n2->Karkala\n3->Udupi\n4->Quit")
    obj1 = as.integer(readline())
    cat("To :\n1->nitte\n2->Karkala\n3->Udupi\n4->Quit")
    obj2 = as.integer(readline())
    cat("Enter the time : ")
    z = strptime(readline(),format = "%H:%M")
    i=obj1
    while(i<=(obj2-obj1)){
      z=btime(z,b[[i]][[2]])
      z
      i=i+1
    }
  }
}

main()
