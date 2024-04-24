
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

-- Empleados

-- Facturas

-- TicketSporte

-- Distribuidores

-- CategoriaProductos

-- Productos

-- Compras
SET GLOBAL time_zone = '-6:00';