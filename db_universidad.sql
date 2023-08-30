create database db_universidad;
use db_universidad;

create table curso_escolar(
	id int(10) primary key not null,
    anyo_inicio year(4) not null,
    anyo_fin year(4) not null
);
create table grado(
	id int(10) primary key not null,
    nombre varchar(100) not null
);
create table departamento(
	id int(10) primary key not null,
    nombre varchar(100) not null
);
create table alumno(
	id int(10) primary key not null,
	nif varchar(9) not null,
	nombre varchar(25) not null,
    apellido1 varchar(50) not null,
    apellido2 varchar(50) not null,
    ciudad varchar(25) not null,
    direccion varchar(50) not null,
    telefono varchar(9),
    fecha_nacimiento date not null,
    sexo enum('H', 'M') not null
);
create table profesor(
	id int(10) primary key not null,
    nif varchar(9) not null,
    nombre varchar(25),
    apellido1 varchar(50) not null,
    apellido2 varchar(50) not null,
    ciudad varchar(25) not null,
    direccion varchar(50) not null,
    telefono varchar(9),
    fecha_nacimiento date not null,
    sexo enum('H', 'M') not null,
    id_departamento int(10) not null,
    foreign key(id_departamento) references departamento(id)
);
create table asignatura(
	id int(10) primary key not null,
    nombre varchar(100) not null,
    creditos float not null,
    tipo enum('basica', 'obligatoria', 'optativa') not null,
    curso tinyint(3) not null,
	cuatrimestre tinyint(3) not null,
    id_profesor int(10) not null,
	id_grado int(10) not null,
    foreign key(id_profesor) references profesor(id),
    foreign key(id_grado) references grado(id)
);
create table alumno_se_matricula_asignatura(
	id_alumno int(10) not null,
    id_asignatura int(10) not null,
    id_curso_escolar int(10) not null,
    primary key(id_alumno, id_asignatura, id_curso_escolar),
    foreign key(id_alumno) references alumno(id),
    foreign key(id_asignatura) references asignatura(id),
    foreign key(id_curso_escolar) references curso_escolar(id)
);
insert into curso_escolar(id, anyo_inicio, anyo_fin) values (1, '2023', '2024'),
(2, '2022', '2023'),
(3, '2021', '2022'),
(4, '2020', '2021'),
(5, '2019', '2020');

insert into grado(id, nombre) values (1, 'Primero Año de Universidad'),
(2, 'Cuarto Año de Universidad'),
(3, 'Primer Año de Universidad'),
(4, 'Segundo Año de Universidad'),
(5, 'Tercer Año de Universidad');

insert into departamento(id, nombre) values (1, 'Matemáticas'),
(2, 'Historia'),
(3, 'Ciencias de la Computación'),
(4, 'Literatura'),
(5, 'Ciencias Sociales');

insert into alumno(id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo) values (1, '123456784', 'María', 'López', 'Pérez', 'Circasia', 'Calle Alegre 123', '612345678', '2000-05-15', 'M'),
(2, '987654324', 'Carlos', 'García', 'Martínez', 'Manizales', 'Plaza Principal 5', '655432109', '1999-09-02', 'H'),
(3, '567890126', 'Laura', 'Rodríguez', 'Fernández', 'Pereira', 'Av. Central 67', '699876543', '2001-02-25', 'M'),
(4, '345678907', 'Alejandro', 'Pérez', 'Sánchez', 'Armenia', 'Calle Mayor 10', '622233344', '2002-11-10', 'H'),
(5, '789012349', 'Ana', 'Martínez', 'Jiménez', 'Calarca', 'Paseo Nuevo 21', '633344455', '2000-08-18', 'M');

insert into profesor(id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, id_departamento) values (1, '111111115', 'Luis', 'Rodríguez', 'Gómez', 'Pereira', 'Calle Profesores 5', '611112222', '1985-06-20', 'H', 1),
(2, '222222226', 'Ana', 'López', 'García', 'Armenia', 'Plaza Docentes 10', '633334444', '1978-03-12', 'M', 2),
(3, '333333337', 'Javier', 'Martínez', 'Pérez', 'Manizales', 'Av. Maestros 25', '655556666', '1990-11-05', 'H', 3),
(4, '444444448', 'María', 'Fernández', 'Sánchez', 'Circasia', 'Calle Académica 8', '677778888', '1982-09-15', 'M', 1),
(5, '555555559', 'Daniel', 'Sánchez', 'Martínez', 'Calarca', 'Paseo Docencia 15', '699990000', '1988-01-30', 'H', 4);

insert into asignatura(id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) values (1, 'Matemáticas Avanzadas', 5.0, 'obligatoria', 2, 1, 1, 1),
(2, 'Historia Contemporánea', 4.0, 'basica', 3, 2, 2, 2),
(3, 'Programación en C++', 6.0, 'obligatoria', 1, 1, 3, 3),
(4, 'Literatura Clásica', 3.0, 'optativa', 2, 2, 4, 1),
(5, 'Economía Global', 4.5, 'obligatoria', 3, 1, 5, 3);

insert into alumno_se_matricula_asignatura(id_alumno, id_asignatura, id_curso_escolar) values (1, 1, 1),
(1, 3, 1),
(2, 2, 1),
(2, 5, 1),
(3, 3, 1);








