install.packages("devtools")
library(devtools)
install.packages("dplyr")
install.packages("ggplot2")
install.packages("shiny")
install_github("StatsWithR/statsr")
library(dplyr)
library(ggplot2)
library(statsr)
data(arbuthnot)
names(arbuthnot)
arbuthnot$boys
arbuthnot$girls
girls
arbuthnot[girls]
ggplot(data = arbuthnot, aes(x = year, y = girls)) + geom_line() + geom_point()
?ggplot
arbuthnot %>% mutate(total = boys + girls) 
ggplot(data = arbuthnot, aes(x = year, y = boys)) + geom_point() + geom_line()
data("present")
present
ls(present)
ggplot(data = present, aes(x = year, y = boys)) + geom_point() + geom_line()
ggplot(data = present, aes(x = year, y = girls)) + geom_point() + geom_line()

present <- present %>% mutate(total = boys + girls)
present
head(present)
present
sort(total)
present[1:4] %>% head(present$total, n = 10)
present <- arrange(present$total)
presemt <- present[order(present$total),] %>% tail(present, n=10)
?order
data(nycflights)
names(nycflights)
?nycflights
str(nycflights)
ggplot(data = nycflights, aes(x=dep_delay)) + geom_histogram(binwidth = 50)
rdu_flights <- nycflights %>% filter(dest == "RDU") 
ggplot(data = rdu_flights, aes(x=dep_delay)) + geom_histogram()
rdu_flights %>% summarise(mean_dd = mean(dep_delay), ss_dd = sd(dep_delay), n = n() )
sfo_feb_flights <- nycflights %>% filter(dest == "SFO" , month == 2)
sfo_feb_flights 
ggplot(data = sfo_feb_flights, aes(x = arr_delay)) + geom_histogram()
sfo_feb_flights %>% group_by(carrier) %>% summarise(med_nn = median(arr_delay), iqr_r = IQR(arr_delay)) %>% arrange(desc(med_nn)) 
ggplot(data = nycflights, aes(x = factor(month), y = dep_delay)) + geom_boxplot()
nycflights




