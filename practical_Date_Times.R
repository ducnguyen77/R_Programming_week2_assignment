# Practice Programming Assignment: swirl Lesson 3: Dates and Times
library("swirl")
swirl()
d1 <- Sys.Date()
class(d1)
# We can use the unclass() function to see what d1 looks like internally. Try it out.
unclass(d1)
d1
d2 <- as.Date("1969-01-01")
unclass(d2)
t1 <- Sys.time()
t1
class(t1)
unclass(t1)
t2<-as.POSIXlt(Sys.time())
unclass(t2)
t2

#| Often, the dates and times in a dataset will be in a format that R does not recognize. The
#| strptime() function can be helpful in this situation.
#| strptime() converts character vectors to POSIXlt. In that sense, it is similar to as.POSIXlt(),
#| except that the input doesn't have to be in a particular format (YYYY-MM-DD).

str(unclass(t2))
t2$min
weekdays(d1)
months(t1)
quarters(t2)
t3<-"October 17, 1986 08:24"
strptime(t3, "%B %d, %Y %H:%M")
t4 <- strptime(t3, "%B %d, %Y %H:%M")
t4
class(t4)
#| Finally, there are a number of operations that you can perform on dates and times, including
#| arithmetic operations (+ and -) and comparisons (<, ==, etc.)
Sys.time() > t1
Sys.time() - t1
#| The same line of thinking applies to addition and the other comparison operators. If you want more
#| control over the units when finding the above difference in times, you can use difftime(), which
#| allows you to specify a 'units' parameter.
#| Use difftime(Sys.time(), t1, units = 'days') to find the amount of time in DAYS that has passed
#| since you created t1.

difftime(Sys.time(), t1, units = 'days')
