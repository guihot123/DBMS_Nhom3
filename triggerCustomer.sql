drop function IDmaxCustomer
create function IDmaxCustomer()
returns int
as
begin
	declare @maxid int
	select @maxid=max(ID_customer)
	from Customer
	if(@maxid is NULL)
		set @maxid = -1;
	return @maxid
end

drop trigger tg_addCustomer
create trigger tg_addCustomer on Customer
instead of insert
as
begin
	declare @id_customer varchar(50) , @customer_name varchar(50),@phone_number int , @VIP int
	select @id_customer=dbo.IDmaxCustomer()+1,@customer_name=Customer_Name,@phone_number=PhoneNumber,@VIP=(select rand(1))
	from inserted
	begin try
		insert into Customer (Customer_Name,PhoneNumber,ID_customer,VIP)
		values (@customer_name,@phone_number,@id_customer,@VIP)
		PRINT N'Thêm thành công'
	end try
	begin catch
		PRINT N'Yêu cầu thất bại'
	end catch
end

drop trigger tg_checkCustomer
go
create trigger tg_checkCustomer on Customer
instead of update
as
begin 
	declare @id_customer varchar(50) , @customer_name varchar(50),@phone_number int , @VIP int
	select @id_customer=ol.ID_customer,@customer_name=ne.Customer_Name,@phone_number=ne.PhoneNumber,@VIP=ne.VIP
	from inserted ne , deleted ol
	Update Customer
	set Customer_Name=@customer_name,ID_customer=@id_customer,PhoneNumber=@phone_number,vip=@VIP
	where Customer_Name=@customer_name
	PRINT N'Cập nhật thành công'
end

drop trigger tg_deleteCustomer
go
create trigger tg_deleteCustomer on Customer
after delete
as
begin 
	PRINT N'Xóa thành công'
end

go
create view View_Customer
as select*from Customer
	
