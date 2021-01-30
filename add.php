<?php
	session_start();
	if(!isset($_SESSION['username'])){
		header('location:signin.php');
	}
	$lop_id = $_GET['lop_id'];
	include('connect.php');
	$sql = "SELECT * FROM sinhvien WHERE lop_id = $lop_id";

	$stmt = $conn->prepare($sql);
	$query = $stmt->execute();

	$result = array();

	while($row=$stmt->fetch(PDO::FETCH_ASSOC)){
		$result[] = $row;
	}

	if(!empty($_POST['submit'])){
		if(isset($_POST['masv'])&&isset($_POST['hovaten'])&&isset($_POST['ngaysinh'])&&isset($_POST['mota'])){
			$masv = $_POST['masv'];
			$hovaten = $_POST['hovaten'];
			$ngaysinh = $_POST['ngaysinh'];
			$mota = $_POST['mota'];
			$sql = "INSERT INTO sinhvien(id,lop_id,hovaten,ngaysinh,mota) VALUES('$masv','$lop_id','$hovaten','$ngaysinh','$mota')";
			var_dump($sql);
			$stmt = $conn->prepare($sql);
			$query = $stmt->execute();
			if($query){
				header("location:add.php?lop_id=$lop_id");
			}
			else{
				echo "Thêm dữ liệu thất bại";
			}
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
	<meta charset="utf-8">
</head>
<body>
	<header>FORM THÊM SINH VIÊN</header>
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

					<form method="post">
						<fieldset class="form-group">
							<label for="formGroupExampleInput">Mã sinh viên</label>
							<input type="text" class="form-control" name="masv" placeholder="Nhập mã sinh viên" required="">
						</fieldset>

						<fieldset class="form-group">
							<label for="formGroupExampleInput2">Họ và tên</label>
							<input type="text" class="form-control" name="hovaten" placeholder="Nhập họ và tên" required="">
						</fieldset>

						<fieldset class="form-group">
							<label for="formGroupExampleInput2">Ngày Sinh</label>
							<input type="date" class="form-control" name="ngaysinh" placeholder="Nhập ngày sinh" required="">
						</fieldset>

						<fieldset class="form-group">
							<label for="formGroupExampleInput2">Mô tả</label>
							<input type="text" class="form-control" name="mota" placeholder="Nhập mô tả" required="">
						</fieldset>
						
						<fieldset class="form-group">
							<input type="submit" class="form-control" name="submit" value="LƯU">
						</fieldset>
					</form>
		</div>
		<h2>DANH SÁCH SINH VIÊN LỚP </h2>
		<table class="table table-inverse">
						<thead>
							<tr>
								<th>TT</th>
								<th>Mã SV(ID)</th>
								<th>Họ và tên</th>
								<th>Ngày sinh</th>
								<th>Mô tả</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($result as $key => $items):?>
							<tr>
								<td><?php echo $key+1?></td>
								<td><?php echo $items['id'];?></td>
								<td><?php echo $items['hovaten'];?></td>
								<td><?php echo $items['ngaysinh'];?></td>
								<td><?php echo $items['mota'];?></td>
							</tr>
						<?php endforeach?>
						</tbody>
					</table>
		
	</content>
	<footer>Ngô Trung Kiên - 74458 - CNT58DH</footer>
</body>
</html>
