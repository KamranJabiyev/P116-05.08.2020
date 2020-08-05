create table Countries(
	Id int identity primary key,
	Name nvarchar(100) not null,
	Population int,
	Area decimal(10,2)
)

create table Cities(
	Id int identity primary key,
	Name nvarchar(100) not null,
	CountriesId int references Countries(Id)
)

create procedure usp_GetCityFromCountry @Country nvarchar(100)='Azerbaijan'
as
select c.Name 'City',cy.Name 'Country' from Cities c
join Countries cy
on c.CountriesId=cy.Id
where cy.Name=@Country

exec usp_GetCityFromCountry 'Turkey'

select Firstname,Grade from usv_GetStudentDetail


create function getStudentCount(@Grade int)
returns int
as
begin
	declare @Count int
	select @Count=Count(*) from Students where Grade>@Grade
	return @Count
end

select dbo.getStudentCount(90)



insert into Product values('elcek')

create trigger InsertUpdateProductShowList
on Product
after insert,update
as
begin
	select * from Product
end

create table CopyProduct(
	Id int,
	Name nvarchar(100)
)

create trigger CopyProductInInsert
on Product
after insert
as
begin
	declare @Id int
	declare @Name nvarchar(100)

	select @Id=ProductList.Id from inserted ProductList
	select @Name=ProductList.Name from inserted ProductList

	insert into CopyProduct values(@Id,@Name)
end

insert into Product values('ayaqqabi')

