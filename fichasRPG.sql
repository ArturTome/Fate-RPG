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

insert into elementos (fogo, 1, 0.5, 2, 0.75, 1.5, 1.5, 1.5);
insert into elementos (agua, 2, 0.75, 1.25, 1.75, 1, 1, 2);
insert into elementos (vento, 2, 0.75, 1, 0.75, 1, 1, 0.5);
insert into elementos (terra, 2, 0.5, 0.75, 1, 1, 1, 2.5);
insert into elementos (escuridao, 0.75, 1, 1, 1, 2, 2, 0.75);
insert into elementos (luz, 1.5, 1, 1, 1, 2, 1, 1);
insert into elementos (eletricidade, 1.25, 2.5, 0.25, 0, 1.5, 1.5, 1)

