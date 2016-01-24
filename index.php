<?php
// Create connection
$connection = new mysqli(localhost, admin, admin, main);
// Check connection
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
} 
$sql = "SELECT * FROM main";
$result = $connection->query($sql);
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
         echo "Hello, " . $row["keyword"]. "<br> current build is build#";
    }
} else {
    echo "0 results";
}
$connection->close();
?>
