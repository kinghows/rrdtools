#!/bin/bash
basedir=/usr/share/nagios/html
rrdfile=$basedir/iostat.rrd
mkdir -p $basedir
if [ ! -f $rrdfile ]
then
  rrdtool create $rrdfile \
  DS:reads:GAUGE:600:U:U \
  DS:writes:GAUGE:600:U:U \
  DS:Mreads:GAUGE:600:U:U \
  DS:Mwrites:GAUGE:600:U:U \
  RRA:AVERAGE:0.5:1:576 \
  RRA:AVERAGE:0.5:6:672 \
  RRA:AVERAGE:0.5:24:744 \
  RRA:AVERAGE:0.5:288:732 \
  RRA:MIN:0.5:1:576 \
  RRA:MIN:0.5:6:672 \
  RRA:MIN:0.5:24:744 \
  RRA:MIN:0.5:288:732 \
  RRA:MAX:0.5:1:576 \
  RRA:MAX:0.5:6:672 \
  RRA:MAX:0.5:24:744 \
  RRA:MAX:0.5:288:732

fi

echo $(iostat -x |grep sda | awk '{ printf("update /usr/share/nagios/html/iostat.rrd N:%f:%f:%f:%f", $4, $5, $6, $7)}') | rrdtool -

hostname=`uname -n`
date=`date "+%Y-%m-%d %H.%M.%S %Z"`

rrdtool graph $basedir/iostat1.png \
  --start now-1day \
  --vertical-label "requests/sec" \
  --units-exponent 0 \
  --title "$hostname - iostat -1day " \
  --alt-autoscale-max \
  --lower-limit 0 \
  DEF:readsavg=$rrdfile:reads:AVERAGE \
  LINE1:readsavg#00cc00:"Reads" \
  GPRINT:readsavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:readsavg:MIN:"Min\:%3.2lf" \
  GPRINT:readsavg:MAX:"Max\:%3.2lf\n" \
  DEF:writesavg=$rrdfile:writes:AVERAGE \
  LINE2:writesavg#0000dd:"Writes" \
  GPRINT:writesavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:writesavg:MIN:"Min\:%3.2lf" \
  GPRINT:writesavg:MAX:"Max\:%3.2lf\n" \
  DEF:Mreadsavg=$rrdfile:Mreads:AVERAGE \
  LINE3:Mreadsavg#00BBdd:"Merged Reads" \
  GPRINT:Mreadsavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:Mreadsavg:MIN:"Min\:%3.2lf" \
  GPRINT:Mreadsavg:MAX:"Max\:%3.2lf\n" \
  DEF:Mwritesavg=$rrdfile:Mwrites:AVERAGE \
  LINE4:Mwritesavg#cc0000:"Merged Writes" \
  GPRINT:Mwritesavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:Mwritesavg:MIN:"Min\:%3.2lf" \
  GPRINT:Mwritesavg:MAX:"Max\:%3.2lf\n" \
  COMMENT:"$date \r"
  
rrdtool graph $basedir/iostat7.png \
  --start now-7day \
  --vertical-label "requests/sec" \
  --units-exponent 0 \
  --title "$hostname - iostat -7day " \
  --alt-autoscale-max \
  --lower-limit 0 \
  DEF:readsavg=$rrdfile:reads:AVERAGE \
  LINE1:readsavg#00cc00:"Reads" \
  GPRINT:readsavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:readsavg:MIN:"Min\:%3.2lf" \
  GPRINT:readsavg:MAX:"Max\:%3.2lf\n" \
  DEF:writesavg=$rrdfile:writes:AVERAGE \
  LINE2:writesavg#0000dd:"Writes" \
  GPRINT:writesavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:writesavg:MIN:"Min\:%3.2lf" \
  GPRINT:writesavg:MAX:"Max\:%3.2lf\n" \
  DEF:Mreadsavg=$rrdfile:Mreads:AVERAGE \
  LINE3:Mreadsavg#00BBdd:"Merged Reads" \
  GPRINT:Mreadsavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:Mreadsavg:MIN:"Min\:%3.2lf" \
  GPRINT:Mreadsavg:MAX:"Max\:%3.2lf\n" \
  DEF:Mwritesavg=$rrdfile:Mwrites:AVERAGE \
  LINE4:Mwritesavg#cc0000:"Merged Writes" \
  GPRINT:Mwritesavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:Mwritesavg:MIN:"Min\:%3.2lf" \
  GPRINT:Mwritesavg:MAX:"Max\:%3.2lf\n" \
  COMMENT:"$date \r"
  
rrdtool graph $basedir/iostat30.png \
  --start now-30day \
  --vertical-label "requests/sec" \
  --units-exponent 0 \
  --title "$hostname - iostat -30day " \
  --alt-autoscale-max \
  --lower-limit 0 \
  DEF:readsavg=$rrdfile:reads:AVERAGE \
  LINE1:readsavg#00cc00:"Reads" \
  GPRINT:readsavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:readsavg:MIN:"Min\:%3.2lf" \
  GPRINT:readsavg:MAX:"Max\:%3.2lf\n" \
  DEF:writesavg=$rrdfile:writes:AVERAGE \
  LINE2:writesavg#0000dd:"Writes" \
  GPRINT:writesavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:writesavg:MIN:"Min\:%3.2lf" \
  GPRINT:writesavg:MAX:"Max\:%3.2lf\n" \
  DEF:Mreadsavg=$rrdfile:Mreads:AVERAGE \
  LINE3:Mreadsavg#00BBdd:"Merged Reads" \
  GPRINT:Mreadsavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:Mreadsavg:MIN:"Min\:%3.2lf" \
  GPRINT:Mreadsavg:MAX:"Max\:%3.2lf\n" \
  DEF:Mwritesavg=$rrdfile:Mwrites:AVERAGE \
  LINE4:Mwritesavg#cc0000:"Merged Writes" \
  GPRINT:Mwritesavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:Mwritesavg:MIN:"Min\:%3.2lf" \
  GPRINT:Mwritesavg:MAX:"Max\:%3.2lf\n" \
  COMMENT:"$date \r"

rrdtool graph $basedir/iostat360.png \
  --start now-360day \
  --vertical-label "requests/sec" \
  --units-exponent 0 \
  --title "$hostname - iostat -360day " \
  --alt-autoscale-max \
  --lower-limit 0 \
  DEF:readsavg=$rrdfile:reads:AVERAGE \
  LINE1:readsavg#00cc00:"Reads" \
  GPRINT:readsavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:readsavg:MIN:"Min\:%3.2lf" \
  GPRINT:readsavg:MAX:"Max\:%3.2lf\n" \
  DEF:writesavg=$rrdfile:writes:AVERAGE \
  LINE2:writesavg#0000dd:"Writes" \
  GPRINT:writesavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:writesavg:MIN:"Min\:%3.2lf" \
  GPRINT:writesavg:MAX:"Max\:%3.2lf\n" \
  DEF:Mreadsavg=$rrdfile:Mreads:AVERAGE \
  LINE3:Mreadsavg#00BBdd:"Merged Reads" \
  GPRINT:Mreadsavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:Mreadsavg:MIN:"Min\:%3.2lf" \
  GPRINT:Mreadsavg:MAX:"Max\:%3.2lf\n" \
  DEF:Mwritesavg=$rrdfile:Mwrites:AVERAGE \
  LINE4:Mwritesavg#cc0000:"Merged Writes" \
  GPRINT:Mwritesavg:AVERAGE:"Average\:%3.2lf" \
  GPRINT:Mwritesavg:MIN:"Min\:%3.2lf" \
  GPRINT:Mwritesavg:MAX:"Max\:%3.2lf\n" \
  COMMENT:"$date \r"
  
cat > ${basedir}/iostat.html <<EOF
<html>
<head>
<meta http-equiv="refresh" content="300">
</head>
<body>
<img src="iostat1.png" />
<img src="iostat7.png" />
<img src="iostat30.png" />
<img src="iostat360.png" />
</body>
</html>
EOF

