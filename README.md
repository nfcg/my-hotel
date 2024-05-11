# My Hotel
 Hotel Website and Reservation Manager



## Demo:
 https://myhotel.nunofcguerreiro.com



## Installation:
 Clone the repository
 
 
  
## Configuration
 Settings in include/conf.php file.

 - Nginx Example.
```
server {
...

try_files $uri $uri/ @rewrite;

 location @rewrite {
    rewrite ^/(.*)$ /index.php?page=$1;
 }

 location ~ /\.sqlite {
    deny all;
 }
}

``` 



## ScreenShots:






