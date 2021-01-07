
for (i in 1:10) { print (i)}

names_to_use <- paste("iter", letters[1:6])
names_to_use

test <- numeric(ncol(billboard_2000))
(test_names <- setNames( test, colnames(billboard_2000)))

for(var in 0:3)
{
  cat(var, "\n")
}

phi <- 1
for (k in 1:10) {
  phi <- 1+1/phi
  print(c(k,phi))
}

some_letters <- letters[4:6]

for(a in seq_along(some_letters)) {
  print(paste("Letter ", a, ": ", some_letters[a]))
}
list.dirs()
(data_list  <- vector("list", length(5)))
