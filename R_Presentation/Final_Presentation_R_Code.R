# Introduction

library(ggplot2)
library(devtools)
library(dplyr)
install_github("StatsWithR/statsr")
library(statsr)

data("nycflights")
head(nycflights, n=10L)

lax_feb_flights <- nycflights %>% filter(dest == "LAX" , month == 2)

head(lax_feb_flights, n=10L)

ggplot(data = lax_feb_flights, aes(x = origin)) + geom_bar()

last_plot()

qplot(origin, data = lax_feb_flights)

data("present")

ggplot(data = present, aes(x = year, y = boys)) + geom_point() + geom_line()

# graphical primitives

few <- head(nycflights,n=20L)
few
ggplot(few,aes(month,dest)) + geom_point(aes(color=carrier))

b <- ggplot(few,aes(month,dest)) + geom_point(aes(colour=carrier)) 

b + geom_text(aes(label= tailnum))

#continuous bivariate functions

data<-nycflights
d<- nycflights
View(d)
str(nycflights)

ggplot(d,aes(arr_time, flight))+geom_bin2d() +
  xlim(0,500)+ ylim(0,2000) + 
  scale_fill_gradient( low="black",high = "red") +
  labs(x="Arrival Time", y="Flight Number", title = "Arrival Time for Flights" ) 

ggplot(d,aes(distance,hour))+ geom_density2d()+ xlim(0,1000) +
  labs(x="Distance", y="Hour", title = "Hourly Flights" ) 

ggplot(d,aes(distance, flight))+geom_hex() + xlim(0,1000) + ylim (0,1000)+
  scale_fill_gradient( low="black",high = "red")

ggplot(data, aes(x=dep_time,fill=origin)) + geom_area(stat='bin')

ggplot(data, aes(x=dep_time,fill=carrier)) + geom_area(stat='bin')

ggplot(data=d, aes(x=hour, y=month, group=air_time)) + 
  geom_line()+geom_point()+ xlim(10,12) + ylim(1,7)

ggplot(data=d, aes(x=hour, y=month, group=air_time, colour=origin)) + 
  geom_line()+geom_point()+ xlim(10,12) + ylim(1,7)

#error

d=data.frame(drink=c("coffee","tea","water"), 
             mean=c(3,6,2), 
             lower=c(2.6,5.6,1.8), upper=c(3.5,6.3,2.8))
ggplot() + 
  geom_errorbar(data=d, mapping=aes(x=drink, ymin=upper, ymax=lower), width=0.5, size=1, color="blue") + 
  geom_point(data=d, mapping=aes(x=drink, y=mean), size=4, shape=21, fill="white") +
  labs(title="geom_errorbar")

ggplot() + 
  geom_crossbar(data=d, mapping=aes(x=drink,y=mean, ymin=upper, ymax=lower), width=0.5, size=1, color="blue") + 
  geom_point(data=d, mapping=aes(x=drink, y=mean), size=4, shape=21, fill="white") +
  labs(title="geom_crossbar")

ggplot() + 
  geom_pointrange(data=d, mapping=aes(x=drink, y=mean, ymin=upper, ymax=lower), size=1, color="red", fill="white", shape=22) + 
  labs(title="geom_pointrange")

# stats

# stat_contour()
View(faithfuld)
ggplot(faithfuld, aes(waiting, eruptions, z = density)) + stat_contour()

# Stat_smooth()

p<-head(nycflights,n=2000)
ggplot(p,aes(x=flight,y=air_time))+geom_line()+stat_smooth(method="loess")


# Stat_summary()

# Geom Point
ggplot(nycflights,aes(x=month,y=arr_delay))+geom_point() + stat_summary(geom="point",fun.y="mean",colour="red",size=4)+
  xlim("Jan", "Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec")

# Geom Line
ggplot(nycflights,aes(x=month,y=arr_delay))+geom_point() + stat_summary(geom="line",fun.y="mean",colour="red",size=1)+ 
  xlim("Jan", "Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec")

# Min
ggplot(nycflights,aes(x=month,y=arr_delay))+geom_point() + stat_summary(geom="line",fun.y="min",colour="red",size=4)+ 
  xlim("Jan", "Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec")

# Max
ggplot(nycflights,aes(x=month,y=arr_delay)) + stat_summary(geom="line",fun.y="max",colour="red",size=1)+ 
  xlim("Jan", "Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec")


# Stat_summary2d()

ggplot(nycflights,aes(x=month,y=arr_delay,z=air_time))+stat_summary_2d()+
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11,12), 
                     labels = c("Jan", "Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec"))

ggplot(nycflights,aes(x=month,y=dep_time,z=air_time))+stat_summary_2d()+
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11,12), 
                     labels = c("Jan", "Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec"))

ggplot(nycflights,aes(x=month,y=dep_time,z=air_time))+stat_summary_2d(colour="red")+
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11,12), 
                     labels = c("Jan", "Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec"))


#scales

p<- ggplot(data=nycflights,aes(x=origin,y=arr_time,color=origin))+
  
  geom_point()



#Scales

p

p+scale_y_log10()#spreads data along y axis;

p+scale_y_reverse()#will reverse y axis plot



ggplot(data=nycflights,aes(x=dep_delay,y=arr_time,color=origin))+
  
  geom_point()+
  
  scale_x_continuous(name="dep_delay x-axis",limits =c(0,500))+
  
  scale_y_continuous(name="arr_time y-axis",limits = c(0,2000))





#Sys.getenv("R_LIBS_USER")



#Scales & Colors

p+scale_color_brewer(palette = "Set2");

?scale_color_brewer;

p+scale_color_grey();

p+scale_color_manual(values = c("red","green","blue"));



#library(RColorBrewer)

#display.brewer.all(colorblindFriendly =TRUE)



#Coordinate system

#Polar

rect<-data.frame(x=50,y=50)

line<-data.frame(x=c(1,200),y=c(100,1))



base<- ggplot(mtcars,aes(factor(1),fill=factor(cyl)))+
  
  geom_bar(width=1)+
  
  scale_x_discrete(NULL,expand = c(0,0))+
  
  scale_y_continuous(NULL,expand = c(0,0))



base

base+coord_polar("x")

base+coord_polar("y")



#coordinate system

data<-ggplot(mpg,aes(displ,hwy))+
  
  geom_point()+
  
  geom_smooth()

data

data+coord_flip()

data+coord_cartesian(xlim=c(5,7))

data+scale_x_continuous(limits = c(5,7))

## position adjustment

h<-head(nycflights, n=100L)
ggplot(h,aes(distance, fill=origin))+ geom_bar(position='fill') +
  xlim(100,500) + ylim(0,5)


# facet

ggplot(d,aes(arr_time, flight))+geom_bin2d() +
  xlim(100,500)+ ylim(100,200) + 
  scale_fill_gradient( low="black",high = "red") + facet_grid(~origin)
labs(x="Arrival Time", y="Flight Number", title = "Arrival Time for Flights" ) 



