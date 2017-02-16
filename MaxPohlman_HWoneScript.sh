## Script by Max Pohlman
##############################################################################################################
#The purpose of this script is to count the number of genes in an inputted .GFF file.
#It functions by counting the number of instances of the word 'gene' in the 'Type' column.
#Script should be run as 'bash {Name of Script} {Name of .GFF File}'
#An example .GFF file can be found at http://downloads.yeastgenome.org/curation/chromosomal_feature/saccharomyces_cerevisiae.gff
#Documentation of .GFF files can be found at https://github.com/The-Sequence-Ontology/Specifications/blob/master/gff3.md
##############################################################################################################

#!/bin/bash #This statement tells the computer that this script is designed to be run by the bash shell.

##############################################################################################################
#This logic statement is a check to make sure the user inputted the right number of arguments into the script.
#The if-then statement checks if the user inputted zero arguments into the script.
#If the user inputted zero arguments, the script will return to console the correct means of using the script, then abort the script.
#If the user inputted a non-zero number of arguments, the script will proceed past the if-then statement.

if [ $# -eq 0 ]; then  #If the number of arguments into the script is equal to zero then
	echo "Usage: $0 filename" #Print out to the console "Usage: {Name of Script} filename"
	exit 1 #Aborts the script
fi #Ends the if statement
##############################################################################################################

filename=$1 #This assigns the first (and only) argument to a variable called 'filename'
echo -n "The number of genes in $filename is "  #Prints out "The number of genes in {Name of File} is " without 
												#having a "return" to the new line. (Keeps next output on same line)

##############################################################################################################
#This section of code counts the number of genes in the input file.
#It functions via data filtering. It first filters out all missing (or '^#') data. It then filters out all of the data 
#except for the 'Type' column. In then searches the 'Type' column for all the instances of 'gene' and then counts them, 
#yielding a number. This number is then outputted right after the echo statement from line 25.

cat $filename |  #Returns some text that comes out at the end of the pipe
  grep -v '^#' | #Filters out all of the lines of the file that contain the character sequence '^#' (I think this is missing data?)
  cut -f3 | #Filters all of the columns of data except for the third column ('Type').
  grep gene | #Finds all of the instances the word 'gene' appears in the column
  wc -l #Counts the number of lines 
 ##############################################################################################################
 
 #This is a change to the script#
 
 #This is a second change#
 
 #An additional change #
 
 #last line change by Chris