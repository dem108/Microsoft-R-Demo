library(mrsdeploy)


# Simple R script
#cat("answer <- 'Test'", file = "./MS-R/mrsdeploy/scripts/projectA/test.R")
#cat("answer <- 'Test'", file = "d:/temp/projectA/test.R")
cat("answer <- 'Test'", file = "./scripts/projectA/test.R")

#
# You can set a base 'data - dir' where all scripts/.RData files
# that will be published can be stored. This is hepful so you 
# do not have to write the entire full-path during' code = / full / path / to / your / scripts / test.R'
# It is also helpful is you have a git repo or version-control
# that holds your scripts, etc¡¦ so that you can point it to that location
#
# The default 'data-dir' is the current working directory {{ getwd() }}}
#

#serviceOption()$set("data-dir", "D:/Resources/Topic-Tech/10 Demo-HandsOn/MRS-Training/20 Advanced/50 MRS - RTVS Projects/Microsoft R Demo/Microsoft R Demo/MS-R/mrsdeploy/scripts")
#serviceOption()$set("data-dir", "./MS-R/mrsdeploy/scripts")
#serviceOption()$set("data-dir", "D:/temp")
serviceOption()$set("data-dir", "./scripts")


serviceOption()$get("data-dir")
#
# Publish a service named 'test' which uses the R script' / R - test / test.R'
# and returns an output named 'answer' of type 'character'
#


remoteLogin("http://localhost:12800", username="admin", password="P@ssw0rd!@#$", session = FALSE)


listServices()
#deleteService("test", v = "5486bbc5-4c30-4c30-909c-93b0201b4dcc")
#deleteService("test", v = "09c87656-13da-47bb-9954-f1041e636216")
deleteService("test", v ="v1")

api <- publishService(
  "test", 
  code = "/projectA/test.R", # simply concats the 'data - dir' defined above with this value:: ./MS-R/mrsdeploy/projectA/test.R
  outputs = list(answer = "character"),
  v = "v1"
)

answer <- api$consume()$output("answer")
identical(answer, "Test")     # TRUE



#Change Workspace to Microsoft R Client
Revo.version
#Remote Login (Local)
remoteLogin("http://localhost:12800", username = "admin", password = "P@ssw0rd!@#$", session = TRUE)
#Confirm it is now Microsoft R Server
Revo.version
exit
Revo.version


##Now Let's try remote HDInsight
##Remote Login (R Server on HDInsight)
##remoteLogin("http://RServer4Hdi-sehan-ed-ssh.azurehdinsight.net:12800", username = "admin", password = "P@ssw0rd!@#$", session = TRUE)


remoteLogout()
