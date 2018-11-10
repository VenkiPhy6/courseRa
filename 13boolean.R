#Boolean Algebra
TRUE & c(TRUE, FALSE, FALSE) #Recycled to c(TRUE, TRUE, TRUE) & c(TRUE, FALSE, FALSE)
TRUE | c(TRUE, FALSE, FALSE) #Recycled to c(TRUE, TRUE, TRUE) | c(TRUE, FALSE, FALSE)
TRUE && c(TRUE, FALSE, FALSE)
TRUE || c(TRUE, FALSE, FALSE) #No recyling. Only first memeber counts.
#Remember 1.AND 2.OR
5 > 8 || 6 != 8 && 4 > 3.9

#Functions----
isTrue(3) #Guess what happens!
isTrue(NA)
identical ('twins', 'twins')
xor(5==6, !FALSE)


#Masking----
ints <- sample(10)
ints
ints > 5 #Masked vector
which(ints > 7) #Which indices are TRUE?
any(ints < 0) #Do any of the values in the given class evaluate to TRUE?
all(ints > 0) #Do all of the values in the given class evaluate to TRUE?

