args = commandArgs(trailingOnly=TRUE)
library(devtools)
#install_github('nasa/NASAaccess',force=TRUE)
library(NASAaccess)

a <- strsplit(args[2],",")

nexgdpp <- strsplit(args[10],",")



for(x in a[[1]]){


if(x == "GLDASpolyCentroid"){

	GLDASpolyCentroid(
		  Dir =paste(args[7],"/GLDASpolyCentroid/",sep=""),
		  watershed = args[4],
		  DEM = args[5],
		  start = args[8],
		  end = args[9]
		)
}
if(x == "GPMswat"){

	GPMswat(
		  Dir =paste(args[7],"/GPMswat/",sep=""),
		  watershed = args[4],
		  DEM = args[5],
		  start = args[8],
		  end = args[9]
		)
}
if(x == "GPMpolyCentroid"){

	GPMpolyCentroid(
		   Dir =paste(args[7],"/GPMpolyCentroid/",sep=""),
		  watershed = args[4],
		  DEM = args[5],
		  start = args[8],
		  end = args[9]
		)
}
if(x == "GLDASwat"){

	GLDASwat(
		  Dir =paste(args[7],"/GLDASwat/",sep=""),
		  watershed = args[4],
		  DEM = args[5],
		  start = args[8],
		  end = args[9]
		)
}
if(x == "NEXgdpp"){

	NEX_GDPPswat(
		  Dir =paste(args[7],"/NEXGDPP/",sep=""),
		  watershed = args[4],
		  DEM = args[5],
		  start = nexgdpp[[1]][4],
		  end = nexgdpp[[1]][5],
                  model = nexgdpp[[1]][1],
                  type = nexgdpp[[1]][2],
                  slice = nexgdpp[[1]][3]
		)
}
}
#install.packages("remotes")

file.copy(from=args[7], to=args[6],
          overwrite = TRUE, recursive = TRUE, 
          copy.mode = TRUE)

library(remotes)
#remotes::install_github("datawookie/emayili")
library(emayili)
#install.packages("dplyr")

email <- envelope(
  to = args[1],
  from = "nasaaccess@gmail.com",
  subject = 'Your nasaaccess data is ready',
  html =paste("<html><head></head><body><p>Hello,<br>Your nasaaccess data is ready for download at <a href='https://tethys.servirglobal.net/apps/swat2'>http://localhost:8080/apps/swat2</a><br>Your unique access code is: <strong>", args[3], "</strong><br></p></body><html>")
)

smtp <- server(host = "smtp.gmail.com",
               port = 465,
               username = <email>,
               password = <password>)
smtp(email, verbose = TRUE)

#args[3]

