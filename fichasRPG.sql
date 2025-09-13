create schema fichas;
use fichas;

create table elementos(
idElementos int primary key,
elementoAtacante varchar(12) unique key,
fogo float not null,
agua float not null,
vento float not null,
terra float not null,
escuridao float not null,
luz float not null,
eletricidade float not null
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
saber float not null,
archer float not null,
lancer float not null,
rider float not null,
assassin float not null,
berserker float not null,
caster float not null
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

create table racas (
idRacas int primary key,
nome varchar (50) not null,
modificadorAtributo1 varchar (12), -- só o nome do atributo
modificadorAtributoPorcentagem1 float, -- colocar a porcentagem em decimal
modificadorAtributo2 varchar (12),
modificadorAtributoPorcentagem2 float,
modificadorAtributo3 varchar (12),
modificadorAtributoPorcentagem3 float,
modificadorAtributo4 varchar (12),
modificadorAtributoPorcentagem4 float,
habilidade1 varchar (200), -- nome e explicação da habilidade e o nome da habilidade fica entre aspas com dois pontos
habilidade2 varchar (200),
habilidade3 varchar (200),
habilidade4 varchar (200)
);

insert into racas values 
(1, 'Humano', 'Atributos gerais', 1.05, 'classe de armadura', +5, null, null, null, null, '"Agilidade": Em testes de velocidade tem vantagem de +2', null,null, null)
;

create table pericias (
idPericias int primary key,
nome varchar (20),
modificadorAtributo varchar (12)
)

insert into pericias values
(1, 'Acrobacia', 'Destreza')
;

create table sobreposicao (
idSobreposicao int primary key,
nome varchar (50) not null,
descricao varchar (300) not null
);

insert into sobreposicao values
(1,"Sangue cru", 'aumenta o lifesteel de 5%')
;

create table status(
idStatus int primary key,
karma int, -- pra permitir os negativos
nivel int not null,
xp int,
vidaMax int not null,
classeArmadura int not null,
iniciativa int, -- nem todos tem modificador de iniciativa
deslocamento float not null, -- em metros/minuto
salvaGuarda varchar(12) not null,
pericia1 int not null,
pericia2 int not null,
pericia3 int not null,
forca int not null,
contituicao int not null,
resistencia int not null,
inteligencia int not null,
sabedoria int not null,
carisma int not null,
velocidade int not null,
destreza int not null,
estamina int not null,
mana int not null,

foreign key (pericia1) references (idPericias),
foreign key (pericia2) references (idPericias),
foreign key (pericia3) references (idPericias)
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
caracteristicasETalentos varchar (1000),
antecedente varchar (30),
sobreposicao int,
tesouros varchar (1000),

foreign key (sobreposicao) references (idSobreposicao)
);

create table personagem (
idPersonagem int primary key,
status int unique key,
elemento int unique key,
classe int unique key,
fantasmaNobre int unique key,
dadosPessoais int unique key,
raca integer unique key,
dataDaCriacao date,

foreign key (status) references (idStatus),
foreign key (elemento) references (idElementos),
foreign key (classe) references (idClasse),
foreign key (fantasmaNobre) references (idFantasmaNobre),
foreign key (dadosPessoais) references (idDadosPessoais),
foreign key (raca) references (idRacas)
)

insert into personagem values
(1,1,2,2,1,1,1,null)
;
