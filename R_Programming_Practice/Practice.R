install.packages("devtools")
library(devtools)
install.packages("dplyr")
install.packages("ggplot2")
install.packages("shiny")
install_github("StatsWithR/statsr")
library("dplyr")
library("ggplot2")
library("statsr")
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
head(nycflights, n=10L)
ggplot(data = nycflights, aes(x=dep_delay)) + geom_histogram(binwidth = 50)
rdu_flights <- nycflights %>% filter(dest == "LAX") 
ggplot(data = rdu_flights, aes(x=dep_delay)) + geom_histogram()
rdu_flights %>% summarise(mean_dd = mean(dep_delay), ss_dd = sd(dep_delay), n = n() )
lax_feb_flights <- nycflights %>% filter(dest == "LAX" , month == 2)
head(lax_feb_flights, n=10L)
ggplot(data = lax_feb_flights, aes(x = origin)) + geom_histogram(stat = "count")
sfo_feb_flights %>% group_by(carrier) %>% summarise(med_nn = median(arr_delay), iqr_r = IQR(arr_delay)) %>% arrange(desc(med_nn)) 
ggplot(data = nycflights, aes(x = factor(month), y = dep_delay)) + geom_boxplot()
?nycflights


install.packages("dplyr")

install_github("StatsWithR/statsr")

library("dplyr")

library("statsr")

data("nycflights")

head(nycflights, n=10L)

lax_feb_flights <- nycflights %>% filter(dest == "LAX" , month == 2)

head(lax_feb_flights, n=10L)

ggplot(data = lax_feb_flights, aes(x = origin)) + geom_bar()

last_plot()

qplot(origin, data = lax_feb_flights)

data("present")

ggplot(data = present, aes(x = year, y = boys)) + geom_point() + geom_line()



df <- nycflights
str(df)
df[2,3]
