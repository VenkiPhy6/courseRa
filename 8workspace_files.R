getwd() #See your current directory
ls() #list all the R objects in the current directory
list.files(); dir() #list all the folders in your current directory
args(list.files) #see what are all the arguments available for a function
x <- getwd() #Try to put the starting directory somehwhere safe so that you can always come back home...  
dir.create('foldername') #create a folder in the current directory
setwd('foldername') #change current working directory to a different one
file.create('script.R') #create a new file in the current working directory
list.files() 
file.exists('script.R') #check to see if files exist in the current directory
file.info('script.R') #get info on a file
file.info('script.R')$mode #get particular info on a file
file.rename('script.R', 'script1.R') #rename a file
file.copy('script1.R', 'script2.R') #create a copy of a file
file.path('script2.R') #find path of a file
file.path('folder1', 'folder2') #create a path for a new file unrelated to your OS path
dir.create(file.path('foldername2', 'foldername3'), recursive = T) #create nested folders