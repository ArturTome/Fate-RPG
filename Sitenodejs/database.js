const sqlite3 = require('sqlite3').verbose();
const path = require('path');

const db = new sqlite3.Database(path.resolve(__dirname, 'banco.db'), (err) => {
  if (err) console.error('Erro ao conectar ao banco:', err.message);
  else console.log('Conectado ao banco de dados SQLite');
});

// Tabelas

db.serialize(() => {
  db.run(`CREATE TABLE elementos(
    idElementos INTEGER PRIMARY KEY,
    elementoAtacante VARCHAR(12) UNIQUE,
    fogo REAL NOT NULL,
    agua REAL NOT NULL,
    vento REAL NOT NULL,
    terra REAL NOT NULL,
    escuridao REAL NOT NULL,
    luz REAL NOT NULL,
    eletricidade REAL NOT NULL
  )`);

  db.run(`CREATE TABLE classe(
    idClasse INTEGER PRIMARY KEY,
    classeAtacante VARCHAR(12) UNIQUE,
    saber REAL NOT NULL,
    archer REAL NOT NULL,
    lancer REAL NOT NULL,
    rider REAL NOT NULL,
    assassin REAL NOT NULL,
    berserker REAL NOT NULL,
    caster REAL NOT NULL
  )`);

  db.run(`CREATE TABLE racas (
    idRacas INTEGER PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    modificadorAtributo1 VARCHAR(12),
    modificadorAtributoPorcentagem1 REAL,
    modificadorAtributo2 VARCHAR(12),
    modificadorAtributoPorcentagem2 REAL,
    modificadorAtributo3 VARCHAR(12),
    modificadorAtributoPorcentagem3 REAL,
    modificadorAtributo4 VARCHAR(12),
    modificadorAtributoPorcentagem4 REAL,
    habilidade1 VARCHAR(200),
    habilidade2 VARCHAR(200),
    habilidade3 VARCHAR(200),
    habilidade4 VARCHAR(200)
  )`);
  
  db.run(`CREATE TABLE pericias (
    idPericias INTEGER PRIMARY KEY,
    nome VARCHAR(20),
    modificadorAtributo VARCHAR(12)
  )`);
	
  db.run(`CREATE TABLE status(
    idStatus INTEGER PRIMARY KEY,
    karma INTEGER,
    NT INTEGER NOT NULL,
    nivel INTEGER NOT NULL,
    xp INTEGER,
    vidaMax INTEGER NOT NULL,
    classeArmadura INTEGER NOT NULL,
    iniciativa INTEGER,
    deslocamento REAL NOT NULL,
    salvaGuarda VARCHAR(12) NOT NULL,
    pericia1 INTEGER NOT NULL,
    pericia2 INTEGER NOT NULL,
    pericia3 INTEGER NOT NULL,
    forca INTEGER NOT NULL,
    contituicao INTEGER NOT NULL,
    resistencia INTEGER NOT NULL,
    inteligencia INTEGER NOT NULL,
    sabedoria INTEGER NOT NULL,
    carisma INTEGER NOT NULL,
    velocidade INTEGER NOT NULL,
    destreza INTEGER NOT NULL,
    estamina INTEGER NOT NULL,
    mana INTEGER NOT NULL,

    FOREIGN KEY (pericia1) REFERENCES pericias(idPericias),
    FOREIGN KEY (pericia2) REFERENCES pericias(idPericias),
    FOREIGN KEY (pericia3) REFERENCES pericias(idPericias)
  )`);
  
  db.run(`CREATE TABLE fantasmaNobre(
    idFantasmaNobre INTEGER PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    aparencia VARCHAR(2000) NOT NULL,
    passivas VARCHAR(2000),
    ativas VARCHAR(2000)
  )`);
  
  db.run(`CREATE TABLE dadosPessoais (
    idDadosPessoais INTEGER PRIMARY KEY,
    nomePersonagem VARCHAR(50) NOT NULL,
    nomeJogador VARCHAR(50) NOT NULL,
    aparencia VARCHAR(1000),
    historia VARCHAR(3000),
    caracteristicasETalentos VARCHAR(2000),
    antecedente VARCHAR(30),
    sobreposicao INTEGER,
    tesouros VARCHAR(1000),

    FOREIGN KEY (sobreposicao) REFERENCES sobreposicao(idSobreposicao)
  )`);
  
  db.run(`CREATE TABLE personagem (
    idPersonagem INTEGER PRIMARY KEY,
    status INTEGER UNIQUE,
    elemento INTEGER UNIQUE,
    classe INTEGER UNIQUE,
    fantasmaNobre INTEGER UNIQUE,
    dadosPessoais INTEGER UNIQUE,
    raca INTEGER UNIQUE,
    dataDaCriacao DATE,
    NPC INTEGER NOT NULL,

    FOREIGN KEY (status) REFERENCES status(idStatus),
    FOREIGN KEY (elemento) REFERENCES elementos(idElementos),
    FOREIGN KEY (classe) REFERENCES classe(idClasse),
    FOREIGN KEY (fantasmaNobre) REFERENCES fantasmaNobre(idFantasmaNobre),
    FOREIGN KEY (dadosPessoais) REFERENCES dadosPessoais(idDadosPessoais),
    FOREIGN KEY (raca) REFERENCES racas(idRacas)
  )`);
});

module.exports = db;