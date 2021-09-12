Requirements
-------------

 - use `socat`, `netcat`, or `tcpsvd` to handle the underlying sockets.
 - `bash`, any recent version should work.
 - `coreutils`, `curl`, `file`, and `sed`

Examples
---------

    socat tcp-listen:<port>,fork exec:/usr/local/bin/httpd

Or

    netcat -klp <port> -e /usr/local/bin/httpd

Or

    tcpsvd 127.0.0.1 <port> /usr/local/bin/httpd

    tcpsvd 127.0.0.1 <port> bash /usr/local/bin/httpd
[![ss](/media/ss01.jpg)](#)
