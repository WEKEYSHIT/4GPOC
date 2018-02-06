cat $@ > objCode.tar.gz.aes
openssl aes-256-cbc -d -in objCode.tar.gz.aes -out objCode.tar.gz
