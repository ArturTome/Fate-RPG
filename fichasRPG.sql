create schema fichas;
use fichas;

create table elementos(
idElementos int primary key,
elementoAtacante varchar(12) unique key,
fogo float,
agua float,
vento float,
terra float,
escuridao float,
luz float,
eletricidade float
);

insert into elementos values
(1, 'fogo', 1, 0.5, 2, 0.75, 1.5, 1.5, 1.5),
(2, 'agua', 2, 0.75, 1.25, 1.75, 1, 1, 2),
(3, 'vento', 2, 0.75, 1, 0.75, 1, 1, 0.5),
(4, 'terra', 2, 0.5, 0.75, 1, 1, 1, 2.5),
(5, 'escuridao', 0.75, 1, 1, 1, 2, 2, 0.75),
(6, 'luz', 1.5, 1, 1, 1, 2, 1, 1),
(7, 'eletricidade', 1.25, 2.5, 0.25, 0, 1.5, 1.5, 1)
;

create table classe(
idClasse int primary key,
classeAtacante varchar(12) unique key,
saber float,
archer float,
lancer float,
rider float,
assassin float,
berserker float,
caster float
);

insert into classe values 
(1,'saber', 1, 0.9, 1.1, 1, 1.1, 2, 1.1),
(2,'archer', 1.1, 1, 0.9, 1.1, 1, 2, 1),
(3,'lancer', 0.9, 1, 1, 1, 0.9, 2, 1.1),
(4,'rider', 1, 1.1, 1, 1, 1.1, 2, 0.9),
(5,'assassin', 1.1, 0.9, 1.1, 1, 1, 2, 1.1),
(6,'berserker', 2, 2, 2, 2, 2, 2, 2),
(7,'caster', 1, 1.1, 1, 0.9, 1, 2, 1)
;

create table status(
nomePersonagemStatus varchar(50) primary key,
nivel int not null,
xp int,
vidaMax int not null,
classeArmadura int not null,
iniciativa int,
deslocamento float not null,
salvaGuarda varchar(12) not null,
pericia1 varchar(12) not null,
pericia2 varchar(12) not null,
pericia3 varchar(12) not null,
forca int not null,
contituicao int not null,
resistencia int not null,
inteligencia int not null,
sabedoria int not null,
carisma int not null,
velocidade int not null,
destreza int not null,
estamina int not null,
mana int not null
);

insert into status values
(1, 'Astolfo (Saber)', 120, null, 300, 50, 15, 'carisma', 'adestramento', 
'atletismo', 'acrobacia', 100, 100, 90, 100, 100, 150, 120, 500, 500)

create table fantasmaNobre(
idFantasmaNobre int primary key,
nomeFantasmaNobre varchar(50) unique key,
aparencia varchar(9999) not null,
passivas varchar(9999),
ativas varchar(9999)
)
