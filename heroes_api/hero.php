<?php
	class Hero{
	  
		// database connection and table name
		private $conn;
		private $table_name = "heroes";
	  
		// object properties
		public $name;
		public $description;
		public $powers;
		public $rate;
	  
		// constructor with $conn as database connection
		public function __construct($conn){
			$this->conn = $conn;
		}
		
		// search app
		function search($keywords, $orderBy){
			$query = "SELECT * FROM " . $this->table_name . " WHERE name LIKE ? OR description LIKE ? OR powers LIKE ? ORDER BY ? DESC";
			$stmt = $this->conn->prepare($query);
			$keywords=htmlspecialchars(strip_tags($keywords));
			$keywords = "%{$keywords}%";
			$stmt->bindParam(1, $keywords);
			$stmt->bindParam(2, $keywords);
			$stmt->bindParam(3, $keywords);
			$stmt->bindParam(4, $orderBy);
			$stmt->execute();
			return $stmt;
		}
		
	}
?>