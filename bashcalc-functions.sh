#!/bin/bash
# Bash Calculator Framework
# CS9E - Assignment 4.1
#
# Framework by Jeremy Huddleston <jeremyhu@cs.berkeley.edu>
# $LastChangedDate: 2007-10-11 15:49:54 -0700 (Thu, 11 Oct 2007) $
# $Id: bashcalc-fw.sh 88 2007-10-11 22:49:54Z selfpace $

## Floating Point Math Functions ##

# bashcalc <expression>
# This function simply passes in the given expressions to 'bc -l' and prints the result
function bashcalc {
	echo $(echo "$1" | bc -l)
}

# sine <expression>
# This function prints the sine of the given expression
function sine {
	echo $(echo "s($1)" | bc -l)
}

# cosine <expression>
# This function prints the cosine of the given expression
function cosine {
  echo $(echo "c($1)" | bc -l)
}

# angle_reduce <angle>
# Prints the angle given expressed as a value between 0 and 2pi
function angle_reduce {
  #val=$(bashcalc "$1")
  val=$1
  if [ $(echo "$val < 0" | bc -l) -eq 1 ] ; then
    while [ $(echo "8*a(1) + ($val) < 8*a(1)" | bc -l) -eq 1 ] ; do
      val=$(echo "8*a(1) + $val" | bc -l)
    done
  else
    while [ $(echo "($val - 8*a(1)) > 0" | bc -l) -eq 1 ] ;
    do
      val=$(echo "$val - 8*a(1)" | bc -l)
    done
  fi
  echo $val
}

# float_{lt,lte,eq} <expr 1> <expr 2>
# These functions returns true (return code 0) if the first value is less than the second (lt),
# less than or equal to the second (lte), or equal to the second (eq).
# Note: We can't just use BASH's builtin [[ ... < ... ]] operator because that is
#       for integer math.
function float_lt {
  if [ $(echo "$1 < $2" | bc -l) -eq 1 ] ; then
    echo 1
    return 0
  else
    echo 0
    return 1
  fi
  # echo $(echo "$1 < $2" | bc -l)
}

function float_eq {
	if [ $(echo "$1 == $2" | bc -l) -eq 1 ] ; then
    echo 1
    return 0
  else
    echo 0
    return 1
  fi
}

function float_lte {
	if [ $(echo "$1 <= $2" | bc -l) -eq 1 ] ; then
    echo 1
    return 0
  else
    echo 0
    return 1
  fi 
}

function float_gt {
  if [ $(echo "$1 > $2" | bc -l) -eq 1 ] ; then
    echo 1
    return 0
  else
    echo 0
    return 1
  fi
}

function float_gte {
  if [ $(echo "$1 >= $2" | bc -l) -eq 1 ] ; then
    echo 1
    return 0
  else
    echo 0
    return 1
  fi
}
