-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 06, 2021 lúc 03:15 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ketquathi`
--

CREATE TABLE `ketquathi` (
  `id` int(11) NOT NULL,
  `monhoc_id` int(11) NOT NULL,
  `sinhvien_id` varchar(32) NOT NULL,
  `loaidiem` int(11) NOT NULL,
  `lanthi` int(11) NOT NULL,
  `diem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ketquathi`
--

INSERT INTO `ketquathi` (`id`, `monhoc_id`, `sinhvien_id`, `loaidiem`, `lanthi`, `diem`) VALUES
(1, 1, 'KTT04', 1, 1, 10),
(2, 2, 'KTT04', 1, 1, 10),
(3, 1, 'CNT01', 1, 1, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--

CREATE TABLE `khoa` (
  `id` int(11) NOT NULL,
  `namthanhlap` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `khoa`
--

INSERT INTO `khoa` (`id`, `namthanhlap`, `ten`) VALUES
(1, 2000, 'Khoa Công nghệ thông tin\r\n'),
(2, 2001, 'Khoa Kinh tế');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lophanhchinh`
--

CREATE TABLE `lophanhchinh` (
  `id` int(11) NOT NULL,
  `tenlop` varchar(255) NOT NULL,
  `namthanhlap` int(11) NOT NULL,
  `khoa_id` int(11) NOT NULL,
  `siso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `lophanhchinh`
--

INSERT INTO `lophanhchinh` (`id`, `tenlop`, `namthanhlap`, `khoa_id`, `siso`) VALUES
(1, 'CNT58DH', 2001, 1, 40),
(2, 'KTT58DH', 2002, 2, 40);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monhoc`
--

CREATE TABLE `monhoc` (
  `id` int(11) NOT NULL,
  `khoa_id` int(11) NOT NULL,
  `tenmon` varchar(255) NOT NULL,
  `sotinchi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `monhoc`
--

INSERT INTO `monhoc` (`id`, `khoa_id`, `tenmon`, `sotinchi`) VALUES
(1, 1, 'PTUD trên nền web', 4),
(2, 2, 'Kinh tế lượng', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `id` varchar(32) NOT NULL,
  `trangthai` int(11) NOT NULL,
  `lop_id` int(11) NOT NULL,
  `hovaten` varchar(255) NOT NULL,
  `ngaysinh` datetime NOT NULL,
  `mota` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sinhvien`
--

INSERT INTO `sinhvien` (`id`, `trangthai`, `lop_id`, `hovaten`, `ngaysinh`, `mota`) VALUES
('12345', 0, 2, 'Nguyễn Minh Thúy', '0199-08-19 00:00:00', 'ứdef'),
('74453', 0, 1, 'Ngô Xuân Khiêm', '1999-01-15 00:00:00', 'CNTT'),
('74458', 0, 1, 'sấ', '1999-08-19 00:00:00', '214124'),
('74538', 0, 1, 'Đào Thị Lành', '1999-08-19 00:00:00', '13213'),
('CNT01', 1, 1, 'Ngô Trung Kiên', '0000-00-00 00:00:00', 'Sinh viên khoa CNTT'),
('KTT04', 2, 2, 'Đặng Minh Duy', '2019-10-16 00:00:00', 'Sinh viên khoa kinh tế');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `matkhau` varchar(255) NOT NULL,
  `tendaydu` varchar(255) NOT NULL,
  `quyenhan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `matkhau`, `tendaydu`, `quyenhan`) VALUES
(1, 'kien', '1', 'Ngô Trung Kiên', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ketquathi`
--
ALTER TABLE `ketquathi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `monhoc_id` (`monhoc_id`),
  ADD KEY `sinhvien_id` (`sinhvien_id`);

--
-- Chỉ mục cho bảng `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lophanhchinh`
--
ALTER TABLE `lophanhchinh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `khoa_id` (`khoa_id`);

--
-- Chỉ mục cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `khoa_id` (`khoa_id`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lop_id` (`lop_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `ketquathi`
--
ALTER TABLE `ketquathi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `khoa`
--
ALTER TABLE `khoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `lophanhchinh`
--
ALTER TABLE `lophanhchinh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `ketquathi`
--
ALTER TABLE `ketquathi`
  ADD CONSTRAINT `ketquathi_ibfk_1` FOREIGN KEY (`monhoc_id`) REFERENCES `monhoc` (`id`),
  ADD CONSTRAINT `ketquathi_ibfk_2` FOREIGN KEY (`sinhvien_id`) REFERENCES `sinhvien` (`id`);

--
-- Các ràng buộc cho bảng `lophanhchinh`
--
ALTER TABLE `lophanhchinh`
  ADD CONSTRAINT `lophanhchinh_ibfk_1` FOREIGN KEY (`khoa_id`) REFERENCES `khoa` (`id`);

--
-- Các ràng buộc cho bảng `monhoc`
--
ALTER TABLE `monhoc`
  ADD CONSTRAINT `monhoc_ibfk_1` FOREIGN KEY (`khoa_id`) REFERENCES `khoa` (`id`);

--
-- Các ràng buộc cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`lop_id`) REFERENCES `lophanhchinh` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
