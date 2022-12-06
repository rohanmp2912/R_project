bus = read.csv("bus.csv")
bus
time = read.csv("time.csv")
time
time2 = read.csv("time2.csv")
time2
bustime = cbind(bus,time,time2)
bustime