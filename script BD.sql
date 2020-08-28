
create database multibodegas;
use multibodegas;

create table marca(
id_marca int primary key auto_increment,
nombre varchar(128) not null,
estatus varchar(1) not null
)engine=innodb;

insert into marca values(0,"Asturias","A");
insert into marca values(0,"H.H","A");
insert into marca values(0,"LAB","A");


create table linea(
id_linea int primary key auto_increment,
nombre varchar(128) not null,
estatus varchar(1) not null
)engine=innodb;

insert into linea values(0,"Tres","A");
insert into linea values(0,"Uno","A");
insert into linea values(0,"Seis","A");

create table producto(
id_producto int auto_increment,
id_linea int not null,
id_marca int not null,
nombre_producto varchar(128) not null,
precio double not null,
costo double not null,
foreign key(id_linea) references
linea(id_linea),
foreign key(id_marca) references
marca(id_marca),
primary key(id_producto,id_linea,id_marca)
)engine=Innodb;

insert into producto values(0,1,1,"Correa",20.00,15.00);
insert into producto values(0,2,1,"Pelota",10.00,7.50);
insert into producto values(0,1,3,"Manta",20.00,15.00);

create table bodega(
id_bodega int primary key auto_increment,
nombre varchar(128) not null,
direccion varchar(128) not null,
telefono varchar(128) not null
)engine=Innodb;

insert into bodega values(0,"bodega 1","zona 6","23445383");
insert into bodega values(0,"bodega 2","zona 1","23422383");
insert into bodega values(0,"bodega 3","zona 4","22344383");


create table inventario(
id_inventario int  auto_increment,
id_producto int not null,
id_bodega int not null,
existencia int not null,
foreign key (id_producto) references
producto(id_producto),
foreign key (id_bodega) references
bodega(id_bodega),
primary key(id_inventario,id_bodega)
)engine=Innodb;

insert into inventario values(0,1,1,20);
insert into inventario values(0,2,3,29);
insert into inventario values(0,1,3,80);

create table proveedor(
nit_proveedor varchar(128) primary key,
nombre varchar(128) not null,
telefono varchar(128) not null,
direccion varchar(128) not null
)engine=Innodb;

insert into proveedor values("111-111","Listo","2822211","zona 10");
insert into proveedor values("555-555","Buen amigo","29983211","zona 1");
insert into proveedor values("111-333","KML","28229292211","zona 5");

create table cliente(
nit_cliente varchar(128) primary key,
nombre varchar(128) not null,
telefono varchar(128) not null,
direccion varchar(128) not null
)engine=Innodb;

insert into cliente values("111-222","Ashly Barrios","28221211","zona 10");
insert into cliente values("333-111","Byron Torres","282221291","zona 2");
insert into cliente values("111-111","Milsa Ramirez","2822211","zona 10");

create table compra(
id_compra int primary key auto_increment,
nit_proveedor varchar(128) not null,
id_bodega int not null,
cantidad int not null,
total double not null,
fecha date not null,
foreign key (id_bodega) references
bodega(id_bodega),
foreign key (nit_proveedor) references
proveedor(nit_proveedor)
)engine=Innodb;



create table venta(
id_venta int primary key auto_increment,
nit_cliente varchar(128) not null,
id_bodega int not null,
cantidad int not null,
total double not null,
fecha date not null,
foreign key (id_bodega) references
bodega(id_bodega),
foreign key (nit_cliente) references
cliente(nit_cliente)
)engine=Innodb;

create table credito_proveedor(
id_credito int auto_increment,
nit_proveedor varchar(128) not null,
id_bodega int not null,
porcentaje double,
interes double,
cuota double not null,
pago_acumulado double ,
tiempo_pago int ,
tipo_tiempo varchar(80),
forma_pago varchar(80) not null,
total double not null,
fecha_inicio date not null,
fecha_final date not null,
foreign key (nit_proveedor) references
proveedor(nit_proveedor),
foreign key (id_bodega) references
bodega(id_bodega),
primary key(id_credito,nit_proveedor,id_bodega)
)engine=innodb;

create table mov_credito_proveedor(
id_credito int primary key auto_increment not null,
fecha date not null,
movimiento double not null,
foreign key (id_credito) references
credito_proveedor(id_credito)
)engine=innodb;

create table usuario(
id int primary key auto_increment not null,
nombre_usuario varchar(30) not null,
pass varchar(30) not null,
correo varchar(40) not null
)engine=innodb;

insert into usuario values(0,"admin","1234","ranbri@gmail.com");
