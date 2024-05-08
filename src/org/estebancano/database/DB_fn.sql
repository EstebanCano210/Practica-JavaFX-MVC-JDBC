use SuperKinal;

Delimiter $$
Create procedure sp_ListarTicketSoporte2()
	Begin
		Select TS.ticketSoporteId, TSd.descripcionTicket , TS.estatus ,
        CONCAT("Id: ",C.clienteId, " | ",C.nombre, " " , C.apellido) As cliente from TicketSoporte TS
        join Clientes C on TS.cLienteId =  C.clienteId
        join Facturas F on TS.facturaId = F.facturaId;		
    End $$
Delimiter ;    