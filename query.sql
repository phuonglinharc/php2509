<?php

-- 1.  Liệt kê danh sách sản phẩm 

SELECT *
FROM products

-- 2. Liệt kê danh sách sản phẩm gồm có tên Tên sp,Đơn giá, Hình, sắp xếp đơn giá tăng dần

SELECT name, price, image
FROM products
ORDER BY price ASC

-- 3. Liệt kê danh sách khách hàng gồm có các thông tin sau: tên khách hàng, giới tính, địa chỉ, điện thoại, danh sách sẽ được sắp tăng dần theo tên khách hàng.

SELECT fullname, gender, address, phone
FROM users
ORDER BY fullname ASC

-- 4. Liệt kê danh sách sản phẩm gồm có: Tên sp, Mô tả, Đơn giá, và sắp xếp giảm theo cột đơn giá:

SELECT name, detail, price
FROM products
ORDER BY price DESC

-- 5. Liệt kê danh sách sản phẩm gồm có: Tên sp, Mô tả, Đơn giá. Chỉ liệt kê các Sản phẩm “iphone”.

SELECT name, detail, price
FROM products
WHERE name LIKE '%iPhone%'

-- 6. Liệt kê danh sách sản phẩm mà trong tên sp có từ ‘macbook’ và giá lớn hơn 25.000.000

SELECT *
FROM products
WHERE name LIKE '%macbook%'
    AND price > 25000000

-- 7. Liệt kê danh sách các Sản phẩm có đơn giá từ 500.000 VNĐ đến 1.000.000 VNĐ

SELECT *
FROM products
WHERE price BETWEEN 500000 AND 1000000

-- 8. Liệt kê các sản phẩm có đơn giá lớn hơn 35.000.000 VNĐ

SELECT *
FROM products
WHERE price > 35000000

-- 9. Liệt kê thông tin các sản phẩm có tên 'iPhone X 256GB’, 'iPhone 8 Plus 256GB', 'iPhone 7 Plus 32GB'.

SELECT *
FROM products
WHERE name IN ('iPhone X 256GB','iPhone 8 Plus 256GB','iPhone 7 Plus 32GB')

-- 10. Cho biết tên sản phẩm, Mô tả, đơn giá của 10 sản phẩm có đơn giá cao nhất.

SELECT name, detail, price
FROM products
ORDER BY price DESC
LIMIT 10

-- 11. Liệt kê danh sách sản phẩm gồm có tênsp, đơn giá, khuyến mãi.

SELECT name, price, promotion
FROM products

-- 12. Liệt kê danh sách khách hàng gồm có các thông tin sau: tên khách hàng, email, địa chỉ, điện thoại.

SELECT fullname, email, address, phone
FROM users

-- 13. Liệt kê danh sách loại sản phẩm gồm có các thông tin sau: tên loại, sắp tăng dần theo tên loại.

SELECT name
FROM categories
ORDER BY name ASC

-- 14. Liệt kê danh sách sản phẩm gồm có: tên sản phẩm, Mô tả, đơn giá. Có sắp giảm theo cột đơn giá và sắp tăng theo cột tên sp

SELECT name, detail, price
FROM products 
ORDER BY price DESC, name ASC

-- 15. Liệt kê danh sách các sản phẩm có tên bắt đầu là ‘Iphone’.

SELECT *
FROM products
WHERE name LIKE 'Iphone%'

-- 16. Liệt kê danh sách các sản phẩm có ký tự cuối cùng của sp là ’32GB’.

SELECT *
FROM products
WHERE name LIKE '%32GB'

-- 17. Liệt kê danh sách sản phẩm mà trong tên sản phẩm có từ 'iMac'.

SELECT *
FROM products
WHERE name LIKE '%iMac%'

-- 18. Liệt kê danh sách các sản phẩm có đơn giá từ 50.000.000 VNĐ đến 100.000.000 VNĐ

SELECT *
FROM products
WHERE price BETWEEN 50000000 AND 100000000

-- 19. Cho biết đơn giá trung bình của các sp hiện có trong cửa hàng

SELECT AVG(price)
FROM products

-- 20. Liệt kê danh sách sản phẩm gồm có tên Tên loại, Tên sp, Mô tả, Đơn giá và sắp xếp Tên loại theo chiều tăng dần.

SELECT categories.name AS tenloai, products.name AS tensp, detail, price
FROM categories, products
ORDER BY categories.name ASC

LIÊN KẾT BẢNG
-- 21. Truy vấn có nhóm và thống kê dữ liệu. Yêu cầu: Thực hiện các truy vấn sau:
-- 1. Thống kê tổng số sản phẩm theo Loại, gồm các thông tin: 
-- Tên Loại sản phẩm, tổng số sản phẩm, có sắp tăng theo tổng số sản phẩm, chỉ liệt kê những loại có tổng số SP lớn hơn hoặc bằng10 và tên loại là Phụ kiện và iMac

SELECT c.name AS tenloai, COUNT(p.id) AS tongSP
FROM categories AS c, products AS p
WHERE p.id_type = c.id 
    AND c.name IN ('iMac','Phụ kiện')
GROUP BY c.name
    HAVING COUNT(p.id) >= 10
ORDER BY COUNT(p.id) ASC

-- 2. Cho biết đơn giá trung bình của sản phẩm theo từng Loại sản phẩm.

SELECT c.name AS tenloai, ROUND(AVG(p.price)) AS avg_giasp
FROM categories AS c, products AS p
WHERE p.id_type = c.id 
GROUP BY c.name

-- 3. Cho biết sản phẩm có đơn giá thấp nhất theo từng loại sản phẩm (làm tương tự cho lớn nhất).

SELECT c.name AS tenloai, MIN(p.price) AS min_giasp
FROM categories AS c, products AS p
WHERE p.id_type = c.id
GROUP BY c.name

SELECT c.name AS tenloai, MAX(p.price) AS min_giasp
FROM categories AS c, products AS p
WHERE p.id_type = c.id
GROUP BY c.name

-- 4. Cho biết tổng giá tiền và tổng số sản phẩm của sản phẩm có đơn giá trong khoảng 50.000.000đ đến 100.000.000đ theo từng loại sản phẩm.

SELECT c.name AS tenloai, SUM(p.price) AS tongtien, COUNT(p.id) AS tongsp
FROM categories AS c, products AS p
WHERE p.id_type = c.id
    AND p.price BETWEEN 50000000 AND 100000000
GROUP BY c.name

-- 5. Thống kê hóa đơn gồm các thông tin sau: số hóa đơn, ngày đặt, tổng số sản phẩm, tổng thành tiền.

SELECT bd.id_bill as sohoadon, b.date_order AS ngaydat, SUM(bd.quantity) AS tongsp, b.total AS thanhtien 
FROM bills AS b, bill_detail AS bd
WHERE bd.id_bill = b.id
GROUP BY b.id

-- 6. Cho biết đơn giá trung bình sản phẩm thuộc loại sản phẩm là 'Macbook Pro Retina’.

SELECT c.name as tenloai, ROUND(AVG(p.price)) as avg_giasp
FROM products AS p, categories AS c
WHERE p.id_type = c.id
    AND c.name = 'Macbook Pro Retina'
GROUP BY c.name












?>