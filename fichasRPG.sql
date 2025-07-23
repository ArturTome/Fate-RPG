create schema fichas;
use fichas;

create table elementos(
elementoAtacante varchar(12) primary key,
fogo float,
agua float,
vento float,
terra float,
escuridao float,
luz float,
eletricidade float
);

insert into elementos values
(fogo, 1, 0.5, 2, 0.75, 1.5, 1.5, 1.5),
(agua, 2, 0.75, 1.25, 1.75, 1, 1, 2),
(vento, 2, 0.75, 1, 0.75, 1, 1, 0.5),
(terra, 2, 0.5, 0.75, 1, 1, 1, 2.5),
(escuridao, 0.75, 1, 1, 1, 2, 2, 0.75),
(luz, 1.5, 1, 1, 1, 2, 1, 1),
(eletricidade, 1.25, 2.5, 0.25, 0, 1.5, 1.5, 1)
;

create table clase(
classeAtacante varchar(12)primary key,
saber float,
archer float,
lancer float,
rider float,
assassin float,
berserker float,
caster float
);

insert into classe values (saber, 1, 0.9, 1.1, 1, 1.1, 2, 1.1),
(archer, 1.1, 1, 0.9, 1.1, 1, 2, 1),
(lancer, 0.9, 1, 1, 1, 0.9, 2, 1.1),
(rider, 1, 1.1, 1, 1, 1.1, 2, 0.9),
(assassin, 1.1, 0.9, 1.1, 1, 1, 2, 1.1),
(berserker, 2, 2, 2, 2, 2, 2, 2),
(caster, 1, 1.1, 1, 0.9, 1, 2, 1)
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
)
