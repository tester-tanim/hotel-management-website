<?php
//<!-- ==========connecting database========= -->
    $hname = 'localhost';
    $uname = 'root';
    $pass = '';
    $db = 'subhotel';

    $con = mysqli_connect($hname, $uname, $pass, $db);

    if(!$con){
        die("Cannot Connect to Database".mysqli_connect_error());
    }

    function filteration($data){
        foreach($data as $key => $value){
            $value = trim($value);
            $value = stripslashes($value);
            $value = strip_tags($value);
            $value = htmlspecialchars($value);
            $data[$key] = $value;
        }
        return $data;
    }

    function selectAll($table)
    {
        $con = $GLOBALS['con'];
        $res = mysqli_query($con,"SELECT * FROM $table");
        return $res;
    }

    function select($sql,$values,$datatypes)
    {
        $con = $GLOBALS['con'];
        if($stmt = mysqli_prepare($con,$sql))
        {
            mysqli_stmt_bind_param($stmt,$datatypes,...$values);  //(...$values)= splat variable for calling global variables
            if(mysqli_stmt_execute($stmt)){
                $res = mysqli_stmt_get_result($stmt);
                mysqli_stmt_close($stmt);
                return $res;
            }
            else{
                mysqli_stmt_close($stmt);
                die("Query cannot be executed - Select");    
            }
        }
        else{
            die("Query cannot be prepared - Select");
        }
    }

    function update($sql,$values,$datatypes)
    {
        $con = $GLOBALS['con'];
        if($stmt = mysqli_prepare($con,$sql))
        {
            mysqli_stmt_bind_param($stmt,$datatypes,...$values);  //(...$values)= splat variable for calling global variables
            if(mysqli_stmt_execute($stmt)){
                $res = mysqli_stmt_affected_rows($stmt);
                mysqli_stmt_close($stmt);
                return $res;
            }
            else{
                mysqli_stmt_close($stmt);
                die("Query cannot be executed - Update");    
            }
        }
        else{
            die("Query cannot be prepared - Update");
        }
    }


    function insert($sql,$values,$datatypes)
    {
        $con = $GLOBALS['con'];
        if($stmt = mysqli_prepare($con,$sql))
        {
            mysqli_stmt_bind_param($stmt,$datatypes,...$values);  //(...$values)= splat variable for calling global variables
            if(mysqli_stmt_execute($stmt)){
                $res = mysqli_stmt_affected_rows($stmt);
                mysqli_stmt_close($stmt);
                return $res;
            }
            else{
                mysqli_stmt_close($stmt);
                die("Query cannot be executed - Insert");    
            }
        }
        else{
            die("Query cannot be prepared - Insert");
        }
    }

    function delete($sql,$values,$datatypes)
    {
        $con = $GLOBALS['con'];
        if($stmt = mysqli_prepare($con,$sql))
        {
            mysqli_stmt_bind_param($stmt,$datatypes,...$values);  //(...$values)= splat variable for calling global variables
            if(mysqli_stmt_execute($stmt)){
                $res = mysqli_stmt_affected_rows($stmt);
                mysqli_stmt_close($stmt);
                return $res;
            }
            else{
                mysqli_stmt_close($stmt);
                die("Query cannot be executed - Delete");    
            }
        }
        else{
            die("Query cannot be prepared - Delete");
        }
    }

    // Adding Start----

    function get_employee_login_info($user_name,$user_pass)
    {
        $con = $GLOBALS['con'];

        $user_pass = md5($user_pass);

        $data = array();

       $sql = "SELECT * FROM `employees` WHERE `username` = '$user_name' AND `password` = '$user_pass' LIMIT 1 ";

       if ( ! $result = $con->query( $sql ) ) {
        return false;
    }

    $user_data = $result->fetch_assoc();

    if ( is_array( $user_data ) ) {
        $data["id"] = $user_data["id"];
        $data["role"] = $user_data["role"];
        return $data;
    }

    return false;

    }

    
?>