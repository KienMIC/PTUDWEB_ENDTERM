<?php
	session_start();
	if(!isset($_SESSION['username'])){
		header('location:signin.php');
	}
	include('connect.php');
	if(empty($_POST['submit'])){
		$sql = "SELECT lophanhchinh.id,tenlop,lophanhchinh.namthanhlap,siso,ten FROM lophanhchinh,khoa WHERE lophanhchinh.khoa_id = khoa.id";
		$stmt = $conn->prepare($sql);
		$query = $stmt->execute();
		$result = array();
		while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
			$result[] = $row;
		}
	}
	else{
		$timkiem = $_POST['timkiem'];
		$sql = "SELECT lophanhchinh.id,tenlop,lophanhchinh.namthanhlap,siso,ten FROM lophanhchinh,khoa WHERE lophanhchinh.khoa_id = khoa.id AND tenlop LIKE '%$timkiem%'";
		$stmt = $conn->prepare($sql);
		$query = $stmt->execute();
		$result = array();
		while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
			$result[] = $row;
		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>NGÔ TRUNG KIÊN - 74458</title>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-3.5.1.slim.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<header>QUẢN LÝ SINH VIÊN - ĐỀ 05</header>
	<content>
		<div class="container"> 
					<ul class="nav">
						<li class="nav-item">
							<a class="nav-link" href="index.php">Trang chủ</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="list.php">Danh sách lớp hành chính</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="cau1.PNG">Ảnh câu 1</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="signout.php">Đăng xuất</a>
						</li>
					</ul>
					<br>
					<form method="post">
						<label>TÌM KIẾM</label>
						<input type="text" name="timkiem" placeholder="Nhập tên lớp hành chính">
						<input type="submit" name="submit" value="TÌM KIẾM">
					</form>
					<br>
					<table class="table table-inverse">
						<thead>
							<tr>
								<th>Mã lớp hành chính</th>
								<th>Tên lớp hành chính</th>
								<th>Năm thành lập</th>
								<th>Khoa</th>
								<th>Sĩ số</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($result as $items):?>
							<tr>
								<td><?php echo $items['id'];?></td>
								<td><?php echo $items['tenlop'];?></td>
								<td><?php echo $items['namthanhlap'];?></td>
								<td><?php echo $items['ten'];?></td>
								<td><?php echo $items['siso'];?></td>
								<th><a href="add.php?lop_id=<?php echo $items['id'];?>">Thêm sinh viên</a></th>
							</tr>
						<?php endforeach?>
						</tbody>
					</table>
		</div>
		
	</content>
	<footer>Ngô Trung Kiên - 74458 - CNT58DH</footer>
</body>
</html>