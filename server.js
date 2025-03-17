console.log("Carregando dependências...");
const express = require('express');
const path = require('path');
console.log("Dependências carregadas.");

const app = express();
const PORT = 3000;

console.log("Iniciando server.js");

app.use(express.static(path.join(__dirname)));

// Adicionar rota para a página inicial
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Adicionar rota específica para o simulador de Kepler
app.get('/kepler', (req, res) => {
  res.sendFile(path.join(__dirname, 'kepler-simulator.html'));
});

// Rota para tratar erros 404
app.use((req, res) => {
  res.status(404).sendFile(path.join(__dirname, '404.html'));
});

app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
