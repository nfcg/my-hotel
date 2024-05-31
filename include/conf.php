<?php

$domain               = 'n.local';
$http                 = 'http'; // http or https
$timezone             = 'Europe/Lisbon'; // https://www.php.net/manual/en/timezones.php

$booking_mail_from    = 'bookings@n.local';
$site_start_year      = '2023';
$new_booking_status   = "confirmed"; // confirmed or pending
$seo_links            = false; // true or false // webserver configuration needed
$login_link           = true; // true or false  //Show Log-In Link in Navbar
$api_array            = ['4f3ecd4898224267a50c'];
$default_language     = "en";
$languages            = ['en','pt_PT'];

$database_type      = 'SQLite'; // SQLite or MariaDB

$MariaDB_name       = 'MariaDB_My_Hotel'; // MariaDB Database name
$MariaDB_host       = 'localhost'; // MariaDB Host
$MariaDB_user       = 'DB_user'; // MariaDB User
$MariaDB_password   = 'DB_password'; // MariaDB Password

$SQLite_location    = realpath($_SERVER["DOCUMENT_ROOT"]) . '/www/include/db/SQLite_My_Hotel.sqlite'; // I strongly recommend setting the database location outside the (www/public_html) folder.

?>
