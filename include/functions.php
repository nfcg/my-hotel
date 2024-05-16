<?php
session_start();
require "conf.php";
require "autoload.php";

use Smarty\Smarty;

$smarty = new Smarty();

$smarty->setTemplateDir("./assets/html");
$smarty->setCompileDir("./assets/html/templates_c");
$smarty->setCacheDir("./assets/html/cache");
$smarty->setConfigDir("./assets/html/config");
//$smarty->testInstall();
//$smarty->caching = 0;

if ($http == "https") {
    $secure = true;
} else {
    $secure = false;
}

if (!empty($_POST["remember"])) {
    $expirytime = time() + 3600 * 24 * 365;
} else {
    $expirytime = time() + 3600 * 24 * 1;
}

$cookie_params = [
    "expires" => $expirytime,
    "path" => "/",
    "domain" => $domain,
    "secure" => false,
    "httponly" => false,
    "samesite" => "None"
];

if (isset($_COOKIE["LANGUAGE"])) {
    $default_language = $_COOKIE["LANGUAGE"];
} else {
    setcookie("LANGUAGE", $default_language, $cookie_params);
    $default_language = $default_language;
}

function sqlite($method, $cmd)
{
    global $database, $values;
    try {
        if (!file_exists($database)) {
            throw new PDOException("database not found");
        }
        $db = new PDO("sqlite:$database");
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $db->exec("PRAGMA journal_mode = wal;");
        switch ($method) {
            case "QUERY_KEY_PAIR":
                try {
                    $result = $db->query($cmd);
                    return $result->fetchAll(PDO::FETCH_KEY_PAIR);

                    $db = null;
                    unset($db);
                } catch (PDOException $e) {
                    echo "Connection Error -->> " .
                        $e->getMessage() .
                        "</br>Error Code -->> " .
                        $e->getCode();
                    $db = null;
                    unset($db);
                    die();
                }
                break;
            case "QUERY_FETCH_ASSOC":
                try {
                    $result = $db->query($cmd);
                    return $result->fetchALL(PDO::FETCH_ASSOC);

                    $db = null;
                    unset($db);
                } catch (PDOException $e) {
                    echo "Connection Error -->> " .
                        $e->getMessage() .
                        "</br>Error Code -->> " .
                        $e->getCode();
                    $db = null;
                    unset($db);
                    die();
                }
                break;
            case "UPDATE":
                try {
                    $update = $db->prepare($cmd);
                    $update->execute();
                    return $update->rowCount();
                    $db = null;
                    unset($db);
                } catch (PDOException $e) {
                    echo "Connection Error -->> " .
                        $e->getMessage() .
                        "</br>Error Code -->> " .
                        $e->getCode();
                    $db = null;
                    unset($db);
                    die();
                }
                break;
            case "INSERT":
                try {
                    $qry = $db->prepare($cmd);
                    $qry->execute($values);
                    return $db->lastInsertId();
                    $db = null;
                    unset($db);
                } catch (PDOException $e) {
                    return 0;
                    $db = null;
                    unset($db);
                    die();
                }
                break;
            case "DELETE":
                try {
                    $qry = $db->prepare($cmd);
                    $qry->execute($values);
                    return $qry->rowCount();
                    $db = null;
                    unset($db);
                } catch (PDOException $e) {
                    echo "Connection Error -->> " .
                        $e->getMessage() .
                        "</br>Error Code -->> " .
                        $e->getCode();
                    $db = null;
                    unset($db);
                    die();
                }
                break;
            default:
                echo "Not Allowed";
                exit();
        }
    } catch (PDOException $e) {
        echo "Connection Error -->> " .
            $e->getMessage() .
            "</br>Error Code -->> " .
            $e->getCode();
        $db = null;
        unset($db);
        die();
    }
}

$database = "$database_location";

$language = sqlite("QUERY_KEY_PAIR",
    "SELECT NAME, TRANSLATION FROM 'LANGUAGE_$default_language';");
$smarty->assign($language);

foreach ($language as $x => $y) {
    $$x = $smarty->getTemplateVars("$x");
}

$smarty->assign("languages", $languages);

$cc_val = [
    "01" => $JAN,
    "02" => $FEB,
    "03" => $MAR,
    "04" => $APR,
    "05" => $MAY,
    "06" => $JUN,
    "07" => $JUL,
    "08" => $AUG,
    "09" => $SET,
    "10" => $OUT,
    "11" => $NOV,
    "12" => $DEC
];

$cc_years = range(date("Y"), date("Y") + 10);

$smarty->assign("CUR_YEAR", date("Y"));
$smarty->assign("CC_YEARS", $cc_years);
$smarty->assign("CC_VAL", $cc_val);
$smarty->assign("SITE_START_YEAR", $site_start_year);

$gallery_list = sqlite("QUERY_FETCH_ASSOC",
    "SELECT TYPE, GAL_NAME FROM IMAGES WHERE LANGUAGE = '$default_language' AND TYPE != 'gallery_carousel' GROUP BY TYPE;");
$smarty->assign("gallery_list", $gallery_list);

$gallerys = sqlite("QUERY_FETCH_ASSOC", 
    "SELECT * FROM IMAGES;");
$smarty->assign("images", $gallerys);

$services = sqlite("QUERY_FETCH_ASSOC",
    "SELECT * FROM SERVICES WHERE LANGUAGE = '$default_language';");
$smarty->assign("services", $services);

$services_admin = sqlite("QUERY_FETCH_ASSOC", 
    "SELECT * FROM SERVICES;");
$smarty->assign("services_admin", $services_admin);

$rooms = sqlite("QUERY_FETCH_ASSOC",
    "SELECT * FROM ROOMS WHERE LANGUAGE = '$default_language';");
$smarty->assign("rooms", $rooms);

$rooms_admin = sqlite("QUERY_FETCH_ASSOC", 
    "SELECT * FROM ROOMS;");
$smarty->assign("rooms_admin", $rooms_admin);

$room_types = sqlite("QUERY_FETCH_ASSOC",
    "SELECT TYPE FROM ROOMS GROUP BY TYPE;");
$smarty->assign("room_types", $room_types);

$images = sqlite("QUERY_FETCH_ASSOC", 
    "SELECT * FROM IMAGES;");
$smarty->assign("images", $images);

$carousel = sqlite("QUERY_FETCH_ASSOC",
    "SELECT * FROM IMAGES WHERE LANGUAGE = '$default_language' AND TYPE = 'gallery_carousel';");
$smarty->assign("carousel", $carousel);

$today = date("Y-m-d");
//$today = '2024-05-01';

$check_in_today = sqlite("QUERY_FETCH_ASSOC",
    "SELECT substr(DATE,1,4) AS DATE, ID, FIRST_NAME || ' ' || LAST_NAME AS NAME, CHECK_IN, CHECK_OUT FROM BOOKINGS WHERE CHECK_IN = '$today' AND STATUS = 'confirmed';");
$smarty->assign("check_in_today", $check_in_today);

$check_out_today = sqlite("QUERY_FETCH_ASSOC",
    "SELECT substr(DATE,1,4) AS DATE, ID, FIRST_NAME || ' ' || LAST_NAME AS NAME, CHECK_IN, CHECK_OUT FROM BOOKINGS WHERE CHECK_OUT = '$today' AND STATUS = 'confirmed';");
$smarty->assign("check_out_today", $check_out_today);

$recent_bookings = sqlite("QUERY_FETCH_ASSOC",
    "SELECT substr(DATE,1,4) AS DATE, ID, FIRST_NAME || ' ' || LAST_NAME AS NAME, CHECK_IN, CHECK_OUT FROM BOOKINGS WHERE STATUS = 'confirmed' ORDER BY ID DESC LIMIT 5;");
$smarty->assign("recent_bookings", $recent_bookings);

$templates = [
    "booking",
    "contact",
    "footer",
    "gallery",
    "head",
    "header",
    "index",
    "login",
    "navbar",
    "rooms",
    "services"
];

$templates_languages = [];

foreach ($languages as $value) {
    $templates_languages[] = $value . "_privacy";
    $templates_languages[] = $value . "_terms";
}

$templates = array_merge($templates, $templates_languages);

$smarty->assign("templates", $templates);

$html_lang = $default_language;
if ($html_lang == "pt_PT") {
    $html_lang = "pt-PT";
}
$smarty->clearAssign("html_lang");
$smarty->assign("html_lang", $html_lang);

$smarty->assign("domain", $domain);
$smarty->assign("http", $http);
$smarty->assign("seo_links", $seo_links);

function session_started()
{
    if (isset($_SESSION["SITE"]) && $_SESSION["SITE"] != "") {
        return true;
    } else {
        return false;
    }
}

function my_encode($token)
{
    /* 
    $uuid = sprintf(
        "%04x%04x-%04x-%04x-%04x-%04x%04x%04x",
        mt_rand(0, 0xffff),
        mt_rand(0, 0xffff),
        mt_rand(0, 0xffff),
        mt_rand(0, 0x0c2f) | 0x4000,
        mt_rand(0, 0x3fff) | 0x8000,
        mt_rand(0, 0x2aff),
        mt_rand(0, 0xffd3),
        mt_rand(0, 0xff4b)
    );
    */

    $data = random_bytes(16);
    assert(strlen($data) == 16);
    $data[6] = chr((ord($data[6]) & 0x0f) | 0x40);
    $data[8] = chr((ord($data[8]) & 0x3f) | 0x80);

    $uuid = vsprintf("%s%s-%s-%s-%s-%s%s%s", str_split(bin2hex($data), 4));

    $cipher_method = "AES-256-CTR";
    $enc_key = openssl_digest($uuid, "SHA256", true);

    if ((array) $token !== $token) {
        $iv = openssl_random_pseudo_bytes(
            openssl_cipher_iv_length($cipher_method)
        );
        $crypted_token =
            openssl_encrypt($token, $cipher_method, $enc_key, 0, $iv) .
            "::" .
            bin2hex($iv);
        $iv = base64_encode($iv);

        return ["uuid" => $uuid, "iv" => $iv, "crypted" => $crypted_token];
    } else {
        $array = [];
        foreach ($token as $token_x) {
            $iv = openssl_random_pseudo_bytes(
                openssl_cipher_iv_length($cipher_method)
            );
            $crypted_token =
                openssl_encrypt($token_x, $cipher_method, $enc_key, 0, $iv) .
                "::" .
                bin2hex($iv);

            array_push($array, [
                "uuid" => $uuid,
                "iv" => base64_encode($iv),
                "crypted" => $crypted_token,
            ]);
        }
        return $array;
    }
}

function my_decode($iv, $crypted = null, $uuid = null)
{
    $cipher_method = "AES-256-CTR";

    if ((array) $iv !== $iv) {
        list($crypted, $iv) = explode("::", $crypted);
        $enc_key = openssl_digest($uuid, "SHA256", true);
        $token = openssl_decrypt(
            $crypted,
            $cipher_method,
            $enc_key,
            0,
            hex2bin($iv)
        );

        return $token;
    } else {
        $array = [];
        foreach ($iv as $row => $innerArray) {
            $iv = $innerArray["iv"];
            $crypted = $innerArray["crypted"];
            $uuid = $innerArray["uuid"];

            list($crypted, $iv) = explode("::", $crypted);
            $enc_key = openssl_digest($uuid, "SHA256", true);
            $token = openssl_decrypt(
                $crypted,
                $cipher_method,
                $enc_key,
                0,
                hex2bin($iv)
            );

            array_push($array, ["decrypted_token" => $token]);
        }

        return $array;
    }
}

class CreditCard
{
    protected static $cards = [
        "visaelectron" => [
            "type" => "visaelectron",
            "pattern" => "/^4(026|17500|405|508|844|91[37])/",
            "length" => [16],
            "cvcLength" => [3],
            "luhn" => true,
        ],
        "maestro" => [
            "type" => "maestro",
            "pattern" => "/^(5(018|0[23]|[68])|6(39|7))/",
            "length" => [12, 13, 14, 15, 16, 17, 18, 19],
            "cvcLength" => [3],
            "luhn" => true,
        ],
        "forbrugsforeningen" => [
            "type" => "forbrugsforeningen",
            "pattern" => "/^600/",
            "length" => [16],
            "cvcLength" => [3],
            "luhn" => true,
        ],
        "dankort" => [
            "type" => "dankort",
            "pattern" => "/^5019/",
            "length" => [16],
            "cvcLength" => [3],
            "luhn" => true,
        ],

        "visa" => [
            "type" => "visa",
            "pattern" => "/^4/",
            "length" => [13, 16],
            "cvcLength" => [3],
            "luhn" => true,
        ],
        "mastercard" => [
            "type" => "mastercard",
            "pattern" => "/^(5[0-5]|2[2-7])/",
            "length" => [16],
            "cvcLength" => [3],
            "luhn" => true,
        ],
        "amex" => [
            "type" => "amex",
            "pattern" => "/^3[47]/",
            "format" => "/(\d{1,4})(\d{1,6})?(\d{1,5})?/",
            "length" => [15],
            "cvcLength" => [3, 4],
            "luhn" => true,
        ],
        "dinersclub" => [
            "type" => "dinersclub",
            "pattern" => "/^3[0689]/",
            "length" => [14],
            "cvcLength" => [3],
            "luhn" => true,
        ],
        "discover" => [
            "type" => "discover",
            "pattern" => "/^6([045]|22)/",
            "length" => [16],
            "cvcLength" => [3],
            "luhn" => true,
        ],
        "unionpay" => [
            "type" => "unionpay",
            "pattern" => "/^(62|88)/",
            "length" => [16, 17, 18, 19],
            "cvcLength" => [3],
            "luhn" => false,
        ],
        "jcb" => [
            "type" => "jcb",
            "pattern" => "/^35/",
            "length" => [16],
            "cvcLength" => [3],
            "luhn" => true,
        ]
    ];

    public static function validCreditCard($number, $type = null)
    {
        $ret = ["valid" => false, "number" => "", "type" => ""];
        $number = preg_replace("/[^0-9]/", "", $number);
        if (empty($type)) {
            $type = self::creditCardType($number);
        }
        if (
            array_key_exists($type, self::$cards) &&
            self::validCard($number, $type)
        ) {
            return ["valid" => true, "number" => $number, "type" => $type];
        }
        return $ret;
    }
    public static function validCvc($cvc, $type)
    {
        return ctype_digit($cvc) &&
            array_key_exists($type, self::$cards) &&
            self::validCvcLength($cvc, $type);
    }
    public static function validDate($year, $month)
    {
        $month = str_pad($month, 2, "0", STR_PAD_LEFT);
        if (!preg_match('/^20\d\d$/', $year)) {
            return false;
        }
        if (!preg_match('/^(0[1-9]|1[0-2])$/', $month)) {
            return false;
        }
        if ($year < date("Y") || ($year == date("Y") && $month < date("m"))) {
            return false;
        }
        return true;
    }
    protected static function creditCardType($number)
    {
        foreach (self::$cards as $type => $card) {
            if (preg_match($card["pattern"], $number)) {
                return $type;
            }
        }
        return "";
    }
    protected static function validCard($number, $type)
    {
        return self::validPattern($number, $type) &&
            self::validLength($number, $type) &&
            self::validLuhn($number, $type);
    }
    protected static function validPattern($number, $type)
    {
        return preg_match(self::$cards[$type]["pattern"], $number);
    }
    protected static function validLength($number, $type)
    {
        foreach (self::$cards[$type]["length"] as $length) {
            if (strlen($number) == $length) {
                return true;
            }
        }
        return false;
    }
    protected static function validCvcLength($cvc, $type)
    {
        foreach (self::$cards[$type]["cvcLength"] as $length) {
            if (strlen($cvc) == $length) {
                return true;
            }
        }
        return false;
    }
    protected static function validLuhn($number, $type)
    {
        if (!self::$cards[$type]["luhn"]) {
            return true;
        } else {
            return self::luhnCheck($number);
        }
    }
    protected static function luhnCheck($number)
    {
        $checksum = 0;
        for ($i = 2 - (strlen($number) % 2); $i <= strlen($number); $i += 2) {
            $checksum += (int) $number[$i - 1];
        }
        for ($i = (strlen($number) % 2) + 1; $i < strlen($number); $i += 2) {
            $digit = (int) $number[$i - 1] * 2;
            if ($digit < 10) {
                $checksum += $digit;
            } else {
                $checksum += $digit - 9;
            }
        }
        if ($checksum % 10 == 0) {
            return true;
        } else {
            return false;
        }
    }
}

function getUserIP()
{
    $ipaddress = "";
    if (isset($_SERVER["HTTP_CLIENT_IP"])) {
        $ipaddress = $_SERVER["HTTP_CLIENT_IP"];
    } elseif (isset($_SERVER["HTTP_X_FORWARDED_FOR"])) {
        $ipaddress = $_SERVER["HTTP_X_FORWARDED_FOR"];
    } elseif (isset($_SERVER["HTTP_X_FORWARDED"])) {
        $ipaddress = $_SERVER["HTTP_X_FORWARDED"];
    } elseif (isset($_SERVER["HTTP_X_CLUSTER_CLIENT_IP"])) {
        $ipaddress = $_SERVER["HTTP_X_CLUSTER_CLIENT_IP"];
    } elseif (isset($_SERVER["HTTP_FORWARDED_FOR"])) {
        $ipaddress = $_SERVER["HTTP_FORWARDED_FOR"];
    } elseif (isset($_SERVER["HTTP_FORWARDED"])) {
        $ipaddress = $_SERVER["HTTP_FORWARDED"];
    } elseif (isset($_SERVER["REMOTE_ADDR"])) {
        $ipaddress = $_SERVER["REMOTE_ADDR"];
    } else {
        $ipaddress = "UNKNOWN";
    }
    return $ipaddress;
}

$lgd_page = [
    "admin_calendar",
    "admin_bookings",
    "admin_rooms",
    "admin_services",
    "admin_gallery",
    "admin_templates",
    "cc",
    "admin_language",
    "admin_home",
    "admin_change_password"
];

$do_admin = [
    "json_calendar",
    "calendar_update",
    "json_bookings",
    "calendar_bookings",
    "admin_rooms",
    "save_admin_rooms",
    "admin_services",
    "save_admin_services",
    "admin_gallery",
    "save_admin_gallery",
    "upload_image",
    "admin_gallery_add_gallery",
    "admin_gallery_delete_image",
    "admin_gallery_add_image",
    "admin_room_add_room",
    "admin_room_delete_room",
    "admin_service_add_service",
    "admin_service_delete_service",
    "admin_save_template",
    "my_dencrypt",
    "add_year",
    "json_language",
    "save_language",
    "change_password"
];

function arrayToXML($array, SimpleXMLElement $xml, $child_name)
{
    foreach ($array as $k => $v) {
        if (is_array($v)) {
            is_int($k)
                ? arrayToXML($v, $xml->addChild($child_name), $v)
                : $this->arrayToXML(
                    $v,
                    $xml->addChild(strtolower($k)),
                    $child_name
                );
        } else {
            is_int($k)
                ? $xml->addChild($child_name, $v)
                : $xml->addChild(strtolower($k), $v);
        }
    }

    return $xml->asXML();
}

?>
