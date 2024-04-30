
use SuperKinal;

-- Clientes
-- Agregar
delimiter $$
create procedure sp_AgregarCliente(nom varchar(30), ape varchar(30), tel varchar(15), dir varchar(200), n varchar(11))
begin
	insert into Clientes(nombre, apellido, telefono, direccion, nit) values
		(nom, ape, tel, dir, n);
end$$
delimiter ;
 
-- Listar
delimiter $$
create procedure sp_ListarClientes()
	begin
		select
			Clientes.clienteId,
            Clientes.nombre,
            Clientes.apellido,
            Clientes.telefono,
            Clientes.direccion,
            Clientes.nit
				from Clientes;
	end$$
delimiter ;
  
-- Eliminar 
delimiter $$
create procedure sp_EliminarCliente(in cliId int)
	begin
		delete from Clientes
			where clienteId = cliId;
	end$$
delimiter ;
 
-- Buscar
delimiter $$
create procedure sp_BuscarCliente(in cliId int)
	begin
		select
			Clientes.clienteId,
            Clientes.nombre,
            Clientes.apellido,
            Clientes.telefono,
            Clientes.direccion,
            Clientes.nit
				from Clientes
					where clienteId = cliId;
	end$$
delimiter ;
 
-- Editar

delimiter $$
create procedure sp_EditarCliente(in cliId int, in nom varchar(30), in ape varchar(30), in tel varchar(15), in dir varchar(200), in n varchar(11))
	begin	
		update Clientes
			set
				nombre = nom,
                apellido = ape,
                telefono = tel,
                direccion = dir,
                nit = n
					where clienteId = cliId;
	end$$
delimiter ;

-- Cargos
-- Agregar
Delimiter $$
create procedure sp_AgregarCargo(in nomCar varchar(30), in desCar varchar (100))
	Begin
		insert into Cargos(nombreCargo, descripcionCargo) values
			(nomCar, desCar);
	End$$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarCargo(in cargId int)
	begin 
		delete from Cargos
			where cargoId = cargId;
	End $$
Delimiter ;

-- Listar
Delimiter $$
create procedure sp_ListarCargos()
	begin
		select
			Cargos.cargoId,
			Cargos.nombreCargo,
            Cargos.descripcionCargo
				from Clientes;
	End $$
Delimiter ;

-- Editar
Delimiter $$
create procedure sp_EditarCargo(in nomCar varchar(30), in desCar varchar (100))
	begin
		update Cargos
			set
				nombreCargo = nomCar,
                descripcionCargo = desCar
					where cargoId = cargId;
	End $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarCargo(in cargId int)
	begin
		select
			Cargos.cargoId,
            Cargos.nombreCargo,
            Cargos.descripcionCargo
				from Cargos
					where cargoId = cargId;
	End $$
delimiter ;

-- Empleados
-- Agregar
-- Eliminar
-- Listar
-- Editar
-- Buscar
-- Encargado
DELIMITER $$
CREATE PROCEDURE sp_AsignarEncargado(in empId int, in encId int)
	BEGIN 
		UPDATE Empleados
			SET
				encargadoId = encId;
	END$$
DELIMITER ;

-- Facturas
-- Agregar
-- Eliminar
-- Listar
-- Editar
-- Buscar

-- TicketSporte
-- Agregar
-- Eliminar
-- Listar
-- Editar
-- Buscar

-- Distribuidores
-- Agregar
Delimiter $$
create procedure sp_AgregarDistribuidor(in nombDis varchar(30), in dirDis varchar (200), in nitDis varchar(15), in telDis varchar(15), in we varchar(50))
	Begin
		insert into Distribuidores(nombreDistribuidor, direccionDistribuidor, nitDistribuidor, telefonoDistribuidor, web) values
			(nombDis, dirDis, nitDis, telDis, we);
	End$$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarDistribuidores(in disId int)
	begin 
		delete from Distribuidores
			where distribuidorId = disId;
	End $$
Delimiter ;

-- Listar
Delimiter $$
create procedure sp_ListarDistribuidor()
	begin
		select
			Distribuidores.distribuidorId,
			Distribuidores.nombreDistribuidor,
			Distribuidores.direccionDistribuidor,
            Distribuidores.nitDistribuidor,
            Distribuidores.telefonoDistribuidor, 
            Distribuidores.web
				from Distribuidores;
	End $$
Delimiter ;
-- Editar
Delimiter $$
Create procedure sp_EditarDistribuidores(in nomDis varchar(30), in dirDis varchar (200), in nitDis varchar(15), in telDis varchar(15), in we varchar(50))
	Begin
		Update Distribuidores
			set
                nombreDistribuidor = nomDis,
                nitDistribuidor = nitDis,
                telefonoDistribuidor = telDis,
                web = we
					where distribuidorId = disId;
	End $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarDistribuidores(in disId int)
	begin
		select
			Distribuidores.distribuidorId,
			Distribuidores.nombreDistribuidor,
            Distribuidores.direccionDistribuidor,
            Distribuidores.nitDistribuidor,
            Distribuidores.telefonoDistribuidor,
            Distribuidores.web
				from Distribuidores
					where distribuidorId = disId;
	End $$
delimiter ;


-- CategoriaProductos
-- Agregar
Delimiter $$
create procedure sp_AgregarCategoriaProducto(in nomCateg varchar(30), in descripCateg varchar (100))
	Begin
		insert into CategoriaProductos(nombreCategoria, descripcioCategoria) values
			(nomCateg, descripCateg);
	End$$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarCategoriaProducto(in categId int)
	begin 
		delete from CategoriaProductos
			where categoriaProductosId = categId;
	End $$
Delimiter ;

-- Listar
Delimiter $$
create procedure sp_ListarCategoriaProducto()
	begin
		select
			CategoriaProductos.categoriaProductosId,
			CategoriaProductos.nombreCategoria,
            CategoriaProductos.descripcionCategoria
				from CategoriaProductos;
	End $$
Delimiter ;
-- Editar
Delimiter $$
Create procedure sp_EditarCategoriaProducto(in nomCateg varchar(30), in descripCateg varchar (100))
	Begin
		Update CategoriaProductos
			set
				nombreCategoria = nomCateg,
                descripcionCateg = descripCateg
					where categoriaProductosId = categId;
	End $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarCategoriaProducto(in categId int)
	begin
		select
			CategoriaProductos.categoriaProductosId,
            CategoriaProductos.nombreCategoria,
            CategoriaProductos.descripcionCategoria
				from CategoriaProductos
					where categoriaProductosId = categId;
	End $$
delimiter ;


-- Productos
-- Agregar
-- Eliminar
-- Listar
-- Editar
-- Buscar

-- Compras
-- Agregar
-- Eliminar
-- Listar
-- Editar
-- Buscar

-- Promociones
-- Agregar
-- Eliminar
-- Listar
-- Editar
-- Buscar

-- DetalleCompras
-- Agregar
-- Eliminar
-- Listar
-- Editar
-- Buscar

-- DetalleFacturas
-- Agregar
-- Eliminar
-- Listar
-- Editar
-- Buscar

SET GLOBAL time_zone = '-6:00';