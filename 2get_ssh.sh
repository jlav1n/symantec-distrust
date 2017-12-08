for s in `cat sites`
do
    openssl s_client -connect $s:443 -servername $s </dev/null > ssl_output/$s
done
