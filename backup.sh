if test -f "./backup.sql.gz"; then
	rm ./backup.sql.gz
fi

mysqldump --user=alstoian --password=Admin1234 --add-drop-table --databases report --verbose > backup.sql

if test -f "./backup.sql"; then
	gzip ./backup.sql
	if test -f "./mykey2.pem"; then
		scp -i mykey2.pem backup.sql.gz ubuntu@ec2-3-121-184-109.eu-central-1.compute.amazonaws.com:/home/ubuntu
	else
		echo "no key found"
	fi
else
	echo "backup failed!"
fi


