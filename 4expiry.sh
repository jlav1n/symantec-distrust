for c in $(cat matches)
do
    echo "doing $c..."
    end=`openssl x509 -inform pem -noout -text < ssl_output/$c | grep Not.After`
    expiry=`sed -r 's/\s*Not After ?: //' <<< $end`
    expiry_secs=`date +%s -d "$expiry"`
    echo "    expires: $expiry"
done
