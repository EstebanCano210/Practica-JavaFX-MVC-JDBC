
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
Delimiter $$
create procedure sp_AgregarEmpleado(in nomEmp varchar(30), in apeEmp varchar(30), in suel decimal(10,2), in hrEnt time, in hrSal time, in cargId int, in encargId int)
	Begin
		insert into Empleados(nombreEmpleado, apellidoEmpleado, sueldo, horaEntrada, horaSalida, cargoId, encargadoId) values
			(nomEmp, apeEmp, suel, hrEnt, hrSal, cargId, encargId);
	End$$
Delimiter ;


-- Eliminar
Delimiter $$
create procedure sp_EliminarEmpleado(in empId int)
	begin 
		delete from Empleados
			where empleadoId = empId;
	End $$
Delimiter ;

-- Listar
Delimiter $$
create procedure sp_ListarEmpleado()
	begin
		select
			Empleados.nombreEmpleado,
			Empleados.apellidoEmpleado,
            Empleados.sueldo,
            Empleados.horaEntrada,
            Empleados.horaSalida,
            Empleados.cargoId,
            Empleados.encargadoId
				from Empleados;
	End $$
Delimiter ;

-- Editar
Delimiter $$
Create procedure sp_EditarEmpleados(in nomEmp varchar(30), in apeEmp varchar(30), in suel decimal(10,2), in hrEnt time, in hrSal time, in cargId int, in encargId int)
	Begin
		Update Empleados
			set
				nombreEmpleado = nomEmp,
                apellidoEmpleado = apeEmp,
                sueldo = suel,
                horaEntrada = hrEnt,
                horaSalida = hrSal,
                cargoId = cargId,
                encargadoId = encargId
					where empleadoId = empId;
	End $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarEmpleados(in empId int)
	begin
		select
			Empleados.empleadoId,
            Empleados.nombreEmpleado,
            Empleados.apellidoEmpleado,
            Empleados.sueldo,
            Empleados.horaEntrada,
            Empleados.horaSalida,
            Empleados.cargoId,
            Empleados.encargadoId
				from Empleados
					where empleadoId = empId;
	End $$
delimiter ;

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
Delimiter $$
create procedure sp_AgregarFactura(in fech date, in hr time, in cliId int, in empId int, in tot decimal(10,2))
	Begin
		insert into Facturas(fecha, hora, clienteId, empleadoId, total) values
			(fech, hr, cliId, empId, tot);
	End$$
Delimiter ;


-- Eliminar
Delimiter $$
create procedure sp_EliminarFactura(in facId int)
	begin 
		delete from Facturas
			where facturaId = facId;
	End $$
Delimiter ;

-- Listar
Delimiter $$
create procedure sp_ListarFactura()
	begin
		select
			Facturas.facturaId,
			Facturas.fecha,
			Facturas.hora,
            Facturas.clienteId,
            Facturas.empleadoId,
            Facturas.total
				from Facturas;
	End $$
Delimiter ;

-- Editar
Delimiter $$
Create procedure sp_EditarFactura(in fec date, in hr time, in cliId int, in empId int, in tot decimal(10,2))
	Begin
		Update Facturas
			set
				fecha = fec,
                hora = hr,
                clienteId = cliId,
                empleadoId = empId,
                total = tot
					where facturaId = facId;
	End $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarFactura(in facId int)
	begin
		select
			Facturas.facturaId,
			Facturas.fecha,
            Facturas.hora,
            Facturas.clienteId,
            Facturas.empleado,
            Facturas.total
				from Facturas
					where facturaId = facId;
	End $$
delimiter ;


-- TicketSporte
-- Agregar
Delimiter $$
create procedure sp_AgregarTicket(in desTick varchar(250), in estat varchar(30), in cliId int, in facId int)
	Begin
		insert into TicketSoporte(descripcionTicket, estatus, clienteId, facturaId) values
			(desTick, estat, cliId, facId);
	End$$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarTicket(in tickId int)
	begin 
		delete from TicketSoporte
			where ticketSoporteId = tickId;
	End $$
Delimiter ;


-- Listar
Delimiter $$
create procedure sp_ListarTicket()
	begin
		select
			TicketSoporte.ticketSoporteId,
			TicketSoporte.descripcionTicket,
			TicketSoporte.estatus,
            TicketSoporte.clienteId,
            TicketSoporte.facturaId
				from TicketSoporte;
	End $$
Delimiter ;

-- Editar
Delimiter $$
Create procedure sp_EditarTicketSoporte(in desTick varchar(250), in estat varchar(30), in clienteId int, in facId int)
	Begin
		Update TicketSoporte
			set
				descripcionTicket = descTick,
                estatus = estat,
                clienteId = cliId,
                facturaId = facId
					where ticketSoporteId = tickId;
	End $$
Delimiter ;


-- Buscar
Delimiter $$
create procedure sp_BuscarTicke(in tickId int)
	begin
		select
			TicketSoporte.ticketSoporteId,
            TicketSoporte.descripcionTicket,
            TicketSoporte.estatus,
            TicketSoporte.clienteId,
            TicketSoporte.facturaId
				from TicketSoporte
					where ticketSoporteId = tickId;
	End $$
delimiter ;


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
Delimiter $$
create procedure sp_AgregarCompra(in fecComp date, in totComp decimal(10,2))
	Begin
		insert into Compras(fechaCompra, totalCompra) values
			(fecComp, totComp);
	End$$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarCompra(in compId int)
	begin 
		delete from Compras
			where compraId = compId;
	End $$
Delimiter ;

-- Listar
Delimiter $$
create procedure sp_ListarCompras()
	begin
		select
			Compras.compraId,
			Compras.fechaCompra,
            Compras.totalCompra
				from Compras;
	End $$
Delimiter ;

-- Editar
Delimiter $$
Create procedure sp_EditarCompras(in fecComp date, in totComp decimal(10,2))
	Begin
		Update Compras
			set
				fechaCompra = fecCompra,
                totalCompra = totComp
					where compraId = compId;
	End $$
Delimiter ;


-- Buscar
Delimiter $$
create procedure sp_BuscarCompras(in compId int)
	begin
		select
			Compras.compraId,
            Compras.fechaCompra,
            Compras.totalCompra
				from Compras
					where compraId = compId;
	End $$
delimiter ;


-- Promociones
-- Agregar
Delimiter $$
create procedure sp_AgregarPromociones(in prePro decimal(10,2), in desPro varchar(100), in fecIni date, in fecFin date, in prodId int)
	Begin
		insert into Promociones(precioPromocion, descripcionPromocion, fechaInicio, fechaFinalizacion, productoId) values
			(nomPro, desPro, fecIni, fecFin, prodId);
	End$$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarPromocion(in proId int)
	begin 
		delete from Promocion
			where promocionId = proId;
	End $$
Delimiter ;


-- Listar
Delimiter $$
create procedure sp_ListarPromocion()
	begin
		select
			Promocion.promocionId,
			Promocion.precioPromocion,
			Promocion.descripcionPromocion,
            Promocion.fechaInicio,
            Promocion.fechaFinalizacion,
            Promocion.productoId
				from Promociones;
	End $$
Delimiter ;

-- Editar
Delimiter $$
Create procedure sp_EditarPromocion(in pro int, in prePro decimal(10,2), in desPro varchar(100), in fecIni date, in fecFin date, in prodId int)
	Begin
		Update Promociones
			set
				precioPromocion = prePro,
                descripcionPromocion = desPro,
                fechaInicio = fecIni,
                fechaFinalizacion = fecFin,
                productoId = prodId
					where promocionId = proId;
	End $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarPromocion(in proId int)
	begin
		select
			Promocion.promocionId,
			Promocion.precioPromocion,
			Promocion.descripcionPromocion,
            Promocion.fechaInicio,
            Promocion.fechaFinalizacion,
            Promocion.productoId
					where promocionId = proId;
	End $$
delimiter ;


-- DetalleFacturas
-- Agregar
Delimiter $$
create procedure sp_AgregarDetalleFactura(in facId int, in proId int)
	Begin
		insert into DetalleFacturas(facturaId, productoId) values
			(facId, proId);
	End$$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarDetalleFactura(in detFacId int)
	begin 
		delete from DetalleFacturas
			where detalleFacturaId = detFacId;
	End $$
Delimiter ;

-- Listar
Delimiter $$
create procedure sp_ListarDetalleFacturas()
	begin
		select
			DetalleFacturas.detalleFacturaId,
			DetalleCompras.facturaId,
			DetalleCompras.productoId
				from DetalleFacturas;
	End $$
Delimiter ;

-- Editar
Delimiter $$
Create procedure sp_EditarDetalleFactura(in detFacId int,in facId int, in proId int)
	Begin
		Update DetalleFacturas
			set
                facturaId = prodId,
                productoId = proId
					where detalleFacturaId = detFacId;
	End $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarDetalleFactura(in detFacId int)
	begin
		select
			DetalleFacturas.detalleFacturaId,
			DetalleFacturas.facturaId,
			DetalleFacturas.productoId
					where detalleFacId = detFacId;
	End $$
delimiter ;


SET GLOBAL time_zone = '-6:00';