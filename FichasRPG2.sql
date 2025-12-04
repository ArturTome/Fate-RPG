create schema fichas;
use fichas;

create table elementos (
    idElemento int primary key,
    nome varchar(14) not null
);

insert into elementos (idElemento, nome) values
(1, 'fogo'),
(2, 'água'),
(3, 'vento'),
(4, 'terra'),
(5, 'escuridão'),
(6, 'luz'),
(7, 'eletricidade');

create table classe (
    idClasse int primary key,
    nomeClasse varchar(15) not null
);

insert into classe (idClasse, nomeClasse) values
(1,'saber'),
(2,'archer'),
(3,'lancer'),
(4,'rider'),
(5,'assassin'),
(6,'berserker'),
(7,'caster')

create table racas (
idRacas int primary key,
nome varchar (50) not null,
modificadorAtributo1 varchar (12), -- só o nome do atributo
modificadorAtributoPorcentagem1 float, -- colocar a porcentagem em decimal
modificadorAtributo2 varchar (12), -- só o nome do atributo
modificadorAtributoPorcentagem2 float, -- colocar a porcentagem em decimal
modificadorAtributo3 varchar (12), -- só o nome do atributo
modificadorAtributoPorcentagem3 float, -- colocar a porcentagem em decimal
modificadorAtributo4 varchar (12), -- só o nome do atributo
modificadorAtributoPorcentagem4 float, -- colocar a porcentagem em decimal
habilidade1 varchar (200), -- nome e explicação da habilidade e o nome da habilidade fica entre aspas com dois pontos
habilidade2 varchar (200), -- nome e explicação da habilidade e o nome da habilidade fica entre aspas com dois pontos
habilidade3 varchar (200), -- nome e explicação da habilidade e o nome da habilidade fica entre aspas com dois pontos
habilidade4 varchar (200) -- nome e explicação da habilidade e o nome da habilidade fica entre aspas com dois pontos
);

create table status(
idStatus int primary key,
karma int, -- pra permitir os negativos
NT int not null,
nivel int not null,
xp int,
vidaMax int not null,
classeArmadura int not null,
iniciativa int, -- nem todos tem modificador de iniciativa
deslocamento float not null, -- em metros/segundo
salvaGuarda varchar(12) not null,
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

create table fantasmaNobre(
idFantasmaNobre int primary key,
nome varchar(50) not null,
aparencia varchar(2000) not null,
passivas varchar(2000),
ativas varchar(2000)
);

create table dadosPessoais (
idDadosPessoais int primary key,
nomePersonagem varchar(50) not null,
nomeJogador varchar (50) not null,
aparencia varchar(1000),
historia varchar (3000),
caracteristicasETalentos varchar (2000),
antecedente varchar (30),
tesouros varchar (1000),
);

create table personagem (
idPersonagem int primary key,
status int unique key,
fantasmaNobre int unique key,
dadosPessoais int unique key,
raca integer unique key,
dataDaCriacao date,
NPC boolean not null,

foreign key (status) references (idStatus),
foreign key (fantasmaNobre) references (idFantasmaNobre),
foreign key (dadosPessoais) references (idDadosPessoais),
foreign key (raca) references (idRacas)
);

create table personagem_elemento (
    idPersonagem int,
    idElemento int,
    primary key (idPersonagem, idElemento),

    foreign key (idPersonagem) references personagem(idPersonagem),
    foreign key (idElemento) references elementos(idElemento)
);

create table personagem_classe (
    idPersonagem int,
    idClasse int,
    primary key (idPersonagem, idClasse),

    foreign key (idPersonagem) references personagem(idPersonagem),
    foreign key (idClasse) references classe(idClasse)
);

