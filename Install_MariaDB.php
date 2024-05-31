<?php
require "./include/conf.php";
require "./include/functions.php";

$restore_file =
    realpath($_SERVER["DOCUMENT_ROOT"]) . "/assets/lang/MariaDB_My_Hotel.sql";

$cmd = "/usr/bin/mysql -h{$MariaDB_host} -u{$MariaDB_user} -p{$MariaDB_password} < $restore_file 2>&1";

exec($cmd, $output, $retval);

echo "<pre>";
if ($retval == 0) {
    echo "Installation Successful!";
    unlink(__FILE__);
} else {
    echo $output[0] . "\n\n";
    print_r($output);
}
echo "</pre>";

?>
