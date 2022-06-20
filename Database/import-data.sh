sleep 60

for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'yourStrong2022Password' -d master -i /usr/init_db/init-sql-scripts/setup.sql
    if [ $? -eq 0 ]
    then
        echo "setup.sql completed"
        break
    else
        echo "not ready yet.."
        sleep 1
    fi
done