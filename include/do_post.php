<?php
require "./conf.php";
require "./functions.php";

date_default_timezone_set("$timezone");

$database = "$database_location";

$do = SQLite3::escapeString($_GET["do"]);

if (in_array($do, $do_admin) and $_SESSION["SITE"] != "true") {
    echo json_encode("do $NOT_ALLOWED");
    exit();
}

switch ($do) {
case "booking":
    unset($error);

    if (isset($_POST["double_bed"])) {
        $double_bed = SQLite3::escapeString($_POST["double_bed"]);
    } else {
        $double_bed = "false";
    }
    if (isset($_POST["canc_pol"])) {
        $cancel_policy = SQLite3::escapeString($_POST["canc_pol"]);
    } else {
        $cancel_policy = "off";
    }

    $check_in = SQLite3::escapeString($_POST["check_in"]);
    $check_out = SQLite3::escapeString($_POST["check_out"]);
    $room_type = SQLite3::escapeString($_POST["room_type"]);
    $first_name = SQLite3::escapeString($_POST["first_name"]);
    $last_name = SQLite3::escapeString($_POST["last_name"]);
    $phone = SQLite3::escapeString($_POST["phone"]);
    $email = SQLite3::escapeString($_POST["email"]);
    $comments = SQLite3::escapeString($_POST["comments"]);
    $cc_type = SQLite3::escapeString($_POST["cc_type"]);
    $cc_name = SQLite3::escapeString($_POST["cc_name"]);
    $cc_number = SQLite3::escapeString($_POST["cc_number"]);
    $cc_expire_m = SQLite3::escapeString($_POST["cc_expire_m"]);
    $cc_expire_y = SQLite3::escapeString($_POST["cc_expire_y"]);
    $cc_cvc = SQLite3::escapeString($_POST["cc_cvc"]);

    $ip = getUserIP();
    $date = date("Y-m-d H:i:s");
    $cc_expire = "$cc_expire_m/$cc_expire_y";

    foreach ($rooms as $key => $value) {
        if ($value["TYPE"] == $room_type) {
            $rt = $value["NAME"];
        }
    }

    try {
        if (empty($check_in)) {
            throw new Exception($INVALID_CHECKIN_DATE);
        }
        if (empty($check_out)) {
            throw new Exception($INVALID_CHECKOUT_DATE);
        }
        if (empty($room_type)) {
            throw new Exception($INVALID_NUMBER_GUESTS);
        }
        if (empty($first_name)) {
            throw new Exception($INVALID_NAME);
        }
        if (empty($last_name)) {
            throw new Exception($INVALID_SURNAME);
        }
        if (empty($phone)) {
            throw new Exception($INVALID_PHONE);
        }
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            throw new Exception($INVALID_INVALID_EMAIL);
        }
        if (empty($cc_type)) {
            throw new Exception($INVALID_CARD_TYPE);
        }
        if (empty($cc_name)) {
            throw new Exception($INVALID_CARDHOLDER_NAME);
        }
        if ($cancel_policy != "on") {
            throw new Exception($MANDATORY_CANCELLATION_POLICY);
        }
        if ($check_out <= $check_in) {
            throw new Exception(
                $INVALID_CHECKIN_DATE . " - " . $INVALID_CHECKOUT_DATE
            );
        }
        $card_cvc_t = CreditCard::validCvc($cc_cvc, $cc_type);
        if ($card_cvc_t !== true) {
            throw new Exception($INVALID_CARD_CVC);
        }
        $card_n_t = CreditCard::validDate($cc_expire_y, $cc_expire_m);
        if ($card_n_t !== true) {
            throw new Exception($INVALID_CARD_EXPIRATION_DATE);
        }
        $card = CreditCard::validCreditCard($cc_number, $cc_type);
        if ($card["valid"] !== true) {
            throw new Exception($INVALID_CARD_NUMBER);
        }

        $check_in_dif = date_create($check_in);
        $check_out_dif = date_create("$check_out");

        $check_out = date("Y-m-d", strtotime($check_out));
        $check_out_less = date(
            "Y-m-d",
            strtotime("-1 day", strtotime($check_out))
        );

        $check_in_dif = date_create($check_in);
        $check_out_dif = date_create("$check_out");
        $check_out_dif_less = date_create("$check_out_less");

        $n_days = $check_out_dif->diff($check_in_dif)->format("%a");
        $n_days_less = $check_out_dif_less
            ->diff($check_in_dif)
            ->format("%a");

        $check_in = date("Y-m-d", strtotime($check_in));
        $ano = date("Y");

        $available = sqlite(
            "QUERY_FETCH_ASSOC",
            "SELECT COUNT(*) AS count FROM CALENDAR WHERE DAY BETWEEN '$check_in' AND '$check_out_less' AND ROOM_TYPE = '$room_type' AND AVAILABILITY != 0  AND STATUS != 'closed';"
        );

        $available = $available["0"]["count"];

        if ($n_days != $available) {
            throw new Exception($NO_AVAILABILITY);
        }

        $total_price = sqlite(
            "QUERY_FETCH_ASSOC",
            "SELECT SUM(PRICE) AS total_price FROM CALENDAR WHERE DAY BETWEEN '$check_in' AND '$check_out_less' AND ROOM_TYPE = '$room_type' AND AVAILABILITY != 0  AND STATUS != 'closed';"
        );

        $total_price = $total_price["0"]["total_price"];
        $av_price = $total_price / $n_days;

        $enc = [$cc_number, $cc_expire, $cc_cvc];
        $enc = my_encode($enc);

        $uuid = $enc[0]["uuid"];
        $cc_number = $enc[0]["crypted"];
        $iv_number = $enc[0]["iv"];

        $cc_expire = $enc[1]["crypted"];
        $iv_expire = $enc[1]["iv"];

        $cc_cvc = $enc[2]["crypted"];
        $iv_cvc = $enc[2]["iv"];

        $values = [
            $first_name,
            $last_name,
            $phone,
            $email,
            $check_in,
            $check_out,
            $cc_name,
            $cc_number,
            $cc_expire,
            $cc_cvc,
            $iv_number,
            $iv_expire,
            $iv_cvc,
            $room_type,
            $double_bed,
            $ano,
            $comments,
            $new_booking_status,
            $date,
            $ip,
            $cancel_policy,
            $n_days,
            $av_price,
            $total_price
        ];

        $insert = sqlite(
            "INSERT",
            "INSERT INTO BOOKINGS (FIRST_NAME, LAST_NAME, PHONE, EMAIL, CHECK_IN, CHECK_OUT, CC_NAME, CC_NUMBER, CC_EXPIRE, CC_CVC, IV_NUMBER, IV_EXPIRE, IV_CVC, ROOM_TYPE, DOUBLE_BED, YEAR, COMMENTS, STATUS, DATE, IP, CANCEL_POLICY, N_DAYS, AV_PRICE, TOTAL_PRICE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);"
        );

        $update_arr = sqlite(
            "QUERY_FETCH_ASSOC",
            "SELECT ID FROM CALENDAR WHERE DAY BETWEEN '$check_in' AND '$check_out_less' AND ROOM_TYPE = '$room_type' AND AVAILABILITY != 0  AND STATUS != 'closed';"
        );

        foreach ($update_arr as $id) {
            $id = $id["ID"];
            $update = sqlite(
                "UPDATE",
                "UPDATE CALENDAR SET AVAILABILITY = AVAILABILITY -1 WHERE ID = '$id';"
            );
        }

        $voucher = sqlite(
            "QUERY_FETCH_ASSOC",
            "SELECT MAX(ID) AS ID FROM BOOKINGS;"
        );
                
        $id = $voucher["0"]["ID"];
        $voucher = $voucher["0"]["ID"] . "-" . date("Y");

        $av_price = $total_price / $n_days;

        $message_hotel = <<<HTML
<!DOCTYPE html>
<html lang="pt" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
  <head>
    <meta charset="utf8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="x-apple-disable-message-reformatting">
    <title>New Booking</title>
<!--    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
    
<!--[if mso]>
    <xml>
      <o:OfficeDocumentSettings>
      <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>

    <style>
      table{border-collapse: collapse;}td,th,div,p,a,h1,h2,h3,h4,h5,h6{font-family: "Segoe UI", sans-serif; mso-line-height-rule: exactly;}
    </style>
<![endif]-->

    <style>
      @media screen{img{max-width: 100%}td,th{box-sizing: border-box}u~div .wrapper{min-width: 100vw}a[x-apple-data-detectors]{color: inherit;text-decoration: none}.all-font-roboto{font-family: Roboto, -apple-system, "Segoe UI", sans-serif !important}.all-font-sans{font-family: -apple-system, "Segoe UI", sans-serif !important}}@media (max-width: 700px){.sm-inline-block{display: inline-block !important}.sm-hidden{display: none !important}.sm-leading-32{line-height: 32px !important}.sm-p-20{padding: 20px !important}.sm-py-12{padding-top: 12px !important;padding-bottom: 12px !important}.sm-text-center{text-align: center !important}.sm-text-xs{font-size: 12px !important}.sm-text-lg{font-size: 18px !important}.sm-w-1-4{width: 25% !important}.sm-w-3-4{width: 75% !important}.sm-w-full{width: 100% !important}}
    </style>
    <style>
      @media (max-width: 700px){.sm-dui17-b-t{border: solid #4299e1;border-width: 4px 0 0}}
    </style>
  </head>
  
  <body style="box-sizing: border-box; margin: 0; padding: 0; width: 100%; word-break: break-word; -webkit-font-smoothing: antialiased; background-color: #ffff;">
    <div style="display: none; line-height: 0; font-size: 0;"> $first_name $last_name </div>
    <table class="wrapper all-font-sans" width="100%" height="100%" cellpadding="0" cellspacing="0" role="presentation">
      <tr>
        <td align="center" style="padding: 24px;" width="100%">
          <table class="sm-w-full" width="700" cellpadding="0" cellspacing="0" role="presentation">
            <td align="left" class="sm-p-20 sm-dui17-b-t" style="border-radius: 2px; padding: 40px; position: relative; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, .1), 0 4px 6px -2px rgba(0, 0, 0, .05); vertical-align: top; z-index: 50;" bgcolor="#ffffff" valign="top">
              <table width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <tr>
                  <td width="80%">
                    <h1 class="sm-text-lg all-font-roboto" style="font-weight: 700; line-height: 100%; margin: 0; margin-bottom: 4px; font-size: 24px;">$MY_HOTEL</h1>
                    <br />
                    <p class="sm-text-xs" style="margin: 0; color: #007BFF; font-size: 18px;"> You Have Received A New Booking, Reference: $voucher</p>
                    <p class="sm-text-xs" style="margin: 4; color: #007BFF; font-size: 18px;"> You Can Consult The CC Info <a href="$http://$domain/?page=cc&id=$id&uuid=$uuid"> Here </a></p>
                  </td>
                </tr>
              </table>
              <div style="line-height: 32px;">&zwnj;</div>
              <table class="sm-leading-32" style="line-height: 28px; font-size: 18px;" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <tr>
                  <td class="sm-inline-block" style="color: #007BFF;" width="50%">Name</td>
                  <td class="sm-inline-block" style="font-weight: 700; text-align: right;" width="50%" align="right">$first_name $last_name </td>
                </tr>
                <tr>
                  <td class="sm-inline-block" style="color: #007BFF;" width="50%">Nights</td>
                  <td class="sm-inline-block" style="font-weight: 700; text-align: right;" width="50%" align="right">$n_days</td>
                </tr>
                <tr>
                  <td class="sm-w-1-4 sm-inline-block" style="color: #007BFF;" width="50%">Room</td>
                  <td class="sm-w-3-4 sm-inline-block" style="font-weight: 700; text-align: right;" width="50%" align="right">$rt</td>
                </tr>
              </table>
              <table width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <tr>
                  <td style="padding-top: 24px; padding-bottom: 24px;">
                    <div style="background-color: #edf2f7; height: 2px; line-height: 2px;">&zwnj;</div>
                  </td>
                </tr>
              </table>
              <table style="font-size: 18px;" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <tr>
                  <td class="sm-w-full sm-inline-block sm-text-center" width="40%">
                    <p class="all-font-roboto" style="margin: 0; margin-bottom: 4px; color: #a0aec0; font-size: 12px; text-transform: uppercase; letter-spacing: 1px;">Check-in</p>
                    <p class="all-font-roboto" style="font-weight: 700; margin: 0; color: #000000;">$check_in</p>
                  </td>
                  <td class="sm-w-full sm-inline-block sm-py-12" style="font-family: Menlo, Consolas, monospace; font-weight: 700; text-align: center; color: #007BFF; font-size: 18px; letter-spacing: -1px;" width="20%" align="center">&gt;&gt;&gt;</td>
                  <td class="sm-w-full sm-inline-block sm-text-center" style="text-align: right;" width="40%" align="right">
                    <p class="all-font-roboto" style="margin: 0; margin-bottom: 4px; color: #a0aec0; font-size: 12px; text-transform: uppercase; letter-spacing: 1px;">Check-out</p>
                    <p class="all-font-roboto" style="font-weight: 700; margin: 0; color: #000000;">$check_out</p>
                  </td>
                </tr>
              </table>
              <table width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <tr>
                  <td style="padding-top: 24px; padding-bottom: 24px;">
                    <div style="background-color: #edf2f7; height: 2px; line-height: 2px;">&zwnj;</div>
                  </td>
                </tr>
              </table>
              <table style="line-height: 28px; font-size: 18px;" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <tr>
                  <td style="color: #007BFF;" width="50%">Night Price (Average)</td>
                  <td style="font-weight: 700; text-align: right;" width="50%" align="right">$av_price €</td>
                </tr>
                <tr>
                  <td style="font-weight: 700; padding-top: 32px; color: #000000; font-size: 20px;" width="50%">Total</td>
                  <td style="font-weight: 700; padding-top: 32px; text-align: right; color: #007BFF; font-size: 20px;" width="50%" align="right">$total_price €</td>
                </tr>
              </table>
            </td>
      </tr>
    </table>
    </td>
    </tr>
    </table>
  </body>
</html>
HTML;

        $message_guest = <<<HTML
<!DOCTYPE html>
<html lang="pt" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
  <head>
    <meta charset="utf8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="x-apple-disable-message-reformatting">
    <title>Your Booking</title>
<!--    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
    
<!--[if mso]>
    <xml>
      <o:OfficeDocumentSettings>
      <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>

    <style>
      table{border-collapse: collapse;}td,th,div,p,a,h1,h2,h3,h4,h5,h6{font-family: "Segoe UI", sans-serif; mso-line-height-rule: exactly;}
    </style>
<![endif]-->

    <style>
      @media screen{img{max-width: 100%}td,th{box-sizing: border-box}u~div .wrapper{min-width: 100vw}a[x-apple-data-detectors]{color: inherit;text-decoration: none}.all-font-roboto{font-family: Roboto, -apple-system, "Segoe UI", sans-serif !important}.all-font-sans{font-family: -apple-system, "Segoe UI", sans-serif !important}}@media (max-width: 700px){.sm-inline-block{display: inline-block !important}.sm-hidden{display: none !important}.sm-leading-32{line-height: 32px !important}.sm-p-20{padding: 20px !important}.sm-py-12{padding-top: 12px !important;padding-bottom: 12px !important}.sm-text-center{text-align: center !important}.sm-text-xs{font-size: 12px !important}.sm-text-lg{font-size: 18px !important}.sm-w-1-4{width: 25% !important}.sm-w-3-4{width: 75% !important}.sm-w-full{width: 100% !important}}
    </style>
    <style>
      @media (max-width: 700px){.sm-dui17-b-t{border: solid #4299e1;border-width: 4px 0 0}}
    </style>
  </head>
  
  <body style="box-sizing: border-box; margin: 0; padding: 0; width: 100%; word-break: break-word; -webkit-font-smoothing: antialiased; background-color: #ffff;">
    <div style="display: none; line-height: 0; font-size: 0;">Hello, $first_name $last_name $THANK_YOU_PREFERENCE - $YOUR_BOOKING_CONFIRMED ✔</div>
    <table class="wrapper all-font-sans" width="100%" height="100%" cellpadding="0" cellspacing="0" role="presentation">
      <tr>
        <td align="center" style="padding: 24px;" width="100%">
          <table class="sm-w-full" width="700" cellpadding="0" cellspacing="0" role="presentation">
            <td align="left" class="sm-p-20 sm-dui17-b-t" style="border-radius: 2px; padding: 40px; position: relative; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, .1), 0 4px 6px -2px rgba(0, 0, 0, .05); vertical-align: top; z-index: 50;" bgcolor="#ffffff" valign="top">
              <table width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <tr>
                  <td width="80%">
                    <h1 class="sm-text-lg all-font-roboto" style="font-weight: 700; line-height: 100%; margin: 0; margin-bottom: 4px; font-size: 24px;">$MY_HOTEL</h1>
                    <br />
                    <p class="sm-text-xs" style="margin: 0; color: #007BFF; font-size: 18px;"> $YOUR_BOOKING_CONFIRMED, $REFERENCE: $voucher</p>
                  </td>
                </tr>
              </table>
              <div style="line-height: 32px;">&zwnj;</div>
              <table class="sm-leading-32" style="line-height: 28px; font-size: 18px;" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <tr>
                  <td class="sm-inline-block" style="color: #007BFF;" width="50%">$NAME</td>
                  <td class="sm-inline-block" style="font-weight: 700; text-align: right;" width="50%" align="right">$first_name $last_name </td>
                </tr>
                <tr>
                  <td class="sm-inline-block" style="color: #007BFF;" width="50%">$NIGHTS</td>
                  <td class="sm-inline-block" style="font-weight: 700; text-align: right;" width="50%" align="right">$n_days</td>
                </tr>
                <tr>
                  <td class="sm-w-1-4 sm-inline-block" style="color: #007BFF;" width="50%">$ROOM</td>
                  <td class="sm-w-3-4 sm-inline-block" style="font-weight: 700; text-align: right;" width="50%" align="right">$rt</td>
                </tr>
              </table>
              <table width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <tr>
                  <td style="padding-top: 24px; padding-bottom: 24px;">
                    <div style="background-color: #edf2f7; height: 2px; line-height: 2px;">&zwnj;</div>
                  </td>
                </tr>
              </table>
              <table style="font-size: 18px;" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <tr>
                  <td class="sm-w-full sm-inline-block sm-text-center" width="40%">
                    <p class="all-font-roboto" style="margin: 0; margin-bottom: 4px; color: #a0aec0; font-size: 12px; text-transform: uppercase; letter-spacing: 1px;">Check-in</p>
                    <p class="all-font-roboto" style="font-weight: 700; margin: 0; color: #000000;">$check_in</p>
                  </td>
                  <td class="sm-w-full sm-inline-block sm-py-12" style="font-family: Menlo, Consolas, monospace; font-weight: 700; text-align: center; color: #007BFF; font-size: 18px; letter-spacing: -1px;" width="20%" align="center">&gt;&gt;&gt;</td>
                  <td class="sm-w-full sm-inline-block sm-text-center" style="text-align: right;" width="40%" align="right">
                    <p class="all-font-roboto" style="margin: 0; margin-bottom: 4px; color: #a0aec0; font-size: 12px; text-transform: uppercase; letter-spacing: 1px;">Check-out</p>
                    <p class="all-font-roboto" style="font-weight: 700; margin: 0; color: #000000;">$check_out</p>
                  </td>
                </tr>
              </table>
              <table width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <tr>
                  <td style="padding-top: 24px; padding-bottom: 24px;">
                    <div style="background-color: #edf2f7; height: 2px; line-height: 2px;">&zwnj;</div>
                  </td>
                </tr>
              </table>
              <table style="line-height: 28px; font-size: 18px;" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <tr>
                  <td style="color: #007BFF;" width="50%">$NIGHT $PRICE_AVERAGE</td>
                  <td style="font-weight: 700; text-align: right;" width="50%" align="right">$av_price €</td>
                </tr>
                <tr>
                  <td style="font-weight: 700; padding-top: 32px; color: #000000; font-size: 20px;" width="50%">$TOTAL</td>
                  <td style="font-weight: 700; padding-top: 32px; text-align: right; color: #007BFF; font-size: 20px;" width="50%" align="right">$total_price €</td>
                </tr>
              </table>
            </td>
      </tr>
    </table>
    </td>
    </tr>
    </table>
  </body>
</html>
HTML;

        $headers = [
            "MIME-Version: 1.0",
            "Content-type: text/html; charset=utf-8",
            "From: Bookings <$booking_mail_from>",
            "Reply-To: Bookings <$booking_mail_from>",
            "X-Mailer: PHP/" . phpversion(),
            "Importance: high",
            "Return-Path: Bookings <$booking_mail_from>"                
        ];

        mail(
            $email,
            "$YOUR_BOOKING @ $MY_HOTEL ✔️",
            $message_guest,
            implode("\r\n", $headers)
        );
            
        mail(
            $booking_mail_from,
            "✔️ You Have Received a New Booking",
            $message_hotel,
            implode("\r\n", $headers)
        );

        $response =
            '{"response": "ok", "message": "' .
            $YOUR_RESERVATION_CONFIRMED .
            '"}';
                
        header("Content-Type: application/json; charset=utf-8");
        echo $response;
    } catch (Exception $e) {
        $message =
            '<div class="alert alert-danger alert-dismissible fade show" role="alert"><strong>Warning! </strong>' .
            $e->getMessage() .
            ' !<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"><span aria-hidden="true"></span></button></div>';
        $response =
            '{"response": "error", "message": "' . $e->getMessage() . '"}';

        header("Content-Type: application/json; charset=utf-8");
        echo $response;
    }

    break;
case "json_calendar":
    $currentDate = date("Y-m-d");

    $select_calendar = sqlite(
        "QUERY_FETCH_ASSOC",
        "SELECT ID, DAY, ROOM_TYPE, AVAILABILITY, PRICE, STATUS FROM CALENDAR WHERE DAY >= '$currentDate' ORDER BY DAY;"
    );

    header("Content-Type: application/json; charset=utf-8");
    echo json_encode(
        $select_calendar,
        JSON_PRETTY_PRINT,
        JSON_UNESCAPED_UNICODE
    );

    break;
case "calendar_update":
    $pk = $_POST["pk"];
    $NAME = $_POST["name"];
    $value = $_POST["value"];

    if (is_numeric($value) OR $value = 'closed' OR $value = 'open') {
        $update = sqlite(
            "UPDATE",
            "UPDATE CALENDAR SET $NAME = '$value' WHERE ID = '$pk';"
        );
    } else {
        header("HTTP/1.0 400 Bad Request", true, 400);
        echo $FIELD_REQUIRED;
    }

    break;
case "json_bookings":
    $select_bookings = sqlite(
        "QUERY_FETCH_ASSOC",
        "SELECT ID, FIRST_NAME || ' ' || LAST_NAME AS NAME, PHONE, EMAIL, CHECK_IN, CHECK_OUT, CC_NAME, CC_NUMBER, CC_CVC, CC_EXPIRE, ROOM_TYPE, DOUBLE_BED, COMMENTS, STATUS, DATE FROM BOOKINGS ORDER BY DATE DESC;"
    );

    header("Content-Type: application/json; charset=utf-8");
    echo json_encode(
        $select_bookings,
        JSON_PRETTY_PRINT,
        JSON_UNESCAPED_UNICODE
    );

    break;
case "calendar_bookings":
    $pk = $_POST["pk"];
    $NAME = $_POST["name"];
    $value = $_POST["value"];

    if (!empty($value)) {
        $update = sqlite(
            "UPDATE",
            "UPDATE BOOKINGS SET $NAME = '$value' WHERE ID = '$pk';"
        );
    } else {
        header("HTTP/1.0 400 Bad Request", true, 400);
        echo $FIELD_REQUIRED;
    }

    break;
case "my_dencrypt":
    $ID = $_GET["id"];
    $uuid = $_GET["uuid"];

    $select_cc = sqlite(
        "QUERY_FETCH_ASSOC",
        "SELECT substr(DATE,1,4) AS DATE, IV_NUMBER ,CC_NUMBER, IV_EXPIRE, CC_EXPIRE, IV_CVC, CC_CVC FROM BOOKINGS WHERE ID = '$ID';"
    );

    $booking_number = $ID . "-" . $select_cc[0]["DATE"];

    $array_NUMBER[0]["uuid"] = $uuid;
    $array_NUMBER[0]["iv"] = $select_cc[0]["IV_NUMBER"];
    $array_NUMBER[0]["crypted"] = $select_cc[0]["CC_NUMBER"];

    $array_EXPIRE[0]["uuid"] = $uuid;
    $array_EXPIRE[0]["iv"] = $select_cc[0]["IV_EXPIRE"];
    $array_EXPIRE[0]["crypted"] = $select_cc[0]["CC_EXPIRE"];

    $array_CVC[0]["uuid"] = $uuid;
    $array_CVC[0]["iv"] = $select_cc[0]["IV_CVC"];
    $array_CVC[0]["crypted"] = $select_cc[0]["CC_CVC"];

    $decode = my_decode(
        array_merge($array_NUMBER, $array_EXPIRE, $array_CVC)
    );
    $decode = array_column($decode, "decrypted_token");
    $cc_n = chunk_split($decode[0], 4, " ");
    unset($decode[0]);

    array_push($decode, $booking_number, $cc_n);

    echo json_encode($decode);

    break;
case "contact_us":
    $from = "Contact Form <$booking_mail_from>";
    $sendTo = "Contact Form <$booking_mail_from>";
    $subject = "✔️ New Message From Contact Form";

    $fields = [
        "name" => "Name",
        "email" => "Email",
        "message" => "Message"
    ];

    try {
        if (empty($_POST["name"])) {
            throw new Exception($INVALID_NAME);
        }
        if (empty($_POST["email"])) {
            throw new Exception($INVALID_EMAIL);
        }
        if (empty($_POST["message"])) {
            throw new Exception($INVALID_MESSAGE);
        }
        if (filter_var($_POST["email"], FILTER_VALIDATE_EMAIL) === false) {
            throw new Exception($INVALID_INVALID_EMAIL);
        }

        foreach ($_POST as $key => $value) {
            if (isset($fields[$key])) {
                $emailText .= "<p><strong style='color:blue;'>$fields[$key]:</strong> $value</p>";
            }
        }

        $message = "
    <html>
    <head>
        <title>New Message From Contact Form</title>
    </head>
    <body>
       $emailText 
    </body>
    </html>
    ";

        $headers = [
            "MIME-Version: 1.0",
            "Content-type: text/html; charset=utf-8",
            "From: " . $from,
            "Reply-To: " . $_POST["email"],
            "Return-Path: " . $from,
            "X-Mailer: PHP/" . phpversion(),
            "Importance: high"
        ];

        mail(
            "Contact Form <$booking_mail_from>",
            "✔️ New Message From Contact Form",
            $message,
            implode("\n", $headers)
        );

        $response =
            '{"response": "ok", "message": "' .
            $CONTACT_FORM_SUCCESS .
            '"}';
        header("Content-Type: application/json; charset=utf-8");
        echo $response;
    } catch (Exception $e) {
        $message = "<strong>" . $e->getMessage() . "</strong>";
        $response = '{"response": "error", "message": "' . $message . '"}';

        header("Content-Type: application/json; charset=utf-8");
        echo $response;
    }

    break;
case "login":
    try {
        if (empty($_POST["user_email"])) {
            throw new Exception("$USER_NAME_MANDATORY!");
        }
        if (empty($_POST["password"])) {
            throw new Exception("$PASSWORD_MANDATORY!");
        }

        $user = $_POST["user_email"];
        $password = $_POST["password"];

        if (isset($_POST) && $user != "" && $password != "") {
            $login = sqlite(
                "QUERY_FETCH_ASSOC",
                "SELECT ID, UUID, IV, CRYPTED, USER, USER_NAME, USER_TYPE, USER_EMAIL FROM USERS WHERE USER='$user';"
            );

            foreach ($login as $row) {
                $UUID = $row["UUID"];
                $IV = $row["IV"];
                $CRYPTED = $row["CRYPTED"];
                $ID = $row["ID"];
                $user = $row["USER"];

                $USER_NAME = $row["USER_NAME"];
                $USER_TYPE = $row["USER_TYPE"];
                $USER_EMAIL = $row["USER_EMAIL"];
            }

            $salted_hash = my_decode($IV, $CRYPTED, $UUID);

            if ($password == $salted_hash) {
                $_SESSION["ID"] = $ID;
                $_SESSION["SESSION_TIMEOUT"] = 3600; // 5 minutes
                $_SESSION["USER"] = $user;
                $_SESSION["USER_NAME"] = $USER_NAME;
                $_SESSION["USER_TYPE"] = $USER_TYPE;
                $_SESSION["USER_EMAIL"] = $USER_EMAIL;

                if (!empty($_POST["remember"])) {
                    setcookie(
                        "username",
                        $_POST["user_email"],
                        $cookie_params
                    );
                    setcookie(
                        "password",
                        $_POST["password"],
                        $cookie_params
                    );
                } else {
                    setcookie("username", "", $cookie_params);
                    setcookie("password", "", $cookie_params);
                }

                $message =
                    "<strong>" . "authentication_successful" . "</strong>";
                $response =
                    '{"response": "ok", "message": "' .
                    $_COOKIE["origin_ref"] .
                    '"}';

                header("Content-Type: application/json; charset=utf-8");
                echo $response;
            } else {
                throw new Exception($INCORRECT_USERNAME_PASSWORD);
            }
        }
    } catch (Exception $e) {
        $message = "<strong>" . $e->getMessage() . "</strong>";
        $response = '{"response": "error", "message": "' . $message . '"}';

        header("Content-Type: application/json; charset=utf-8");
        echo $response;
    }

    break;
case "logout":
    session_unset();
    session_destroy();
    header("Location:./../.");

    break;
case "admin_rooms":
    $select = $_POST["select"];

    $select = sqlite(
        "QUERY_FETCH_ASSOC",
        "SELECT * FROM ROOMS WHERE ID = '$select';"
    );

    header("Content-Type: application/json; charset=utf-8");
    echo json_encode($select[0]);

    break;
case "save_admin_rooms":
    $select = $_POST["select"];
    $column = $_POST["column"];
    $value = $_POST["value"];

    try {
        $select = sqlite(
            "UPDATE",
            "UPDATE ROOMS SET '$column' = '$value' WHERE ID = '$select';"
        );

        if ($select !== 1) {
            throw new Exception($UPDATE_FAIL);
        } else {
            echo json_encode(["success" => "true"]);
        }
    } catch (Exception $e) {
        echo json_encode(["error" => $e->getMessage()]);
    }

    break;
case "admin_services":
    $select = $_POST["select"];

    $select = sqlite(
        "QUERY_FETCH_ASSOC",
        "SELECT * FROM SERVICES WHERE ID = '$select';"
    );

    header("Content-Type: application/json; charset=utf-8");
    echo json_encode($select[0]);

    break;
case "save_admin_services":
    $select = $_POST["select"];
    $column = $_POST["column"];
    $value = $_POST["value"];

    try {
        $select = sqlite(
            "UPDATE",
            "UPDATE SERVICES SET '$column' = '$value' WHERE ID = '$select';"
        );

        if ($select !== 1) {
            throw new Exception("update fail");
        } else {
            echo json_encode(["success" => "true"]);
        }
    } catch (Exception $e) {
        echo json_encode(["error" => $e->getMessage()]);
    }

    break;
case "admin_gallery":
    $select = $_POST["select"];

    $select = sqlite(
        "QUERY_FETCH_ASSOC",
        "SELECT * FROM IMAGES WHERE ID = '$select';"
    );

    header("Content-Type: application/json; charset=utf-8");
    echo json_encode($select[0]);

    break;
case "save_admin_gallery":
    $select = $_POST["select"];
    $column = $_POST["column"];
    $value = $_POST["value"];

    try {
        $select = sqlite(
            "UPDATE",
            "UPDATE IMAGES SET '$column' = '$value' WHERE ID = '$select';"
        );

        if ($select !== 1) {
            throw new Exception($UPDATE_FAIL);
        } else {
            echo json_encode(["success" => "true"]);
        }
    } catch (Exception $e) {
        echo json_encode(["error" => $e->getMessage()]);
    }

    break;
case "upload_image":
    $valid_extensions = ["jpeg", "jpg", "png", "gif", "bmp"];
    $path = "../assets/img/";

    try {
        if (empty($_FILES["image"]["name"])) {
            throw new Exception($NO_SELECTED_IMAGE);
        }

        $img = $_FILES["image"]["name"];
        $tmp = $_FILES["image"]["tmp_name"];
        $ext = strtolower(pathinfo($img, PATHINFO_EXTENSION));
        $final_image = rand(1000, 1000000) . $img;

        if (!in_array($ext, $valid_extensions)) {
            throw new Exception($INVALID_IMAGE_FORMAT);
        }

        $path = $path . strtolower($final_image);

        if (move_uploaded_file($tmp, $path)) {
            echo "assets/img/$final_image";
            echo '<hr><img src="' . $path . '" class="img-fluid"><hr>';
        }
    } catch (Exception $e) {
        echo '<div id="err" class="alert alert-danger alert-dismissible fade show fw-bolder" role="alert">' .
            $e->getMessage() .
            ' <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
    }

    break;
case "admin_gallery_add_gallery":
    $galleryname = $_POST["galleryname"];
    $gallerytype = $_POST["gallerytype"];
    $gallerylanguage = $_POST["gallerylanguage"];

    foreach (range(1, 7) as $number) {
        $values = [
            "New Img Alt $number",
            "New Img Description $number",
            "https://fakeimg.pl/500x300/0d6efd/?font=lobster&text=New Img Src $number",
            $gallerytype,
            $gallerylanguage,
            $galleryname
        ];

        try {
            $insert = sqlite(
                "INSERT",
                "INSERT INTO IMAGES (IMG_ALT, DESCRIPTION, IMG_SRC, TYPE, LANGUAGE, GAL_NAME) VALUES (?,?,?,?,?,?);"
            );

            if ($insert > 0) {
                // echo json_encode(["success" => "true"]);
            } else {
                throw new Exception($ROW_INSERT_FAIL);
            }
        } catch (Exception $e) {
            echo json_encode(["error" => $e->getMessage()]);
        }
    }
    echo json_encode(["success" => "true"]);

    break;
case "admin_gallery_delete_image":
    $id = $_POST["id"];

    try {
        $delete = sqlite(
            "DELETE", 
            "DELETE FROM IMAGES WHERE ID = '$id';"
        );

        if ($delete == 1) {
            echo json_encode(["success" => "true"]);
        } else {
            throw new Exception($ROW_DELETE_FAIL);
        }
    } catch (Exception $e) {
        echo json_encode(["error" => $e->getMessage()]);
    }

    break;
case "admin_gallery_add_image":
    $imgdescription = $_POST["imgdescription"];
    $imgsrc = $_POST["imgsrc"];
    $imgalt = $_POST["imgalt"];
    $imgtype = $_POST["imgtype"];
    $imglanguage = $_POST["imglanguage"];

    $select = sqlite(
        "QUERY_FETCH_ASSOC",
        "SELECT GAL_NAME FROM IMAGES WHERE TYPE = '$imgtype' LIMIT 1;"
    );

    $galleryname = $select[0]["GAL_NAME"];

    $values = [
        $imgdescription,
        $imgsrc,
        $imgalt,
        $imgtype,
        $imglanguage,
        $galleryname
    ];

    try {
        $insert = sqlite(
            "INSERT",
            "INSERT INTO IMAGES (DESCRIPTION, IMG_SRC, IMG_ALT, TYPE, LANGUAGE, GAL_NAME) VALUES (?,?,?,?,?,?);"
        );

        if ($insert > 0) {
            echo json_encode(["success" => "true"]);
        } else {
            throw new Exception($ROW_INSERT_FAIL);
        }
    } catch (Exception $e) {
        echo json_encode(["error" => $e->getMessage()]);
    }

    break;
case "admin_room_add_room":
    $roomname = $_POST["roomname"];
    $roomdescription = $_POST["roomdescription"];
    $roomfacilities = $_POST["roomfacilities"];
    $roommaxlotation = $_POST["roommaxlotation"];
    $roomimgsrc = $_POST["roomimgsrc"];
    $roomimgalt = $_POST["roomimgalt"];
    $roomtype = $_POST["roomtype"];
    $roomlanguage = $_POST["roomlanguage"];

    $values = [
        $roomname,
        $roomdescription,
        $roomfacilities,
        $roommaxlotation,
        $roomimgsrc,
        $roomimgalt,
        $roomtype,
        $roomlanguage
    ];

    try {
        $insert = sqlite(
            "INSERT",
            "INSERT INTO ROOMS (NAME, DESCRIPTION, FACILITIES, MAX_LOTATION, IMG_SRC, IMG_ALT, TYPE, LANGUAGE) VALUES (?,?,?,?,?,?,?,?);"
        );

        if ($insert > 0) {
            echo json_encode(["success" => "true"]);
        } else {
            throw new Exception($ROW_INSERT_FAIL);
        }
    } catch (Exception $e) {
        echo json_encode(["error" => $e->getMessage()]);
    }

    break;
case "admin_room_delete_room":
    $id = $_POST["id"];

    try {
        $delete = sqlite(
            "DELETE", 
            "DELETE FROM ROOMS WHERE ID = '$id';"
        );

        if ($delete == 1) {
            echo json_encode(["success" => "true"]);
        } else {
            throw new Exception($ROW_DELETE_FAIL);
        }
    } catch (Exception $e) {
        echo json_encode(["error" => $e->getMessage()]);
    }

    break;
case "admin_service_add_service":
    $servicename = $_POST["servicename"];
    $servicedescription = $_POST["servicedescription"];
    $serviceimgsrc = $_POST["serviceimgsrc"];
    $serviceimgalt = $_POST["serviceimgalt"];
    $servicelanguage = $_POST["servicelanguage"];

    $values = [
        $servicename,
        $servicedescription,
        $serviceimgsrc,
        $serviceimgalt,
        $servicelanguage
    ];

    try {
        $insert = sqlite(
            "INSERT",
            "INSERT INTO SERVICES (NAME, DESCRIPTION, IMG_SRC, IMG_ALT, LANGUAGE) VALUES (?,?,?,?,?);"
        );

        if ($insert > 0) {
            echo json_encode(["success" => "true"]);
        } else {
            throw new Exception($ROW_INSERT_FAIL);
        }
    } catch (Exception $e) {
        echo json_encode(["error" => $e->getMessage()]);
    }

    break;
case "admin_service_delete_service":
    $id = $_POST["id"];

    try {
        $delete = sqlite(
            "DELETE",
            "DELETE FROM SERVICES WHERE ID = '$id';"
        );

        if ($delete == 1) {
            echo json_encode(["success" => "true"]);
        } else {
            throw new Exception($ROW_DELETE_FAIL);
        }
    } catch (Exception $e) {
        echo json_encode(["error" => $e->getMessage()]);
    }

    break;
case "admin_save_template":
    $template = $_POST["template"];
    $file = $_POST["file"];
    ($myfile = fopen("../assets/html/$file", "w")) or
    die("$UNABLE_OPEN_FILE!");
        $txt = $template;

        fwrite($myfile, $txt);
        fclose($myfile);
        $smarty->clearCache($file);

        break;
case "add_year":
    try {
        $add_year = $_POST["add_year"];
        $add_year_plus = intval($add_year) + 1;
        $start = new DateTime("$add_year-01-01");
        $end = new DateTime("$add_year_plus-01-01");
        $interval = DateInterval::createFromDateString("1 day");
        $period = new DatePeriod($start, $interval, $end);

        $year_exists = sqlite(
            "QUERY_FETCH_ASSOC",
            "SELECT COUNT(DAY) AS COUNT FROM CALENDAR WHERE DAY LIKE '%$add_year-%';"
        );

        if (empty($add_year)) {
            throw new Exception($INVALID_YEAR);
        }
        if ($year_exists[0]["COUNT"] != 0) {
            throw new Exception($YEAR_EXISTS);
        }

        foreach ($period as $day) {
            $day = $day->format("Y-m-d");

            foreach ($room_types as $type) {
                $type = $type["TYPE"];
                $add_year = $_POST["add_year"];
                ${"add_availability_$type"} =
                    $_POST["add_availability_$type"];
                ${"add_price_$type"} = $_POST["add_price_$type"];
                ${"add_lotation_$type"} = $_POST["add_lotation_$type"];
                ${"add_status_$type"} = $_POST["add_status_$type"];

                $values = [
                    "$day",
                    "$type",
                    ${"add_availability_" . $type},
                    ${"add_price_" . $type},
                    ${"add_lotation_" . $type},
                    ${"add_status_" . $type}
                ];

                $insert = sqlite(
                    "INSERT",
                    "INSERT INTO CALENDAR (DAY,ROOM_TYPE,AVAILABILITY,PRICE,MAX_LOTATION,STATUS) VALUES (?,?,?,?,?,?);"
                );

                if ($insert <= 0) {
                    throw new Exception($ROW_INSERT_FAIL);
                }
            }
        }

        echo json_encode(["success" => "true"]);
    } catch (Exception $e) {
        echo json_encode(["error" => $e->getMessage()]);
    }

    break;
case "bulkupdate_calendar":
    try {
        $room         = $_POST["room"];
        $from         = $_POST["from"];
        $to           = $_POST["to"];
        $availability = $_POST["availability"];
        $price        = $_POST["price"];
        $status       = $_POST["status"];         


        if (empty($room)) {
            throw new Exception('INVALID Room Type');
        }

        if (empty($from)) {
            throw new Exception('INVALID From Date');
        }
        
        if (empty($to)) {
            throw new Exception('INVALID To Date');
        }
        
        if (empty($availability)) {
            throw new Exception('INVALID Availability');
        }
        
        if (empty($price)) {
            throw new Exception('INVALID Price');
        }
        
        if (empty($status)) {
            throw new Exception('INVALID Status');
        }
        

        $update_calendar = sqlite(
            "UPDATE",
            "UPDATE CALENDAR SET AVAILABILITY = '$availability', PRICE = '$price', STATUS = '$status' WHERE DATE(DAY) BETWEEN '$from' AND '$to' AND ROOM_TYPE = '$room';"
        );

        if ($update_calendar == 0) {
            throw new Exception($UPDATE_FAIL);
        }

        echo json_encode(["success_bulk" => "true"]);
    } catch (Exception $e) {
        echo json_encode(["error_bulk" => $e->getMessage()]);
    }

    break;
case "booking_price":
    $check_in = SQLite3::escapeString($_POST["check_in"]);
    $check_out = SQLite3::escapeString($_POST["check_out"]);
    $room_type = SQLite3::escapeString($_POST["room_type"]);

    $check_in_dif = date_create($check_in);
    $check_out_dif = date_create("$check_out");

    $check_out = date("Y-m-d", strtotime($check_out));
    $check_out_less = date(
        "Y-m-d",
        strtotime("-1 day", strtotime($check_out))
    );

    $check_in_dif = date_create($check_in);
    $check_out_dif = date_create("$check_out");
    $check_out_dif_less = date_create("$check_out_less");

    $n_days = $check_out_dif->diff($check_in_dif)->format("%a");
    $n_days_less = $check_out_dif_less->diff($check_in_dif)->format("%a");

    $check_in = date("Y-m-d", strtotime($check_in));
    $ano = date("Y");
    $date = date("Y-m-d H:i:s");

    /*
    $available = sqlite("QUERY_FETCH_ASSOC",
    "SELECT COUNT(*) AS count FROM CALENDAR WHERE DAY BETWEEN '$check_in' AND '$check_out_less' AND ROOM_TYPE = '$room_type' AND AVAILABILITY != 0  AND STATUS != 'closed';");
    $available = $available["0"]["count"];
    */

    $total_price = sqlite(
        "QUERY_FETCH_ASSOC",
        "SELECT SUM(PRICE) AS total_price FROM CALENDAR WHERE DAY BETWEEN '$check_in' AND '$check_out_less' AND ROOM_TYPE = '$room_type' AND AVAILABILITY != 0  AND STATUS != 'closed';"
    );

    $total_price = $total_price["0"]["total_price"];

    $response = '{"response": "ok", "message": "' . "$total_price €" . '"}';

    header("Content-Type: application/json; charset=utf-8");
    echo $response;

    break;
case "json_language":
    $language = $_GET["language"];
    $select_language = sqlite(
        "QUERY_FETCH_ASSOC",
        "SELECT ID, NAME, TRANSLATION FROM 'LANGUAGE_$language';"
    );

    header("Content-Type: application/json; charset=utf-8");
    echo json_encode(
        $select_language,
        JSON_PRETTY_PRINT,
        JSON_UNESCAPED_UNICODE
    );

    break;
case "save_language":
    $pk = $_POST["pk"];
    $TRANSLATION = $_POST["name"];
    $value = $_POST["value"];
    $language = $_POST["language"];

    if (!empty($value)) {
        $update = sqlite(
            "UPDATE",
            "update 'LANGUAGE_$language' SET $TRANSLATION = '$value' WHERE ID = '$pk';"
        );
    } else {
        header("HTTP/1.0 400 Bad Request", true, 400);
        echo $FIELD_REQUIRED;
    }

    break;
case "change_password":
    try {
        $cur_password = $_POST["cur_password"];
        $new_password = $_POST["new_password"];
        $confirm_password = $_POST["confirm_password"];
        $user = $_SESSION["USER"];

        $user_array = sqlite(
            "QUERY_FETCH_ASSOC",
            "SELECT * FROM USERS WHERE USER = '$user';"
        );

        $UUID = $user_array[0]["UUID"];
        $IV = $user_array[0]["IV"];
        $CRYPTED = $user_array[0]["CRYPTED"];
        $cur_password_dec = my_decode($IV, $CRYPTED, $UUID);

        if ($cur_password_dec !== $cur_password) {
            throw new Exception($CURRENT_PASSWORD_INCORRECT);
        }
        if (empty($new_password)) {
            throw new Exception($EMPTY_PASSWORD_NOT_ALLOWED);
        }
        if ($new_password !== $confirm_password) {
            throw new Exception($NEW_PASSWORD_DOES_NOT_MATCH);
        }

        $new_enc = my_encode($new_password);
        $UUID = $new_enc["uuid"];
        $IV = $new_enc["iv"];
        $CRYPTED = $new_enc["crypted"];

        $update = sqlite(
            "UPDATE",
            "UPDATE USERS SET UUID = '$UUID', IV = '$IV', CRYPTED = '$CRYPTED' WHERE USER = '$user';"
        );

        if ($update !== 1) {
            throw new Exception($UPDATE_FAIL);
        }

        $response =
            '{"response": "ok", "message": "' .
            $PASSWORD_CHANGED_SUCCESSFULLY .
            '"}';

        header("Content-Type: application/json; charset=utf-8");
        echo $response;
    } catch (Exception $e) {
        $message = "<strong>" . $e->getMessage() . "</strong>";
        $response = '{"response": "error", "message": "' . $message . '"}';

        header("Content-Type: application/json; charset=utf-8");
        echo $response;
    }

    break;
case "change_language":
    try {
        $language = $_POST["language"];

        setcookie("LANGUAGE", $language, $cookie_params);

        $response =
            '{"response": "ok", "message": "' . "Language Changed" . '"}';

        header("Content-Type: application/json; charset=utf-8");
        echo $response;
    } catch (Exception $e) {
        $response =
            '{"response": "error", "message": "' . $e->getMessage() . '"}';

        header("Content-Type: application/json; charset=utf-8");
        echo $response;
    }

    break;
case "calendar_api":    
    if (!empty($_GET["key"])) {
        $key = $_GET["key"];
    } else {
        $key = '';
    }
        
    if (!empty($_GET["from"])) {
        $from = $_GET["from"];
    } else {
        $from = date('Y-m-d');
    }

    if (!empty($_GET["to"])) {
        $to = $_GET["to"];
    } else {
        $to = date('Y-m-d', strtotime('Dec 31'));
    }

    if (!empty($_GET["type"])) {
        $type = "'". $_GET["type"] ."'";
    } else {
        $type = "'". implode("', '", array_column($room_types, 'TYPE')) ."'"; 
    }

    if (!empty($_GET["available"])) {
        $available = "'". $_GET["available"] ."'";
    } else {
        $available = "'true', 'false'";
    }

    if (!empty($_GET["content"])) {
        $content = $_GET["content"];
    } else {
        $content = "xml";
    }

    if (!empty($_GET["lotation"])) {
        $lotation = $_GET["lotation"];
    } else {
        $lotation = "1";
    }
        
    if (in_array($key, $api_array)) {
        
        $select_calendar = sqlite(
            "QUERY_FETCH_ASSOC",
            "SELECT DAY, ROOM_TYPE, MAX_LOTATION, PRICE, CASE WHEN AVAILABILITY > 0 AND STATUS = 'open' THEN 'true' else 'false' END AS AVAILABLE FROM 'CALENDAR' WHERE DAY BETWEEN '$from' AND '$to' AND MAX_LOTATION >= '$lotation' AND AVAILABLE IN ($available) AND ROOM_TYPE IN ($type);"
        );
   
        if ($content == 'xml') {
            header("Content-Type: application/xml; charset=utf-8");
            echo arrayToXML($select_calendar, new SimpleXMLElement("<calendar/>"), "room");
        } else {
              header("Content-Type: application/json; charset=utf-8");
              echo json_encode(["room" => $select_calendar], JSON_PRETTY_PRINT, JSON_UNESCAPED_UNICODE);
        }
        
    } else {
        header("Content-Type: application/json; charset=utf-8");
        echo '{"response": "error", "message": "' . $NOT_ALLOWED . '"}';;
    }
        
    break;
default:
    echo $NOT_ALLOWED;
    exit();
}

?>
