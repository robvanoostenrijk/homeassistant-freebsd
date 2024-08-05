#!/usr/local/bin/bash

# Based on: https://github.com/tprelog/iocage-homeassistant/issues/64
set -x

#pkg install -y devel/grpc

# Optional: grpcio for google-cloud-texttospeech
echo "[i] grpcio for google-cloud-texttospeech"
fetch -o - https://files.pythonhosted.org/packages/7d/6d/919fd5886882c066122e69fbd938c1df2dc0aa22ab8de3e047c6aff5ac58/grpcio-1.60.1.tar.gz | tar -C /root -xz
# Apply FreeBSD patches for grpcio
fetch -o - https://raw.githubusercontent.com/freebsd/freebsd-ports/e8761ae4485b80b6cda12ace5fa669697c91065f/devel/py-grpcio/files/patch-src_core_tsi_ssl__transport__security.cc | patch -d /root/grpcio-1.60.1 -p0
fetch -o - https://raw.githubusercontent.com/freebsd/freebsd-ports/e8761ae4485b80b6cda12ace5fa669697c91065f/devel/py-grpcio/files/patch-third__party_abseil-cpp_absl_base_internal_sysinfo.cc | patch -d /root/grpcio-1.60.1 -p0
fetch -o - https://raw.githubusercontent.com/freebsd/freebsd-ports/e8761ae4485b80b6cda12ace5fa669697c91065f/devel/py-grpcio/files/patch-third__party_abseil-cpp_absl_time_internal_cctz_src_time__zone__format.cc | patch -d /root/grpcio-1.60.1 -p0
fetch -o - https://raw.githubusercontent.com/freebsd/freebsd-ports/e8761ae4485b80b6cda12ace5fa669697c91065f/devel/py-grpcio/files/patch-third__party_boringssl-with-bazel_src_include_openssl_base.h | patch -d /root/grpcio-1.60.1 -p0

patch -d /root/grpcio-1.60.1 -p0 <<-'EOF_PATCH'
        --- third_party/abseil-cpp/absl/status/status.cc.orig
        +++ third_party/abseil-cpp/absl/status/status.cc
        @@ -29,6 +29,19 @@
         #include "absl/strings/str_format.h"
         #include "absl/strings/str_split.h"

        +#ifndef ENOSTR
        +#define ENOSTR 9924    /* Device not a stream */
        +#endif
        +#ifndef ETIME
        +#define ETIME 9935     /* Timer expired */
        +#endif
        +#ifndef ENODATA
        +#define ENODATA 9919   /* No data available */
        +#endif
        +#ifndef ENOSR
        +#define ENOSR 9922     /* Out of streams resources */
        +#endif
        +
         namespace absl {
         ABSL_NAMESPACE_BEGIN
EOF_PATCH

/root/install-pip-package.sh --use-pep517 /root/grpcio-1.60.1
