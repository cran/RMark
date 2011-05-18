.First.lib<-function(library,pkgname)
{
 #Return a list, each element of which is a vector
 # the first element of the vector is the stuff before the colon in info[[1]]
 # the second element is the stuff after the colon (can get >2 elements some
 # times but ignore)
 info<-strsplit(library(help=pkgname,character.only=TRUE)$info[[1]],"\\:[ ]+")
 #Go through the list, pulling out the Package, Version and Built strings
 l<-length(info)
 package<-version<-built<-""
 for(i in 1:l) {
   if(info[[i]][1]=="Package") package<-info[[i]][2]
   if(info[[i]][1]=="Version") version<-info[[i]][2]
   if(info[[i]][1]=="Built") built<-info[[i]][2]
 }
 #Print these out
# 	library.dynam("RMark", pkgname)
 cat(paste("This is",package,version,"\nBuilt:",built,"\n"))
 if(R.Version()$os=="mingw32")
 {
	if(Sys.which("mark.exe")=="" & !file.exists("c:/Program Files/Mark/mark.exe"))
 	   stop("Software mark.exe not found in path or in c:/Program Files/mark. It is available at http://www.cnr.colostate.edu/~gwhite/mark/mark.htm")
 }else
 {
   if(Sys.which("mark")=="")
	   stop("Software mark not found in path.")
 }  
}



