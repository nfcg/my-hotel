<?php

$domain               = 'n.local';
$http                 = 'http'; // http or https
$timezone             = 'Europe/Lisbon'; // https://www.php.net/manual/en/timezones.php
$database_location    = '/var/www/include/db/my_hotel.sqlite'; // I strongly recommend setting the database location outside the (www/public_html) folder.
$booking_mail_from    = 'bookings@n.local';
$site_start_year      = '2023';
$new_booking_status   = "confirmed"; // confirmed or pending
$seo_links            = false; // true or false // webserver configuration needed
$login_link           = true; // true or false  //Show Log-In Link in Navbar
$default_language     = "en";
$languages            = ['en','pt_PT'];

?>
