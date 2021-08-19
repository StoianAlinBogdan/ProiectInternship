if test -f "./backup.sql.gz"; then
        gunzip backup.sql.gz
else
        echo "no backup archive found!"
fi

pass=`cat /usr/local/etc/my-pass`

if test -f "./backup.sql"; then
        mysql -h mysql-rds.ctrc9p26yyt8.eu-central-1.rds.amazonaws.com --user=alstoian --password=$pass report < backup>else
        echo "sql script not found!"
fi