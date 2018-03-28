ORG_FILE=/tmp/objCode.tar.gz
AES_FILE=$ORG_FILE.aes

rm -f $ORG_FILE "$AES_FILE*"
tar -zcf $ORG_FILE objCode
openssl aes-256-cbc -e -in $ORG_FILE -out $AES_FILE

size=`ls -l $AES_FILE | awk '{print $5}'`
block=$((25*1024*1024))
num=$((($size+$block-1)/$block))
i=0
while [ $i -lt $num ];
do
    OFILE=$AES_FILE-$i
    echo $OFILE
    dd if=$AES_FILE of=$OFILE bs=25M count=1 skip=$i > /dev/null 2>&1
    let i++
done

