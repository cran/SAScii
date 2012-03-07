\name{parse.SAScii}
\alias{parse.SAScii}
\alias{SAS.uncomment}
\title{
Convert SAS import instructions into the arguments for a read.fwf function call.
}
\description{
Re-configure the INPUT block of a (.sas) syntax file into the arguments necessary to run the read.fwf function on an ASCII data set.
}
\usage{
parse.SAScii( sas_ri, beginline = 1 )
}
\arguments{
  \item{sas_ri}{
   Character string containing location of SAS import instructions.
}
  \item{beginline}{
   Line number in SAS import instructions where the INPUT statement begins.  If the word INPUT appears before the actual INPUT block, the function will return an error.
}
}
\details{
This function cannot handle overlapping columns.  For example, in the 2009 National Ambulatory Medical Care Survey (NAMCS) SAS import instructions, columns DIAG1 and DIAG13D will create an error because both start at space 55.
ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/dataset_documentation/namcs/sas/nam09inp.txt.
}
\value{
An R data frame containing:
\item{varname }{The name of the variable field}
\item{width }{The width of the field}
\item{char}{A logical flag indicating a character field if T and numeric if F}
\item{divisor }{A fraction to later be multiplied by numeric fields containing decimal points}
}
\author{
Anthony Joseph Damico
}
\examples{
\dontrun{

#########################################################################################
#Create the read.fwf parameters required to load the
#2009 Medical Expenditure Panel Survey Emergency Room Visits file

#Location of the SAS import instructions for the
#2009 Medical Expenditure Panel Survey Emergency Room Visits File
MEPS.09.ER.visit.SAS.read.in.instructions <- 
	"http://meps.ahrq.gov/mepsweb/data_stats/download_data/pufs/h126e/h126esu.txt"

#Load the 2009 Medical Expenditure Panel Survey Emergency Room Visits File
#NOTE: The SAS INPUT command occurs at line 273.
MEPS.09.ER.visit.sas <- 
	parse.SAScii ( MEPS.09.ER.visit.SAS.read.in.instructions , beginline = 273 )


#########################################################################################
#Create the read.fwf parameters required to load the
#2010 National Health Interview Survey Persons file

NHIS.10.personsx.SAS.read.in.instructions <- 
	"ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2010/PERSONSX.sas"

#store the NHIS SAS import instructions for use in a 
#read.fwf function call outside of the read.SAScii function
NHIS.10.personsx.sas <- 
	parse.SAScii( NHIS.10.personsx.SAS.read.in.instructions )
}
}
