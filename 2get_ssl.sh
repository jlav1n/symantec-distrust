for s in `cat sites`
do
    `find ssl_output -name $s -mtime +2` && continue
    echo ""
    echo "Doing $s..."
    openssl s_client -connect $s:443 -servername $s </dev/null > ssl_output/$s
done
