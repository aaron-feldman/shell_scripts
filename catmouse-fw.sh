#!/bin/bash
# Cat & Mouse Framework
# CS9E - Assignment 4.2
#
# Framework by Jeremy Huddleston <jeremyhu@cs.berkeley.edu>
# $LastChangedDate: 2007-10-11 15:49:54 -0700 (Thu, 11 Oct 2007) $
# $Id: catmouse-fw.sh 88 2007-10-11 22:49:54Z selfpace $

# Source the file containing your calculator functions:
. bashcalc-functions.sh

# Additional math functions:

# angle_between <A> <B> <C>
# Returns true (return code 0) if angle B is between angles A and C and false otherwise
function angle_between {
	local A=$(angle_reduce $1)
	local B=$(angle_reduce $2)
	local C=$(angle_reduce $3)
  
  if [ $(float_lt $A $C) -eq 1 ] ; then
    # check B greater than A and less than C
    if [ $(float_lte $A $B) -eq 1 ] && [ $(float_lte $B $C) -eq 1 ] ; then
      echo 1
      return 0
    else
      echo 0
      return 1
    fi
  else
    # B greater than C and less than A
    if [ $(float_lte $C $B) -eq 1 ] && [ $(float_lte $B $A) -eq 1 ] ; then
      echo 1
      return 0
    else
      echo 0
      return 1
    fi
  fi
}

### Simulation Functions ###
# Variables for the state
RUNNING=0
GIVEUP=1
CAUGHT=2

# does_cat_see_mouse <cat angle> <cat radius> <mouse angle>
#
# Returns true (return code 0) if the cat can see the mouse, false otherwise.
#
# The cat sees the mouse if
# (cat radius) * cos (cat angle - mouse angle)
# is at least 1.0.
function does_cat_see_mouse {
	local cat_angle=$(angle_reduce $1)
	local cat_radius=$2
	local mouse_angle=$(angle_reduce $3)

  cat_angle_minus_mouse_angle=$(bashcalc "$cat_angle - $mouse_angle")
  cos_of=$(cosine "$cat_angle_minus_mouse_angle")
  val=$(bashcalc "$cat_radius * $cos_of")
  if [ $(float_gte "$val" "1") -eq 1 ] ; then
    echo 1
    return 0
  else
    echo 0
    return 1
  fi
}

# next_step <current state> <current step #> <cat angle> <cat radius> <mouse angle> <max steps>
# returns string output similar to the input, but for the next step:
# <state at next step> <next step #> <cat angle> <cat radius> <mouse angle> <max steps>
#
# return code of this function (return value) should be the state at the next step.  This allows for easy
# integration into a while loop.
function next_step {
	local state=$1
	local -i step=$2
	local old_cat_angle=$(angle_reduce $3)
	local old_cat_radius=$4
	local old_mouse_angle=$(angle_reduce $5)
	local -i max_steps=$6

	local new_cat_angle=${old_cat_angle}
	local new_cat_radius=${old_cat_radius}
	local new_mouse_angle=${old_mouse_angle}

	# First, make sure we are still running
  if (( ${state} != ${RUNNING} )) ; then
    echo ${state} ${step} ${old_cat_angle} ${old_cat_radius} ${old_mouse_angle} ${max_steps}
    return ${state}
  fi

	# ADD CODE HERE FOR PART 2
  step=$(expr $step + 1)

	# Move the cat first
  if [ $(float_gt "$old_cat_radius" "1.0") -eq 1 ] && [ $(does_cat_see_mouse "$old_cat_angle" "$old_cat_radius" "$old_mouse_angle") -eq 1 ] ; then
		# Move the cat in if it's not at the statue and it can see the mouse
    if [ $(float_gt "$old_cat_radius" "2.0") -eq 1 ] ; then
      new_cat_radius=$(bashcalc "$old_cat_radius - 1.0")
    else
      new_cat_radius="1.0"
    fi
  else
		# Move the cat around if it's at the statue or it can't see the mouse
		# Check if the cat caught the mouse
    new_cat_angle=$(bashcalc "$old_cat_angle + (1.25 / $old_cat_radius)")
    if [ $(float_eq "$old_cat_radius" "1.0") -eq 1 ] && [ $(angle_between "$old_cat_angle" "$old_mouse_angle" "$new_cat_angle") -eq 1 ] ; then
      state=2
    fi
    new_cat_angle=$(angle_reduce "$new_cat_angle")
  fi

	# Now move the mouse if it wasn't caught
  if [ $state = $RUNNING ] ; then
		# Move the mouse
    new_mouse_angle=$(bashcalc "$old_mouse_angle + 1.0")
    new_mouse_angle=$(angle_reduce "$new_mouse_angle")
		# Give up if we're at the last step and haven't caught the mouse
    if [ $step = $max_steps ] ; then
      state=1
    fi
  fi

  echo ${state} ${step} ${new_cat_angle} ${new_cat_radius} ${new_mouse_angle} ${max_steps}
  return ${state}
}

### Main Script ###

# ADD CODE HERE FOR PART 3
current_state=0
cat_angle=$1
cat_radius=$2
mouse_angle=$3
max_steps=$4
current_step=1

if [[ ${#} != 4 ]] ; then
  if [[ $1 != "test" ]] ; then
	  echo "Usage: <cat angle> <cat radius> <mouse angle> <max steps>"
    exit 1
  fi
fi

if [[ ${#} = 4 ]] ; then
while [ $current_state = $RUNNING ] ; do
    echo " "
    echo "$current_step -> state: $current_state"
    echo "             cat_angle: $cat_angle"
    echo "            cat_radius: $cat_radius"
    echo "           mouse_angle: $mouse_angle"

    ret=$(next_step $current_state $current_step $cat_angle $cat_radius $mouse_angle $max_steps)
    current_state=$(echo $ret | cut -d" " -f1)
    current_step=$(echo $ret | cut -d" " -f2)
    cat_angle=$(echo $ret | cut -d" " -f3)
    cat_radius=$(echo $ret | cut -d" " -f4)
    mouse_angle=$(echo $ret | cut -d" " -f5)
    max_steps=$(echo $ret | cut -d" " -f6)
  done

  echo " "
  echo "$current_step -> state: $current_state"
  echo "             cat_angle: $cat_angle"
  echo "            cat_radius: $cat_radius"
  echo "           mouse_angle: $mouse_angle"
fi


