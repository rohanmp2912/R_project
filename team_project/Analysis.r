ntok = read.csv("C:/Users/Dell/git/R_project/bus.csv")
ktou = read.csv("C:/Users/Dell/git/R_project/karlatoudp.csv")
kton = read.csv("C:/Users/Dell/git/R_project/karlatonitte.csv")
utok = read.csv("C:/Users/Dell/git/R_project/udupitokarla.csv")
btime = function (z = Sys.time(), bustime = ntok) {
  z = format(z, format = "%I:%M")
  print(z)
  c = 0
  j=0
  for (i in bustime[[3]]) {
    j=j+1
    if (c < 2) {
      if (i > z) {
        cat("Next bus is AT : ", i, "\n")
        c = c + 1
        if(c==1){
          r=bustime[[4]][[j]]
        }
      }
      
    } else  break
  }
  return(r)
}

main = function() {
  h = hashtab()
  h[[1L]]=ntok
  h[[2L]]=ktou
  h[[-1L]]=utok
  h[[-2L]]=kton
  btime()
  repeat {
    cat("From :\n1->Nitte\n2->Karkala\n3->Udupi\n4->Quit")
    obj1 = as.integer(readline())
    if(obj1==4)  stop
    cat("To :\n1->nitte\n2->Karkala\n3->Udupi\n4->Quit")
    obj2 = as.integer(readline())
    if(obj1==4)  stop
    cat("Enter the time : ")
    z = strptime(readline(), format = "%H:%M")
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