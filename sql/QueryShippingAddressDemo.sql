select si.ThanhPho, si.Quan, si.Phuong, si.DiaChi, si.PhoneNum
from HE150277_HoangTienMinh_ShippingInfo si inner join HE150277_HoangTienMinh_Users u 
on si.UserId = u.UserId
where u.UserId = 1;