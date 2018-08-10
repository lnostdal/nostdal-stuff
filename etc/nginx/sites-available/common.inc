## The following is based on: https://bjornjohansen.no/optimizing-https-nginx
#ssl_session_cache shared:SSL:20m;
#ssl_session_timeout 180m;
#ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
#ssl_prefer_server_ciphers on;
#ssl_ciphers ECDH+AESGCM:ECDH+AES256:ECDH+AES128:DH+3DES:!ADH:!AECDH:!MD5;
#ssl_dhparam /etc/nginx/conf.d/dhparam.pem;
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;

charset UTF-8;

root /home/lnostdal/www;
rewrite ^/$ /qa/index.html redirect;


## Do very little (none at all?) caching and ask for validation (HTTP 304) all the time.
add_header 'Cache-Control' 'must-revalidate, proxy-revalidate, max-age=0';
expires off;


## QuantAtaraxia built in HTTP server.
location /qa_app/ {
    proxy_pass http://localhost:8080;
}


## Reverse SSH tunnel to port 80 on my laptop.
location /laptop/ {
    proxy_pass http://localhost:4242/;
}


## Reverse SSH tunnel to port 80 on desktop computer (HP).
location /desktop/ {
    proxy_pass http://localhost:4243/;
}
