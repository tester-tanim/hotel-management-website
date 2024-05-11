<?php
   require('admin/inc/db_config.php');
   require('admin/inc/essentials.php');

   date_default_timezone_set("Asia/Dhaka");

   session_start();

   if (!(isset($_SESSION['login']) && $_SESSION['login'] == true)) {
      redirect('index.php');
   }

   if (isset($_POST['pay_now'])) {
      $ORDER_ID = 'ORD_' . $_SESSION['uId'] . random_int(11111, 9999999);
      /* PHP */
      $post_data = array();
      $post_data['store_id'] = STORE_ID;
      $post_data['store_passwd'] = STORE_PASSWORD;
      $post_data['total_amount'] = $_SESSION['room']['payment'];
      $post_data['currency'] = "BDT";
      $post_data['tran_id'] = $ORDER_ID;
      $post_data['success_url'] = SITE_URL . "pay_response.php";
      $post_data['fail_url'] = SITE_URL . "pay_response.php";
      $post_data['cancel_url'] = SITE_URL . "pay_response.php";
      # EMI INFO
      $post_data['emi_option'] = "1";
      $post_data['emi_max_inst_option'] = "9";
      $post_data['emi_selected_inst'] = "9";
      # CUSTOMER INFORMATION
      $post_data['cus_id'] = $_SESSION['uId'];
      $post_data['cus_email'] = "test@test.com";
      $post_data['cus_add1'] = "Dhaka";
      $post_data['cus_add2'] = "Dhaka";
      $post_data['cus_city'] = "Dhaka";
      $post_data['cus_state'] = "Dhaka";
      $post_data['cus_postcode'] = "1000";
      $post_data['cus_country'] = "Bangladesh";
      $post_data['cus_phone'] = "01711111111";
      $post_data['cus_fax'] = "01711111111";
      # SHIPMENT INFORMATION
      $post_data['ship_name'] = "testvaren5v3v";
      $post_data['ship_add1 '] = "Dhaka";
      $post_data['ship_add2'] = "Dhaka";
      $post_data['ship_city'] = "Dhaka";
      $post_data['ship_state'] = "Dhaka";
      $post_data['ship_postcode'] = "1000";
      $post_data['ship_country'] = "Bangladesh";
      # OPTIONAL PARAMETERS
      $post_data['value_a'] = "ref001";
      $post_data['value_b '] = "ref002";
      $post_data['value_c'] = "ref003";
      $post_data['value_d'] = "ref004";
      # CART PARAMETERS
      $post_data['cart'] = json_encode(array(
         array("product" => "DHK TO BRS AC A1", "amount" => "200.00"),
         array("product" => "DHK TO BRS AC A2", "amount" => "200.00"),
         array("product" => "DHK TO BRS AC A3", "amount" => "200.00"),
         array("product" => "DHK TO BRS AC A4", "amount" => "200.00")
      ));
      $post_data['product_amount'] = "100";
      $post_data['vat'] = "5";
      $post_data['discount_amount'] = "5";
      $post_data['convenience_fee'] = "3";

      $frm_data = filteration($_POST);

      $query1 = "INSERT INTO `booking_order`(`user_id`, `room_id`, `check_in`, `check_out`, `order_id`) VALUES (?,?,?,?,?)";

      insert($query1, [$_SESSION['uId'], $_SESSION['room']['id'], $frm_data['checkin'], $frm_data['checkout'], $ORDER_ID], 'iisss');

      $booking_id = mysqli_insert_id($con);

      $query2 = "INSERT INTO `booking_details`(`booking_id`, `room_name`, `price`, `total_pay`, `user_name`, `phonenum`, `address`) VALUES (?,?,?,?,?,?,?)";

      insert($query2, [$booking_id, $_SESSION['room']['name'], $_SESSION['room']['price'], $_SESSION['room']['payment'], $frm_data['name'], $frm_data['phonenum'], $frm_data['address']], 'issssss');

      # REQUEST SEND TO SSLCOMMERZ
      $direct_api_url = "https://sandbox.sslcommerz.com/gwprocess/v3/api.php";
      $handle = curl_init();
      curl_setopt($handle, CURLOPT_URL, $direct_api_url);
      curl_setopt($handle, CURLOPT_TIMEOUT, 30);
      curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 30);
      curl_setopt($handle, CURLOPT_POST, 1);
      curl_setopt($handle, CURLOPT_POSTFIELDS, $post_data);
      curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, FALSE); # KEEP IT FALSE IF YOU RUN FROM LOCAL PC
      $content = curl_exec($handle);
      $code = curl_getinfo($handle, CURLINFO_HTTP_CODE);
      if ($code == 200 && !(curl_errno($handle))) {
         curl_close($handle);
         $sslcommerzResponse = $content;
      } else {
         curl_close($handle);
         echo "FAILED TO CONNECT WITH SSLCOMMERZ API";
         exit;
      }
      # PARSE THE JSON RESPONSE
      $sslcz = json_decode($sslcommerzResponse, true);
      if (isset($sslcz['GatewayPageURL']) && $sslcz['GatewayPageURL'] != "") {
         # THERE ARE MANY WAYS TO REDIRECT - Javascript, Meta Tag or Php Header Redirect or Other
         # echo "<script>window.location.href = '". $sslcz['GatewayPageURL'] ."';</script>";
         echo "<meta http-equiv='refresh' content='0;url=" . $sslcz['GatewayPageURL'] . "'>";
         # header("Location: ". $sslcz['GatewayPageURL']);
         exit;
      } else {
         echo "JSON Data parsing error!";
      }
   }
?>
