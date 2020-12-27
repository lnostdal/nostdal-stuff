# Global top-level ("main context") nginx config.

worker_processes auto;
worker_cpu_affinity auto;

pcre_jit on;

ssl_session_cache shared:SSL:20m;
ssl_session_timeout 10m;
ssl_prefer_server_ciphers on;
ssl_session_tickets off;

events {
    multi_accept on;
    worker_connections 4096;
}

http {
    server_tokens off;

    access_log off; # Because this really shouldn't be needed for general resources. Application clients and servers should log more interesting things instead -- and should do it better.
    
    sendfile on;
    tcp_nopush on;

    aio threads;
    directio 512;
    output_buffers 1 128k;    

    # TODO: Use one gzip config file for browser based access and another for server <--> server (proxy_pass) based access?
    gzip on;
    gzip_min_length 256;
    gzip_comp_level 6;
    gzip_proxied any;
    gzip_types text/css text/javascript text/xml text/plain text/x-component application/javascript application/x-javascript application/json application/xml application/rss+xml application/atom+xml font/truetype font/opentype application/vnd.ms-fontobject image/svg+xml text/event-stream application/x-bec-df;

    resolver 1.1.1.1 8.8.8.8 8.8.4.4;
    resolver_timeout 15s;

    keepalive_timeout 75s;
    reset_timedout_connection on;
    client_body_timeout 15s;
    client_header_timeout 15s;
    send_timeout 15s;

    proxy_http_version 1.1;
    proxy_socket_keepalive on;
    proxy_connect_timeout 15s;
    proxy_read_timeout 15s;
    proxy_send_timeout 15s;
    
    # Cache at the client, but always ask for validation (HTTP 304).
    add_header 'Cache-Control' 'no-cache, must-revalidate, proxy-revalidate, max-age=0';
    expires off;
}



