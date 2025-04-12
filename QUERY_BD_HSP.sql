create database Hospital;



create table paciente(
IdPaciente int identity(1,1) primary key,
NombrePaciente varchar(25),
ApellidoPaciente  varchar(25),
EdadPaciente int,
GeneroPaciente varchar(10),
IdDepartamento int,
Trabajo varchar(50),
);

create table RegistroPaciente(
idRegistroPaciente int primary key identity(1,1) not null,
IdPaciente INT,
FechaRegistro datetime default getdate(),
PesoPaciente int, 
AlturaPaciente decimal,
constraint fk_pacien foreign key(IdPaciente) references paciente(IdPaciente),
);


create table ActividadFisica(
IdActividad int primary key identity(1,1) not null,
idRegistroPaciente int,
IdPaciente int,
TipoActividad varchar(100),
TiempoActividad varchar(50),
constraint fk_pacien2 foreign key(IdPaciente) references paciente(IdPaciente),
)


create table AlimentacionPaciente(
IdAlimentacion  int primary key identity(1,1) not null,
IdPaciente int,

);

create table tiponutriente(
IdTipN int identity(1,1) primary key not null,
nombretipoN varchar(25),
)


create table nutri(
ID_nutriente int identity(1,1) primary key not null,
NombreNutrien varchar(50),
IdTipN int,
IDalimento int
constraint FK_tn2 foreign key(IdTipN) references tiponutriente(IdTipN),
constraint FK_Alim foreign key(IDalimento) references alimento(IDalimento),
)


create table TipoAlimento(
IdTipoAlimento int identity(1,1) primary key,
NombreTipoAlimento varchar(100),
)

create table alimento(
IDalimento int identity(1,1) primary key not null,
nombreAlimento varchar(50),
IdTipoAlimento int,
IdMedida int,
constraint FK_medida foreign key(IdMedida) references UnidadMedida(IdMedida),
constraint FK_TipAlm foreign key(IdTipoAlimento) references TipoAlimento(IdTipoAlimento),
)


create table UnidadMedida(
IdMedida int identity(1,1) primary key,
NombreMedida varchar(50),
)

create table alimentacionPaciente(
IDalimentacionP int identity(1,1) primary key not null, 
ID_nutriente int,
constraint FK_nutrient foreign key(ID_nutriente) references nutri(ID_nutriente),
IDalimento int,
constraint FK_Alm foreign key(IDalimento) references alimento(IDalimento),

)




