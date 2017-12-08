for s in `ls ssl_output`
do
    echo "doing $s..."

    i=`grep issuer ssl_output/$s`
    si=`grep ' [si]:' ssl_output/$s`

    while read -r line
    do
        #echo "    checking $line..."
        grep -q --line-regexp "$line" issuers &&
            echo "    MATCH on $line"
    done <<< `sed 's/issuer=\///' <<< $i`

    while read -r line
    do
        #echo "    checking $line..."
        grep -q --line-regexp "$line" issuers &&
            echo "    MATCH on $line"
    done <<< `sed -r 's/ +([0-9] )?[si]:\///' <<< $si`
done
