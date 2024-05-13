
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
 
 call sp_AgregarCliente('Juan','Guerra','6534-8968','ciudad','cf');
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

CALL sp_AgregarCargo('Vendedor', 'Encargado del servicio de ventas');

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
				from Cargos;
	End $$
Delimiter ;

call sp_ListarCargos();

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
Create procedure sp_AgregarEmpleado(in nomEmp varchar(30), in apeEmp varchar(30), in sue decimal(10,2), in horEnt time, in horSal time, in cargId int, in encargId int)
	Begin
		insert into Empleados(nombreEmpleado, apellidoEmpleado, sueldo, horaEntrada, horaSalida, cargoId, encargadoId) values
			(nomEmp, apeEmp, sue, horEnt, horSal, cargId, encargId);
	End$$
Delimiter ;

CALL sp_AgregarEmpleado('Juan', 'Perez', 2500.00, '09:00:00', '17:00:00', 2, NULL);


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

call sp_ListarEmpleado();

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
Delimiter ;

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

CALL sp_AgregarFactura('2024-05-10', '15:30:00', 1, 1, 100.50);

-- Eliminar
Delimiter $$
create procedure sp_EliminarFactura(in facId int)
	begin
		delete from Facturas
			where facturaId = facId;
	End $$
Delimiter ;

call sp_EliminarFactura();

-- Listar
Delimiter $$
create procedure sp_ListarFactura()
	begin
		select F.facturaId, F.fecha, F.hora ,
        CONCAT("Id: ",C.clienteId, " | ",C.nombre, " " , C.apellido) As cliente ,
        CONCAT("Id: ",E.empleadoId, " | ",E.nombreEmpleado, " " , E.apellidoEmpleado) As empleado, F.total from Facturas F
        join Clientes C on F.clienteId =  C.clienteId
		join Empleados E on F.empleadoId = E.empleadoId;	
	End $$
Delimiter ;

call sp_ListarFactura();
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
create procedure sp_AgregarTicket(in desTic varchar(250), in cliId int, in facId int)
	Begin
		insert into TicketSoporte(descripcionTicket, estatus, clienteId, facturaId) values
			(desTic, 'Recien Creado', cliId, facId);
	End$$
Delimiter ;

call sp_AgregarTicket('Problema 2	','',1,1);

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
create procedure sp_ListarTicketSoporte()
	Begin
		Select TS.ticketSoporteId, TS.descripcionTicket , TS.estatus ,  
        CONCAT("Id: ",C.clienteId, " | ",C.nombre, " " , C.apellido) As cliente , TS.facturaId from TicketSoporte TS
        join Clientes C on TS.clienteId =  C.clienteId;
    End $$
Delimiter ;  

call sp_ListarTicketSoporte();

-- Editar
Delimiter $$
create procedure sp_EditarTicketSoporte(in tickId int,in desTick varchar(250), in est varchar(30), in cliId int, in facId int)
	Begin
		Update TicketSoporte
			set
				descripcionTicket = descTick,
                estatus = est,
                clienteId = cliId,
                facturaId = facId
					where ticketSoporteId = tickId;
	End $$
Delimiter ;


-- Buscar
Delimiter $$
create procedure sp_BuscarTicket(in tickId int)
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
create procedure sp_AgregarProducto(in nomProd varchar(50), in desProduc varchar(100), in canStock int, in preVUnit decimal(10,2), in preVMay decimal(10,2), in preComp decimal(10,2), in imgProd BLOB, in disId int, in categId int)
	Begin
		insert into TicketSoporte(nombreProducto, descripcionProducto, cantidadStock, precioVentaUnitario, precioVentaMayor, precioCompra, imagenProducto, distribuidorId, categoriaProductoId) values
			(nomProd, desProduc, canStock, preVUnit, preVMay, preComp, imgProd, imgProd, disId, categId);
	End$$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarProducto(in prodId int)
	begin 
		delete from Productos
			where productoId = prodId;
	End $$
Delimiter ;


-- Listar
Delimiter $$
create procedure sp_ListarProducto()
	begin
		select
			Productos.productoId,
			Productos.nombreProducto,
			Productos.descripcionProducto,
            Productos.cantidadStock,
            Productos.precioVentaUnitario,
            Productos.precioVentaMayor,
            Productos.precioCompra,
            Productos.imagenProducto,
            Productos.distribuidorId,
            Productos.categoriaProductoId
				from Productos;
	End $$
Delimiter ;

-- Editar
Delimiter $$
Create procedure sp_EditarProducto(in nomProd varchar(50), in desProduc varchar(100), in canStock int, in preVUnit decimal(10,2), in preVMay decimal(10,2), in preComp decimal(10,2), in imgProd BLOB, in disId int, in categId int)
	Begin
		Update Productos
			set
				nombreProducto = nomProd,
                descripcionProducto = desProduc,
                cantidadStock = cantStock,
                precioVenteUnitario = preVUnit,
                precioVentaMayor = preVMay,
                precioCompra = preComp, 
                imagenProducto = imgProd, 
                distribuidorId = disId,
				categoriaProductoId = categId
					where productoId = prodId;
	End $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarProducto(in prodId int)
	begin
		select
			Productos.productoId,
			Productos.nombreProducto,
			Productos.descripcionProducto,
            Productos.cantidadStock,
            Productos.precioVentaUnitario,
            Productos.precioVentaMayor,
            Productos.precioCompra,
            Productos.imagenProducto,
            Productos.distribuidorId,
            Productos.categoriaProductoId
					where productoId = prodId;
	End $$
delimiter ;


-- Compras
-- Agregar
Delimiter $$
create procedure sp_AgregarCompra(in fecCom date, in totCom decimal(10,2))
	Begin
		insert into Compras(fechaCompra, totalCompra) values
			(fecCom, totCom);
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
create procedure sp_ListarCompra()
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
create procedure sp_AgregarPromociones(in preProm decimal(10,2), in desProm varchar(100), in fecIni date, in fecFin date, in prodId int)
	Begin
		insert into Promociones(precioPromocion, descripcionPromocion, fechaInicio, fechaFinalizacion, productoId) values
			(nomProm, desProm, fecIni, fecFin, prodId);
	End$$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarPromocion(in promId int)
	begin 
		delete from Promocion
			where promocionId = promId;
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
				from Promocion;
	End $$
Delimiter ;

-- Editar
Delimiter $$
Create procedure sp_EditarPromocion(in preProm decimal(10,2), in desProm varchar(100), in fecIni date, in fecFin date, in prodId int)
	Begin
		Update Promocion
			set
				precioPromocion = preProm,
                descripcionPromocion = desProm,
                fechaInicio = fecIni,
                fechaFinalizacion = fecFin,
                productoId = prodId
					where promocionId = promId;
	End $$
Delimiter ;


-- Buscar
Delimiter $$
create procedure sp_BuscarPromocion(in promId int)
	begin
		select
			Promocion.promocionId,
			Promocion.precioPromocion,
			Promocion.descripcionPromocion,
            Promocion.fechaInicio,
            Promocion.fechaFinalizacion,
            Promocion.productoId
					where promocionId = promId;
	End $$
delimiter ;


-- DetalleCompras
-- Agregar

-- Eliminar
-- Listar
-- Editar
-- Buscar

-- DetalleFacturas
-- Agregar
Delimiter $$
create procedure sp_AgregarDetalleFac(in facId int, in prodId int)
	Begin
		insert into DetalleFacturas(facturaId, productoId) values
			(facId, prodId);
	End$$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarDetalleFac(in detFacId int)
	begin 
		delete from DetalleFacturas
			where detalleFacturaId = detFacId;
	End $$
Delimiter ;

-- Listar
Delimiter $$
create procedure sp_ListarDetalleFac()
	begin
		select
			DetalleFacturas.detalleFacturaId,
			DetalleCompras.facturaId,
			DetalleCompras.productoId,
            DetalleCompras.compraId
				from DetalleFacturas;
	End $$
Delimiter ;

-- Editar
Delimiter $$
Create procedure sp_EditarDetalleFac(in cantComp int, in prodId int, in compId int)
	Begin
		Update DetalleCompras
			set
				cantidadCompra = cantComp,
                productoId = prodId,
                compraId = compId
					where detalleCompraId = detCompId;
	End $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarDetalleFac(in detFacId int)
	begin
		select
			DetalleFacturas.detalleFacturaId,
			DetalleFacturas.facturaId,
			DetalleFacturas.productoId
					where detalleFacId = detFacId;
	End $$
delimiter ;


SET GLOBAL time_zone = '-6:00';