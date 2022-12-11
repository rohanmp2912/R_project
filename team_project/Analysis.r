ntok = read.csv("C:/Users/Dell/git/R_project/team_project/bus.csv")
ktou = read.csv("C:/Users/Dell/git/R_project/team_project/karlatoudp.csv")
btime = function ( z = Sys.time(),bustime = ntok){
  
  z=format(z,format = "%I:%M")
  
  c=0
  
  for(i in bustime[[3]]){
    
    if(c<2){
      
      if(i>z){
        
        cat("Next bus is AT : ",i,"\n")
        
        c=c+1
        
        r = i
      }
      
    }else break
  }
  return(i)
}

main = function(){
  btime()
  cat("From :\n1->Nitte-Karkala\n2->Nitte-Udupi\n3->Karkala-Udupi\n")
  obj = as.integer(readline())
  switch (obj,
          btime(),
          btime(btime(),ktou),
          btime(,ktou)
  )
  repeat{
    cat("From :\n1->Nitte-Karkala\n2->Nitte-Udupi\n3->Karkala-Udupi\n4->Quit")
    obj = as.integer(readline())
    cat("Enter the time : ")
    z = strptime(readline(),format = "%H:%M")
    switch (obj,
            btime(z),
            btime(btime(z),ktou),
            btime(z,ktou),
            break
    )
  }
}

main()
