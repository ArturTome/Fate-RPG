const express = require('express');
const exphbs = require('express-handlebars');
const path = require('path');
const db = require('./database');

const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

app.engine('handlebars', exphbs.engine({ defaultLayout: false }));
app.set('view engine', 'handlebars');
app.set('views', path.join(__dirname, 'views'));


app.get('/', (req, res) => {
  res.render('home');
});

app.get('/dados', (req, res) => {
    res.render('dados')
})

app.get('/personagensPub', (req, res) => {
    res.render('personagensPub')
})

app.get('/historico', (req, res) => {
    res.render('historico')
})














app.listen(port, () => {
  console.log(`Servidor em execução: http://localhost:${port}`);
});