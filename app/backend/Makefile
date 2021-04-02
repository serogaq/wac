.PHONY: build

build:
	cd /root/app/backend && /usr/local/openresty/luajit/bin/luarocks pack /root/app/backend/app-scm-1.rockspec
	mv /root/app/backend/app-scm-1.src.rock src.zip
	/usr/local/openresty/luajit/bin/luarocks install --only-deps /root/app/backend/app-scm-1.rockspec CRYPTO_DIR=/usr/local/openresty/openssl/ OPENSSL_DIR=/usr/local/openresty/openssl/
	rm /root/app/backend/src.zip
