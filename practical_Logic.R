# Practical R Exercises in swirl
# install.packages()
library(swirl)
swirl()
TRUE==TRUE
(FALSE==TRUE)==FALSE
6 == 7
6<7
10<=10
5 != 7
!5 == 7
FALSE & FALSE
#You can use the `&` operator to evaluate AND across a vector. The `&&` version of AND
#| only evaluates the first member of a vector. Let's test both for practice. Type the
#| expression TRUE & c(TRUE, FALSE, FALSE).
TRUE & c(TRUE, FALSE, FALSE)
TRUE && c(TRUE, FALSE, FALSE)

#| The OR operator follows a similar set of rules. The `|` version of OR evaluates OR across
#| an entire vector, while the `||` version of OR only evaluates the first member of a
#| vector.
TRUE | c(TRUE, FALSE, FALSE)
TRUE || c(TRUE, FALSE, FALSE)
5 > 8 || 6 != 8 && 4 > 3.9

#| The function isTRUE() takes one argument. If that argument evaluates to TRUE, the
#| function will return TRUE. Otherwise, the function will return FALSE. Try using this
#| function by typing: isTRUE(6 > 4)
isTRUE(6 > 4)
identical('twins', 'twins')

#| You should also be aware of the xor() function, which takes two arguments. The xor()
#| function stands for exclusive OR. If one argument evaluates to TRUE and one argument
#| evaluates to FALSE, then this function will return TRUE, otherwise it will return FALSE.
#| Try out the xor() function by typing: xor(5 == 6, !FALSE)
xor(5 == 6, !FALSE)
ints <- sample(10)
ints
#| The vector `ints` is a random sampling of integers from 1 to 10 without replacement.
#| Let's say we wanted to ask some logical questions about contents of ints. If we type ints
#| > 5, we will get a logical vector corresponding to whether each element of ints is
#| greater than 5. Try typing: ints > 5
ints > 5

#| We can use the resulting logical vector to ask other questions about ints. The which()
#| function takes a logical vector as an argument and returns the indices of the vector that
#| are TRUE. For example which(c(TRUE, FALSE, TRUE)) would return the vector c(1, 3).
which(ints > 7)

#| Like the which() function, the functions any() and all() take logical vectors as their
#| argument. The any() function will return TRUE if one or more of the elements in the
#| logical vector is TRUE. The all() function will return TRUE if every element in the
#| logical vector is TRUE.
any(ints <0)
all(ints > 0)
