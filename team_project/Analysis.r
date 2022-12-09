bustime = read.csv("C:/Users/Dell/git/R_project/team_project/bus.csv")

btime = function ( z = Sys.time() ){
  
  z=format(z,format = "%I:%M")
  
  c=0
  
  for(i in bustime[[4]]){
    
    if(c<2){
      
      if(i>z){
        
        cat("Next bus is AT : ",i,"\n")
        
        c=c+1
      }
      
    }else break
  }
}

main = function(){
  btime()
  repeat{
    cat("Enter the Time to See the Bus details : ")
    z = scan(what = character())
    btime(strptime(z,format = "%H:%M"))
  }
}

main()