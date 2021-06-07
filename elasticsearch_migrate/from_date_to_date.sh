#!/bin/bash

# start date
d="2021-01-01"
# end date
e="2021-06-03"
# index prefix
i="tmdk_app_log_prod-"

from="http://1.2.3.4:9200/"
to="http://127.0.0.1:9200/"

until [[ $d > $e ]]; do
    #convert date dash to under score
    du=`echo "$d" | sed -e 's/-/./g'`
    echo "elasticdump --input=${from}${i}${d} --output=${to}${i}${d} --type=data"
    d=$(date -I -d "$d + 1 day")
done
