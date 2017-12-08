for i in `ls certs`
do
    grep Issuer certs/$i >> issuers
done
