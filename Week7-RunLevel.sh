#! /bin/bash

touch a				# Writing the run-level report into a file a.
who -r > a
declare -i b=0			# Setting a word iterator.
for word in $(<a); do		# Parsing through all words in file a.
    if [ $b -eq 1 ]; then	# We know that 2nd word (word number 1) is the
				# run-level number.
        c=$word			# We record it in variable c.
    fi
    b=b+1
done
rm a				# Removing file a.

# Reporting on the run-level.
echo "The run-level your computer is operation on is $c."

# The reason for the  lenghty procedure was to record and hold the
# run-level value in a variable as opposed to just printing it on the
# screen. I did NOT know any other way of extracting the run-level
# value from the report, that the command who -r generates.
# Any ideas?
