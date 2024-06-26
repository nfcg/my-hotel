<h1 align="center">
My Hotel
</h1>

<h3 align="center">
Hotel Website and Booking Management System.
</h3>

Multi-themes and Language, currently English and Portuguese. Written in PHP and using SQLite database, it is best suited to small and medium-sized hotels or hostels.
 
 
 
## Requirements
 - PHP 7.2+
 - php-sqlite3
  

## Demo:
 https://myhotel.nunofcguerreiro.com


## Installation:
 Clone or Download the Repository
 
 
## Configuration
 Settings in include/conf.php file.
 
 Default User and Passowrd is "admin". Make sure to change this.

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
![Screenshot](assets/img/Screen_Shots/My-Hotel_Rooms.png)
#### - Services
![Screenshot](assets/img/Screen_Shots/My-Hotel_Services.png)
#### - Gallery
![Screenshot](assets/img/Screen_Shots/My-Hotel_Gallery.png)
#### - BookNow
![Screenshot](assets/img/Screen_Shots/My-Hotel_BookNow.png)
#### - Contact Us
![Screenshot](assets/img/Screen_Shots/My-Hotel_Contactus.png)
#### - Admin Home
![Screenshot](assets/img/Screen_Shots/My-Hotel_Admin_Home.png)
#### - Admin Bookings
![Screenshot](assets/img/Screen_Shots/My-Hotel_Admin_Bookings.png)
#### - Admin Calendar
![Screenshot](assets/img/Screen_Shots/My-Hotel_Admin_Calendar.png)
#### - Admin Language
![Screenshot](assets/img/Screen_Shots/My-Hotel_Admin_Language.png)
#### - Admin Gallery
![Screenshot](assets/img/Screen_Shots/My-Hotel_Admin_Gallery.png)
#### - Admin Rooms
![Screenshot](assets/img/Screen_Shots/My-Hotel_Admin_Rooms.png)
#### - Admin Services
![Screenshot](assets/img/Screen_Shots/My-Hotel_Admin_Services.png)

