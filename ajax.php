<?php
    header("Content-Type:application/json");
    if(isset($_POST["std"]))
    {
        $conn=mysqli_connect('localhost', 'root', '2minjaejustin');
        mysqli_select_db($conn, 'stockdata');

        $query="SELECT * FROM stockdata WHERE ".$_POST["std"]."=\"CJ\"";
        $res=mysqli_query($conn, $query);
        $arr=mysqli_fetch_assoc($res);

        echo json_encode($arr);
    }
?>
