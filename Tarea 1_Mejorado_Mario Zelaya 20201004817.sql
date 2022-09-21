
create table aerolinea(
	cod_aerolinea int primary key not null,
	descuento int not null
)

create table cliente(
	identidad varchar(8) primary key not null,
	nombre varchar (60) not null,
	telefono int not null
)

create table hotel(
 cod_hotel int primary key not null,
 nombre varchar (60) not null,
 direccion varchar (60)
)


create table boleto(
	cod_boleto varchar(5) primary key not null,
	identidad_cliente varchar(8) not null,
	cod_aerolinea int not null,
	no_vuelo int not null,
	fecha date not null,
	destino varchar(60)not null
	
)

Alter table boleto add constraint fk_cliente_boleto 
foreign key (identidad_cliente) references cliente(identidad)

Alter table boleto add constraint fk_aero_boleto
foreign key (cod_aerolinea) references aerolinea(cod_aerolinea)


create table reserva(
 cod_hotel int  not null,
 identidad_cliente varchar(8)  not null,
 fechain date not null,
 fechaout date not null,
cantidad_personas int not null default 0
)


Alter table reserva add constraint fk_hotel_cliente
primary key (cod_hotel, identidad_cliente)

Alter table reserva add constraint fk_cod_hotel
foreign key (cod_hotel) references hotel(cod_hotel)

Alter table reserva add constraint fk_dni_cliente
foreign key (identidad_cliente) references cliente(identidad)


Alter table aerolinea add constraint ck_descuento
check(descuento>=10)

Alter table boleto add constraint ck_destino
check(destino in('México', 'Guatemala', 'Panamá'))




