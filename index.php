<?php
include('connect.php');
	session_start();
	if(!isset($_SESSION['username'])){
		header('location:signin.php');
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
	<div class="container">
	<header>QUẢN LÝ SINH VIÊN - ĐỀ 05</header>
	<br>
	<content>
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
			<p id="index">BÀI THI KẾT THÚC HỌC PHẦN "PHÁT TRIỂN ỨNG DỤNG TRÊN NỀN WEB"</p>
		
	</content>
	<footer>
		Người đăng nhập : <?php echo($_SESSION['username'])?><br>
		Họ và tên: Ngô Trung Kiên<br>
		Mã sinh viên: 74458<br>
		Lớp: CNT58DH
	</footer>
	</div>
</body>
</html>