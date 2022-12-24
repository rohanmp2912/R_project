ntok = read.csv("C:/Users/Dell/git/R_project/bus24.csv")
ktou = read.csv("C:/Users/Dell/git/R_project/karlatoudp24.csv")
kton = read.csv("C:/Users/Dell/git/R_project/karlatonitte24.csv")
utok = read.csv("C:/Users/Dell/git/R_project/udupitokarla24.csv")        #All CSV files are Invoked Here
btime = function (z = Sys.time(), bustime = ntok) {                      #function to return time at the destination by taking time and dataframe as  argument
  z = format(z, format = "%H:%M")                                        #converting into a format of hours:min
  c = 0
  j=0
  t=r=format("00:00",format = "%H:%M")
  for (i in bustime[[3]]) {
    j=j+1
    if (c < 2) {
      if (i > z) {
        t=i
        t=format(strptime(t,format="%H:%M"),format = "%I:%M")
        cat("Next bus is AT : ", t, "\n")
        c = c + 1
        if(c==1){
          r=bustime[[4]][[j]]
        }
      }
      
    } else  break
  }
  if(c==0){
    cat("Your next bus is Tomorrow at : ",bustime[[3]][[1]],"\n")
    cat("Your next bus is Tomorrow at : ",bustime[[3]][[2]],"\n")
  }
  return(r)
}

main = function() {
  h = hashtab()
  h[[1L]]=ntok
  h[[2L]]=ktou
  h[[-2L]]=utok
  h[[-1L]]=kton
  btime()
  repeat {
    cat("From :\n1->Nitte\n2->Karkala\n3->Udupi\n4->Quit")
    obj1 = as.integer(readline())
    if(obj1==4)  break
    cat("To :\n1->nitte\n2->Karkala\n3->Udupi\n4->Quit")
    obj2 = as.integer(readline())
    if(obj1==4)  break
    cat("Enter the time : ")
    z = strptime(readline(), format = "%H:%M")
    cat("Enter AM/PM :")
    f=readline()
    if(f[[1]]=="PM")  z=z+43200
    if ((obj2 - obj1) >= 0) {
      i = obj1
      while (i <= (obj2 - obj1)) {
        z = btime(z, h[[as.integer(i)]])
        i = i + 1
      }
    }else{
      i = obj2 - obj1
      while (i < 0) {
        z = btime(z, h[[as.integer(i)]])
        i = i + 1
      }
    }
  }
}

main()
