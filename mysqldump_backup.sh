# Backup storage directory
backup_folder=/home/username/backup

# MySQL user
user=username

# MySQL password
password=MySQLpassword

#database
database=dbname

# Number of days to store the backup
keep_day=60

sqlfile=$backup_folder/$database-$(date +%d-%m-%Y_%H-%M-%S).sql.gz

# Create a backup
sudo mysqldump -u $user -p$password --databases $database | gzip > $sqlfile

# Delete old backups
find $backupfolder -mtime +$keep_day -delete

#mail
mailbody="MySQL backup is done"
echo "From: backup@website.com" > /tmp/mailtest
echo "To: mail@website.com" >> /tmp/mailtest
echo "Subject: Mysql Backup " >> /tmp/mailtest
echo "" >> /tmp/mailtest
echo $mailbody >> /tmp/mailtest
cat /tmp/mailtest | /usr/sbin/sendmail -t
