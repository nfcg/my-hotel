# My Hotel
 Hotel Website, Booking and Reservation System.
 Written in php and using the sqlite database, it is best suited to small and medium-sized hotels or hostels.
 
 
## Requirements
 - PHP 7.0+
 - php-sqlite3
  

## Demo:
 https://myhotel.nunofcguerreiro.com


## Installation:
 Clone the repository
 
 
## Configuration
 Settings in include/conf.php file.


 - Calendar API Example.
 https://myhotel.nunofcguerreiro.com/include/do_post.php?do=calendar_api&from=2024-08-01&to=2024-08-07&content=xml&lotation=1&type=single&key=4f3ecd4898224267a50c

 - Nginx SEO Links Configuration Example.
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

