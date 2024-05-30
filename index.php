<?php
// opcache_invalidate(__FILE__, true); opcache_reset();

require "./include/conf.php";
require "./include/functions.php";

$database = "$database_location";

$sessionTimeout = 3600;

if (isset($_SESSION["LAST_ACTIVITY"])) {
    $lastActivity = $_SESSION["LAST_ACTIVITY"];
    $currentTime = time();
    $timeSinceLastActivity = $currentTime - $lastActivity;

    if ($timeSinceLastActivity > $sessionTimeout) {
        session_unset();
        session_destroy();
    } else {
        $_SESSION["LAST_ACTIVITY"] = $currentTime;
    }
} else {
    $_SESSION["LAST_ACTIVITY"] = time();
}

if (isset($_SESSION["ID"]) && $_SESSION["ID"] != "") {
    $ID = $_SESSION["ID"];
    $session = $database_type(
        "QUERY_FETCH_ASSOC",
        "SELECT USER, USER_NAME, USER_TYPE FROM USERS WHERE ID='$ID';"
    ); 

    $_SESSION["SITE"] = true;
    $_SESSION["USER"] = $session[0]["USER"];
    $_SESSION["USER_NAME"] = $session[0]["USER_NAME"];
    $_SESSION["USER_TYPE"] = $session[0]["USER_TYPE"];
}

if (isset($_GET["page"])) {
    $page = strtolower(str_replace("-", "_", $_GET["page"]));
} else {
    $page = "";
}

if (!isset($_SESSION["SITE"])) {
    $_SESSION["SITE"] = false;
}

if (in_array($page, $lgd_page)) {
    $actual_link =
        (empty($_SERVER["HTTPS"]) ? "http" : "https") .
        "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    setcookie("origin_ref", $actual_link, $cookie_params);
    if ($_SESSION["SITE"] != true) {
        header("Location:?page=login");
    }
}

if ($_SESSION["SITE"] === true) {
    if ($seo_links == true) {
        $nav_links = [
            "." => $smarty->getTemplateVars("HOME"),
            "Rooms" => $smarty->getTemplateVars("ROOMS"),
            "Services" => $smarty->getTemplateVars("SERVICES"),
            "Gallery" => $smarty->getTemplateVars("GALLERY"),
            "Booking" => $smarty->getTemplateVars("BOOKING"),
            "Contact" => $smarty->getTemplateVars("CONTACT")
        ];

        $adm_links = [
            "Admin-Home" => $smarty->getTemplateVars("ADM_HOME"),
            "Admin-Calendar" => $smarty->getTemplateVars("ADM_CALENDAR"),
            "Admin-Bookings" => $smarty->getTemplateVars("ADM_BOOKINGS"),
            "Admin-Rooms" => $smarty->getTemplateVars("ADM_ROOMS"),
            "Admin-Services" => $smarty->getTemplateVars("ADM_SERVICES"),
            "Admin-Gallery" => $smarty->getTemplateVars("ADM_GALLERY"),
            "Admin-Templates" => $smarty->getTemplateVars("ADM_TEMPLATES"),
            "Admin-Language" => $smarty->getTemplateVars("ADM_LANGUAGE"),
            "Admin-Change-Password" => $smarty->getTemplateVars("ADM_CHANGE_PASSWORD")
        ];
    } else {
        $nav_links = [
            "?page" => $smarty->getTemplateVars("HOME"),
            "?page=rooms" => $smarty->getTemplateVars("ROOMS"),
            "?page=services" => $smarty->getTemplateVars("SERVICES"),
            "?page=gallery" => $smarty->getTemplateVars("GALLERY"),
            "?page=booking" => $smarty->getTemplateVars("BOOKING"),
            "?page=contact" => $smarty->getTemplateVars("CONTACT")
        ];

        $adm_links = [
            "?page=admin_home" => $smarty->getTemplateVars("ADM_HOME"),
            "?page=admin_calendar" => $smarty->getTemplateVars("ADM_CALENDAR"),
            "?page=admin_bookings" => $smarty->getTemplateVars("ADM_BOOKINGS"),
            "?page=admin_rooms" => $smarty->getTemplateVars("ADM_ROOMS"),
            "?page=admin_services" => $smarty->getTemplateVars("ADM_SERVICES"),
            "?page=admin_gallery" => $smarty->getTemplateVars("ADM_GALLERY"),
            "?page=admin_templates" => $smarty->getTemplateVars("ADM_TEMPLATES"),
            "?page=admin_language" => $smarty->getTemplateVars("ADM_LANGUAGE"),
            "?page=admin_change_password" => $smarty->getTemplateVars("ADM_CHANGE_PASSWORD")
        ];
    }

    $smarty->clearAssign("NAV_LINKS");
    $smarty->assign("NAV_LINKS", $nav_links);

    $smarty->assign("ADM_LINKS", $adm_links);
} else {
    if ($seo_links == true) {
        $nav_links = [
            "." => $smarty->getTemplateVars("HOME"),
            "Rooms" => $smarty->getTemplateVars("ROOMS"),
            "Services" => $smarty->getTemplateVars("SERVICES"),
            "Gallery" => $smarty->getTemplateVars("GALLERY"),
            "Booking" => $smarty->getTemplateVars("BOOKING"),
            "Contact" => $smarty->getTemplateVars("CONTACT"),
            "Login" => $smarty->getTemplateVars("LOGIN")
        ];

        if ($login_link == false) {
            unset($nav_links["Login"]);
        }
    } else {
        $nav_links = [
            "?page" => $smarty->getTemplateVars("HOME"),
            "?page=rooms" => $smarty->getTemplateVars("ROOMS"),
            "?page=services" => $smarty->getTemplateVars("SERVICES"),
            "?page=gallery" => $smarty->getTemplateVars("GALLERY"),
            "?page=booking" => $smarty->getTemplateVars("BOOKING"),
            "?page=contact" => $smarty->getTemplateVars("CONTACT"),
            "?page=login" => $smarty->getTemplateVars("LOGIN")
        ];

        if ($login_link == false) {
            unset($nav_links["?page=login"]);
        }
    }

    $smarty->clearAssign("NAV_LINKS");
    $smarty->assign("NAV_LINKS", $nav_links);
}

switch ($page) {
case "rooms":
    $smarty->assign("page_name", $smarty->getTemplateVars("ROOMS"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_ROOMS_DESCRIPTION")
    );
    break;
case "services":
    $smarty->assign("page_name", $smarty->getTemplateVars("SERVICES"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_SERVICES_DESCRIPTION")
    );
    break;
case "gallery":
    $smarty->assign("page_name", $smarty->getTemplateVars("GALLERY"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_GALLERY_DESCRIPTION")
    );
    break;
case "contact":
    $smarty->assign("page_name", $smarty->getTemplateVars("CONTACT"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_CONTACT_DESCRIPTION")
    );
    break;
case "privacy":
    $smarty->assign("page_name", $smarty->getTemplateVars("PRIVACY"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_PRIVACY_DESCRIPTION")
    );
    break;
case "terms":
    $smarty->assign("page_name", $smarty->getTemplateVars("TERMS"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_TERMS_DESCRIPTION")
    );
    break;
case "booking":
    $smarty->assign("page_name", $smarty->getTemplateVars("BOOKING"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_BOOKING_DESCRIPTION")
    );
    break;
case "admin_calendar":
    $smarty->assign("page_name", $smarty->getTemplateVars("ADM_CALENDAR"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_ADM_CALENDAR_DESCRIPTION")
    );
    break;
case "admin_bookings":
    $smarty->assign("page_name", $smarty->getTemplateVars("ADM_BOOKINGS"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_ADM_BOOKINGS_DESCRIPTION")
    );
    break;
case "admin_templates":
    $smarty->assign("page_name", $smarty->getTemplateVars("ADM_TEMPLATES"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_ADM_TEMPLATES_DESCRIPTION")
    );
    break;
case "admin_rooms":
    $smarty->assign("page_name", $smarty->getTemplateVars("ADM_ROOMS"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_ADM_ROOMS_DESCRIPTION")
    );
    break;
case "admin_services":
    $smarty->assign("page_name", $smarty->getTemplateVars("ADM_SERVICES"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_ADM_SERVICES_DESCRIPTION")
    );
    break;
case "admin_gallery":
    $smarty->assign("page_name", $smarty->getTemplateVars("ADM_GALLERY"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_ADM_GALLERY_DESCRIPTION")
    );
    break;
case "admin_language":
    $smarty->assign("page_name", $smarty->getTemplateVars("ADM_LANGUAGE"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_ADM_LANGUAGE_DESCRIPTION")
    );
    break;
case "admin_home":
    $smarty->assign("page_name", $smarty->getTemplateVars("ADM_HOME"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_ADM_HOME_DESCRIPTION")
    );
    break;
case "admin_change_password":
    $smarty->assign(
        "page_name",
        $smarty->getTemplateVars("ADM_CHANGE_PASSWORD")
    );
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_ADM_CHANGE_PASSWORD_DESCRIPTION")
    );
    break;
case "login":
    $smarty->assign("page_name", $smarty->getTemplateVars("LOGIN"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_LOGIN_DESCRIPTION")
    );
    break;
case "cc":
    $smarty->assign("page_name", $smarty->getTemplateVars("ADM_CC"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_ADM_CC_DESCRIPTION")
    );
    break;
default:
    $smarty->assign("page_name", $smarty->getTemplateVars("HOME"));
    $smarty->assign(
        "PAGE_DESCRIPTION",
        $smarty->getTemplateVars("PAGE_INDEX_DESCRIPTION")
    );
}

echo '<!DOCTYPE html>
<html lang="' .
    $html_lang .
    '">
';

$smarty->display("head.tpl");

echo '<body>

';

$smarty->display("header.tpl");

$smarty->display("navbar.tpl");

if ($page == "") {
    $smarty->display("index.tpl");
} else {
    if ($page == "terms" or $page == "privacy") {
        $smarty->display($default_language . "_" . $page . ".tpl");
    } else {
        $smarty->display("$page.tpl");
    }
}

$smarty->display("footer.tpl");

echo '  </body>
</html>';

