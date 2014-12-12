#!/bin/bash

pi=3.14159265358979323844

echo ''
echo ''
echo '#########  Assignment 4.1 Part 1 ##########' 
echo ''
echo ''
echo '  test: bashcalc-1.sh "s(3.14159*0.25)"'
echo 'output:' $(bashcalc-1.sh "s(3.14159*0.25)")
echo ''

echo '  test: bashcalc-1.sh "c(3.14159*0.25)"'
echo 'output:' $(bashcalc-1.sh "c(3.14159*0.25)")
echo ''

echo '  test: bashcalc-1.sh "8*a(1)"'
echo 'output:' $(bashcalc-1.sh "8*a(1)")
echo ''

echo '  test: bashcalc-1.sh "$pi + $pi"'
echo 'output:' $(bashcalc-1.sh "$pi + $pi")
echo ''

echo ''
echo ''
echo '#########  Assignment 4.1 Part 2 ##########' 
echo ''
echo ''

. bashcalc-functions.sh

echo '  test: bashcalc "s(3.14159*0.25)"'
echo 'output:' $(bashcalc "s(3.14159*0.25)")
echo ''

echo '  test: bashcalc "s($pi)"'
echo 'output:' $(bashcalc "s($pi)")
echo ''

echo '  test: bashcalc "c(0.25*$pi)"'
echo 'output:' $(bashcalc "c(0.25*$pi)")
echo ''

echo '  test: bashcalc "8*a(1)"'
echo 'output:' $(bashcalc "8*a(1)")
echo ''

echo '  test: bashcalc "$pi + $pi"'
echo 'output:' $(bashcalc "$pi + $pi")
echo ''

echo '  test: bashcalc "3.25*$pi/(3.25*$pi)+1.0"'
echo 'output:' $(bashcalc "3.25*$pi/(3.25*$pi)+1.0")
echo ''

echo ''
echo ''
echo '#########  Assignment 4.1 Part 3 ##########' 
echo '#########     true: 1, false: 0  ##########'
echo ''
echo ''

echo '  test: sine "0.0"'
echo 'output:' $(sine "0.0")
echo ''

echo '  test: sine "0.5*$pi"'
echo 'output:' $(sine "0.5*$pi")
echo ''

echo '  test: sine "-0.5*$pi"'
echo 'output:' $(sine "-0.5*$pi")
echo ''

echo '  test: cosine "0.5*$pi"'
echo 'output:' $(cosine "0.5*$pi")
echo ''

echo '  test: cosine "-0.5*$pi"'
echo 'output:' $(cosine "-0.5*$pi")
echo ''

echo '  test: cosine "-$pi"'
echo 'output:' $(cosine "-$pi")
echo ''

echo '  test: angle_reduce "$pi"'
echo 'output:' $(angle_reduce "$pi")
echo ''

echo '  test: angle_reduce "2*$pi"'
echo 'output:' $(angle_reduce "2*$pi")
echo ''

echo '  test: angle_reduce "$pi + $pi"'
echo 'output:' $(angle_reduce "$pi + $pi")
echo ''

echo '  test: angle_reduce "3*$pi"'
echo 'output:' $(angle_reduce "3*$pi")
echo ''

echo '  test: angle_reduce "-3*$pi"'
echo 'output:' $(angle_reduce "-3*$pi")
echo '' 

echo ''
echo '  test: float_lt "0.4" "0.5"'
echo 'output:' $(float_lt "0.4" "0.5")
echo ''

echo '  test: float_lt "0.4" "0.4"'
echo 'output:' $(float_lt "0.4" "0.4")
echo ''

echo '  test: float_lt "0.4" "0.3"'
echo 'output:' $(float_lt "0.4" "0.3")
echo ''

echo '  test: float_lte "0.4" "-0.5"'
echo 'output:' $(float_lte "0.4" "-0.5")
echo ''

echo '  test: float_lte "0.4" "0.5"'
echo 'output:' $(float_lte "0.4" "0.5")
echo ''

echo '  test: float_lte "0.4" "0.4"'
echo 'output:' $(float_lte "0.4" "0.4")
echo ''

echo '  test: float_lte "0.4" "0.3"'
echo 'output:' $(float_lte "0.4" "0.3")
echo ''

echo '  test: float_lte "0.4" "-0.5"'
echo 'output:' $(float_lte "0.4" "-0.5")

echo '  test: float_eq "0.4" "0.5"'
echo 'output:' $(float_eq "0.4" "0.5")
echo ''

echo '  test: float_eq "0.4" "0.4"'
echo 'output:' $(float_eq "0.4" "0.4")
echo ''

echo '  test: float_eq "0.4" "0.3"'
echo 'output:' $(float_eq "0.4" "0.3")
echo ''

echo '  test: float_eq "0.4" "-0.5"'
echo 'output:' $(float_eq "0.4" "-0.5")
echo ''

echo ''
echo ''
echo '#########  Assignment 4.2 Part 1 ##########' 
echo '#########     true: 1, false: 0  ##########'
echo ''
echo ''

. catmouse-fw.sh "test"

echo '  test: angle_between "3" "4" "5"'
echo 'output:' $(angle_between "3" "4" "5")
echo ''

echo '  test: angle_between "3" "6" "5"'
echo 'output:' $(angle_between "3" "6" "5")
echo ''

echo '  test: angle_between "3" "$pi" "5"'
echo 'output:' $(angle_between "3" "$pi" "5")
echo ''

echo '  test: angle_between "3" "-$pi" "5"'
echo 'output:' $(angle_between "3" "-$pi" "5")
echo ''

echo '  test: angle_between "-3" "-$pi" "2"'
echo 'output:' $(angle_between "-3" "-$pi" "2")
echo ''

echo '  test: angle_between "-3" "-$pi" "3.2"'
echo 'output:' $(angle_between "-3" "-$pi" "3.2")
echo ''

echo '  test: angle_between "-3" "-10*$pi" "3.2"'
echo 'output:' $(angle_between "-3" "-10*$pi" "3.2")
echo ''

# does_cat_see_mouse <cat angle> <cat radius> <mouse angle>
# The cat sees the mouse if
# (cat radius) * cos (cat angle - mouse angle)
# is at least 1.0.

echo '  test: does_cat_see_mouse "0.0" "2.0" "0.0"'
echo 'output:' $(does_cat_see_mouse "0.0" "1.0" "0.0")
echo ''

echo '  test: does_cat_see_mouse "0.0" "1.1" "0.0"'
echo 'output:' $(does_cat_see_mouse "0.0" "1.0" "0.0")
echo ''

echo '  test: does_cat_see_mouse "0.0" "1.0" "0.0"'
echo 'output:' $(does_cat_see_mouse "0.0" "1.0" "0.0")
echo ''

echo '  test: does_cat_see_mouse "0.0" "0.9" "0.0"'
echo 'output:' $(does_cat_see_mouse "0.0" "0.9" "0.0")
echo ''

echo '  test: does_cat_see_mouse "$pi" "2.0" "0.5*$pi"'
echo 'output:' $(does_cat_see_mouse "$pi" "2.0" "0.5*$pi")
echo ''

echo ''
echo ''
echo '#########  Assignment 4.2 Part 2 ##########' 
echo ''
echo ''

# Usage: <state> <step> <old_cat_angle> <old_cat_radius> <old_mouse_angle> <max_steps>

echo '  test: next_step "0" "1" "$pi" "2.5" "$pi" "30"'
echo 'output:' $(next_step "0" "1" "$pi" "2.5" "$pi" "30")
echo ''

echo '  test: next_step "0" "1" "$pi" "1.1" "$pi" "30"'
echo 'output:' $(next_step "0" "1" "$pi" "1.1" "$pi" "30")
echo ''

echo '  test: next_step "0" "1" "$pi" "1.0" "$pi" "30"'
echo 'output:' $(next_step "0" "1" "$pi" "1.0" "$pi" "30")
echo ''

echo '  test: next_step "0" "1" "3*$pi" "1.0" "$pi" "30"'
echo 'output:' $(next_step "0" "1" "3*$pi" "1.0" "$pi" "30")
echo ''

echo ''
echo ''
echo '#########  Assignment 4.2 Part 3 ##########' 
echo ''
echo ''

# Usage: <cat angle> <cat radius> <mouse angle> <max steps>
echo ''
echo ''
echo '###  Test 1: Should Catch Mouse First Move ###' 
echo ''
echo ''

echo ''
echo '  test: catmouse-fw.sh "$pi" "1.0" "$pi" "30"'
catmouse-fw.sh "$pi" "1.0" "$pi" "30"
echo ''

echo ''
echo ''
echo '###  Test 2: Should Catch Mouse First Move ###' 
echo ''
echo ''

echo ''
echo '  test: catmouse-fw.sh "0.9*$pi" "1.0" "$pi" "30"'
catmouse-fw.sh "0.9*$pi" "1.0" "$pi" "30"
echo ''

echo ''
echo ''
echo '###  Test 3: Should Catch Mouse Eventually ###' 
echo ''
echo ''

echo ''
echo '  test: catmouse-fw.sh "$pi" "10.1" "$pi" "30"'
catmouse-fw.sh "$pi" "10.1" "$pi" "30"
echo ''

echo ''
echo ''
echo '###  Test 4: Should Stop Before Catching Mouse ###' 
echo ''
echo ''

echo ''
echo '  test: catmouse-fw.sh "$pi" "10.1" "$pi" "28"'
catmouse-fw.sh "$pi" "10.1" "$pi" "28"
echo ''



