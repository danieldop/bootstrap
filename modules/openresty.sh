#!/usr/bin/env bash

case ${OS_NAME} in
    "${OS_FEDORA}")
        sudo ${PACKAGE_MANAGER} -y install openresty openresty-opm
    ;;
    "${OS_AMAZON_LINUX}")
        readonly OPENRESTY_VERSION=1.13.6.2
        readonly OPENRESTY_CONFIG_FLAGS="--with-ipv6 --with-pcre-jit --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_v2_module --without-mail_pop3_module --without-mail_imap_module --without-mail_smtp_module --with-http_stub_status_module --with-http_realip_module --with-http_addition_module --with-http_auth_request_module --with-http_secure_link_module --with-http_random_index_module --with-http_gzip_static_module --with-http_sub_module --with-http_dav_module --with-http_flv_module  --with-http_mp4_module --with-http_gunzip_module --with-threads --with-dtrace-probes --with-stream --with-stream_ssl_module --with-http_ssl_module"

        wget --directory-prefix=/tmp https://openresty.org/download/openresty-${OPENRESTY_VERSION}.tar.gz
        sudo tar -xvf /tmp/openresty-${OPENRESTY_VERSION}.tar.gz -C /opt
        cd /opt/openresty-${OPENRESTY_VERSION}
        sudo ./configure ${OPENRESTY_CONFIG_FLAGS}
        sudo make -j4 && sudo make install -j4
        cd -

        sudo mkdir -p /var/log/nginx

        export PATH=/usr/local/openresty/bin:/usr/local/openresty/nginx/sbin:$PATH
        export PATH=/usr/local/openresty/luajit/bin:$PATH

        tee -a ~/.bash_profile << END

# openresty & lua
export PATH=/usr/local/openresty/bin:/usr/local/openresty/nginx/sbin:\$PATH
export PATH=/usr/local/openresty/luajit/bin:\$PATH
END
    ;;
esac