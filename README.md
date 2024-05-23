<h1 align="center">
My Hotel
</h1>

<h3 align="center">
Hotel Website and Booking Management System.
</h3>

Multi-language English and Portuguese. Written in php and using the sqlite database, it is best suited to small and medium-sized hotels or hostels.
 
 
 
## Requirements
 - PHP 7.2+
 - php-sqlite3
  

## Demo:
 https://myhotel.nunofcguerreiro.com


## Installation:
 Clone or Download the Repository
 
 
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

## ScreenShots

#### - Home
![Screenshot](assets/img/Screen_Shots/My-Hotel_Home.png)
#### - Rooms
![Screenshot](assets/img/Screen_Shots/My Hotel - Rooms - myhotel.nunofcguerreiro.com.png)
#### - Services
![Screenshot](assets/img/Screen_Shots/My Hotel - Services - myhotel.nunofcguerreiro.com.png)
#### - Gallery
![Screenshot](assets/img/Screen_Shots/My Hotel - Gallery - myhotel.nunofcguerreiro.com.png)
#### - BookNow
![Screenshot](assets/img/Screen_Shots/My Hotel - Book Now - myhotel.nunofcguerreiro.com.png)
#### - Contact Us
![Screenshot](assets/img/Screen_Shots/My Hotel - Contact us - myhotel.nunofcguerreiro.com.png)
#### - Admin Home
![Screenshot](assets/img/Screen_Shots/My Hotel - Admin Home - myhotel.nunofcguerreiro.com.png)
#### - Admin Bookings
![Screenshot](assets/img/Screen_Shots/My Hotel - Admin Bookings - myhotel.nunofcguerreiro.com.png)
#### - Admin Calendar
![Screenshot](assets/img/Screen_Shots/My Hotel - Admin Calendar - myhotel.nunofcguerreiro.com.png)
#### - Admin Language
![Screenshot](assets/img/Screen_Shots/My Hotel - Admin Language - myhotel.nunofcguerreiro.com.png)
#### - Admin Gallery
![Screenshot](assets/img/Screen_Shots/My Hotel - Admin Gallery - myhotel.nunofcguerreiro.com.png)
#### - Admin Rooms
![Screenshot](assets/img/Screen_Shots/My Hotel - Admin Rooms - myhotel.nunofcguerreiro.com.png)
#### - Admin Services
![Screenshot](assets/img/Screen_Shots/My Hotel - Admin Services - myhotel.nunofcguerreiro.com.png)

