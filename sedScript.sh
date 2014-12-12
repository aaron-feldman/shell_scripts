for x in *.jpg; 
do
  y=$(echo $x | sed -e 's/img/newyears/' -e 's/\([0-9]*\)-\([0-9]*\)-\([0-9]*\)/20\3-\1-\2/' -e 's/_\([0-9]\{2\}\.\)/_0\1/');
  mv $x $y; 
done


