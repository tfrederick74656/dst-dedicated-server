# Define paths for working and target directories
working_dir=/root/download
target_dir=/root/libraries

# Define the packages to be downloaded and the dependency copy command
copy_command="cp -L --preserve=timestamp"
library_list="libc6 libcom-err2 libcurl3-gnutls libgcc1 libgssapi-krb5-2 libidn2-0 libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 libldap-2.4-2 libnghttp2-14 libnspr4 libnss3 libpcre3 libsasl2-2 libselinux1 libssh2-1 libssl1.1 libstdc++6 libunistring2 zlib1g libffi6 libgcrypt20 libgmp10 libgnutls30 libgpg-error0 libhogweed4 libnettle6 libp11-kit0 libpsl5 librtmp1 libtasn1-6"

# Create the working directory and move there. The target directory will be bind-mounted in.
mkdir $working_dir
cd $working_dir

# Update sources
apt-get update

# Download all packages
apt-get download $library_list

# Extract the .deb package files
for f in *.deb; do dpkg-deb -x $f .; done

# Copy library files to target directory
$copy_command $working_dir/lib/i386-linux-gnu/libm.so.6 $target_dir/libm.so.6
$copy_command $working_dir/lib/i386-linux-gnu/libc.so.6 $target_dir/libc.so.6
$copy_command $working_dir/lib/ld-linux.so.2 $target_dir/ld-linux.so.2
$copy_command $working_dir/lib/i386-linux-gnu/libdl.so.2 $target_dir/libdl.so.2
$copy_command $working_dir/lib/i386-linux-gnu/libresolv.so.2 $target_dir/libresolv.so.2
$copy_command $working_dir/lib/i386-linux-gnu/libcrypt.so.1 $target_dir/libcrypt.so.1
$copy_command $working_dir/lib/i386-linux-gnu/librt.so.1 $target_dir/librt.so.1
$copy_command $working_dir/lib/i386-linux-gnu/libpthread.so.0 $target_dir/libpthread.so.0
$copy_command $working_dir/lib/i386-linux-gnu/libcom_err.so.2 $target_dir/libcom_err.so.2
$copy_command $working_dir/usr/lib/i386-linux-gnu/libcurl-gnutls.so.4 $target_dir/libcurl-gnutls.so.4
$copy_command $working_dir/lib/i386-linux-gnu/libgcc_s.so.1 $target_dir/libgcc_s.so.1
$copy_command $working_dir/usr/lib/i386-linux-gnu/libgssapi_krb5.so.2 $target_dir/libgssapi_krb5.so.2
$copy_command $working_dir/usr/lib/i386-linux-gnu/libidn2.so.0 $target_dir/libidn2.so.0
$copy_command $working_dir/usr/lib/i386-linux-gnu/libk5crypto.so.3 $target_dir/libk5crypto.so.3
$copy_command $working_dir/lib/i386-linux-gnu/libkeyutils.so.1 $target_dir/libkeyutils.so.1
$copy_command $working_dir/usr/lib/i386-linux-gnu/libkrb5.so.3 $target_dir/libkrb5.so.3
$copy_command $working_dir/usr/lib/i386-linux-gnu/libkrb5support.so.0 $target_dir/libkrb5support.so.0
$copy_command $working_dir/usr/lib/i386-linux-gnu/libldap-2.4.so.2 $target_dir/libldap-2.4.so.2
$copy_command $working_dir/usr/lib/i386-linux-gnu/liblber-2.4.so.2 $target_dir/liblber-2.4.so.2
$copy_command $working_dir/usr/lib/i386-linux-gnu/libnghttp2.so.14 $target_dir/libnghttp2.so.14
$copy_command $working_dir/usr/lib/i386-linux-gnu/libplds4.so $target_dir/libplds4.so
$copy_command $working_dir/usr/lib/i386-linux-gnu/libplc4.so $target_dir/libplc4.so
$copy_command $working_dir/usr/lib/i386-linux-gnu/libnspr4.so $target_dir/libnspr4.so
$copy_command $working_dir/usr/lib/i386-linux-gnu/libssl3.so $target_dir/libssl3.so
$copy_command $working_dir/usr/lib/i386-linux-gnu/libsmime3.so $target_dir/libsmime3.so
$copy_command $working_dir/usr/lib/i386-linux-gnu/libnss3.so $target_dir/libnss3.so
$copy_command $working_dir/usr/lib/i386-linux-gnu/libnssutil3.so $target_dir/libnssutil3.so
$copy_command $working_dir/lib/i386-linux-gnu/libpcre.so.3 $target_dir/libpcre.so.1
$copy_command $working_dir/usr/lib/i386-linux-gnu/libsasl2.so.2 $target_dir/libsasl2.so.3
$copy_command $working_dir/lib/i386-linux-gnu/libselinux.so.1 $target_dir/libselinux.so.1
$copy_command $working_dir/usr/lib/i386-linux-gnu/libssh2.so.1 $target_dir/libssh2.so.1
$copy_command $working_dir/usr/lib/i386-linux-gnu/libssl.so.1.1 $target_dir/libssl.so.10
$copy_command $working_dir/usr/lib/i386-linux-gnu/libcrypto.so.1.1 $target_dir/libcrypto.so.10
$copy_command $working_dir/usr/lib/i386-linux-gnu/libstdc++.so.6 $target_dir/libstdc++.so.6
$copy_command $working_dir/usr/lib/i386-linux-gnu/libunistring.so.2 $target_dir/libunistring.so.0
$copy_command $working_dir/lib/i386-linux-gnu/libz.so.1 $target_dir/libz.so.1
$copy_command $working_dir/usr/lib/i386-linux-gnu/libgnutls.so.30 $target_dir/libgnutls.so.30
$copy_command $working_dir/usr/lib/i386-linux-gnu/libldap_r-2.4.so.2 $target_dir/libldap_r-2.4.so.2
$copy_command $working_dir/usr/lib/i386-linux-gnu/libnettle.so.6 $target_dir/libnettle.so.6
$copy_command $working_dir/usr/lib/i386-linux-gnu/libpsl.so.5 $target_dir/libpsl.so.5
$copy_command $working_dir/usr/lib/i386-linux-gnu/librtmp.so.1 $target_dir/librtmp.so.1
$copy_command $working_dir/lib/i386-linux-gnu/libgpg-error.so.0 $target_dir/libgpg-error.so.0
$copy_command $working_dir/usr/lib/i386-linux-gnu/libffi.so.6 $target_dir/libffi.so.6
$copy_command $working_dir/usr/lib/i386-linux-gnu/libgmp.so.10 $target_dir/libgmp.so.10
$copy_command $working_dir/usr/lib/i386-linux-gnu/libhogweed.so.4 $target_dir/libhogweed.so.4
$copy_command $working_dir/usr/lib/i386-linux-gnu/libp11-kit.so.0 $target_dir/libp11-kit.so.0
$copy_command $working_dir/usr/lib/i386-linux-gnu/libtasn1.so.6 $target_dir/libtasn1.so.6
$copy_command $working_dir/usr/lib/i386-linux-gnu/libunistring.so.2 $target_dir/libunistring.so.2
$copy_command $working_dir/usr/lib/i386-linux-gnu/libsasl2.so.2 $target_dir/libsasl2.so.2
$copy_command $working_dir/lib/i386-linux-gnu/libgcrypt.so.20 $target_dir/libgcrypt.so.20
$copy_command $working_dir/lib/i386-linux-gnu/libnss_dns-2.28.so $target_dir/libnss_dns.so.2
