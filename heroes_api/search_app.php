<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
  
// include database and object files
include_once './core.php';
include_once './connection.php';
include_once './hero.php';
  
// instantiate database and app object
$database = new Database();
$conn = $database->connect();
  
// initialize object
$app = new App($conn);
  
// get keywords
$keywords=isset($_POST["searchText"]) ? $_POST["searchText"] : "";
$sortBy=isset($_POST["sortBy"]) ? $_POST["sortBy"] : "";
  
// query apps
$stmt = $app->search($keywords, $sortBy);
$num = $stmt->rowCount();
  
// check if more than 0 record found
if($num>0){
  
    $apps_arr=array();
    $apps_arr["heroes"]=array();
  
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        extract($row);
        $app_item=array(
            "name" => $name,
            "description" => $description,
            "powers" => $powers,
            "rate" => $rate,
        );
  
        array_push($apps_arr["heroes"], $app_item);
    }
  
    // set response code - 200 OK
    http_response_code(200);
    echo json_encode(  
		array("status" => "200", $apps_arr)
	);
}
  
else{
    // set response code - 404 Not found
    http_response_code(404);
    echo json_encode(
        array("status" => "404", $apps_arr)
    );
}
?>