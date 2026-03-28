<!DOCTYPE html><html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Confirmação de Presença</title>
  <style>
    * { box-sizing: border-box; font-family: Arial, sans-serif; }
    body {
      margin: 0;
      background: linear-gradient(135deg, #ffd1dc, #d8b4fe);
      min-height: 100vh;
      padding: 20px;
    }
    .container {
      max-width: 1100px;
      margin: auto;
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
    }
    .card {
      background: #fff;
      border-radius: 20px;
      padding: 24px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    }
    input, select, textarea {
      width: 100%;
      padding: 14px;
      border: 1px solid #ddd;
      border-radius: 12px;
      margin-bottom: 14px;
    }
    .qtd-box { display: flex; gap: 10px; align-items: center; }
    .qtd-box button, .btn {
      padding: 14px 18px;
      border: none;
      border-radius: 12px;
      cursor: pointer;
      font-weight: bold;
    }
    .btn { width: 100%; background: #ec4899; color: white; }
    .lista { max-height: 500px; overflow-y: auto; }
    .item {
      border: 1px solid #eee;
      border-radius: 12px;
      padding: 12px;
      margin-bottom: 10px;
    }
    @media(max-width: 768px) {
      .container { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="card">
      <h1>🎉 Confirmação de Presença</h1>
      <p>Confirme sua presença no aniversário</p><input type="text" id="nome" placeholder="Seu nome" />

  <div class="qtd-box">
    <button onclick="alterarQtd(-1)">-</button>
    <input type="number" id="quantidade" value="1" min="1" />
    <button onclick="alterarQtd(1)">+</button>
  </div>

  <select id="vai">
    <option value="sim">Vou participar</option>
    <option value="nao">Não poderei ir</option>
  </select>

  <textarea id="mensagem" placeholder="Mensagem opcional"></textarea>

  <button class="btn" onclick="confirmar()">Confirmar Presença</button>
</div>

<div class="card">
  <h2>📋 Lista de Confirmações</h2>
  <p>Total confirmado: <strong id="total">0</strong></p>
  <div class="lista" id="lista"></div>
</div>

  </div>  <script>
    let total = 0;

    function alterarQtd(valor) {
      const qtd = document.getElementById('quantidade');
      qtd.value = Math.max(1, Number(qtd.value) + valor);
    }

    function confirmar() {
      const nome = document.getElementById('nome').value;
      const quantidade = Number(document.getElementById('quantidade').value);
      const vai = document.getElementById('vai').value;
      const mensagem = document.getElementById('mensagem').value;
      const lista = document.getElementById('lista');

      if (!nome.trim()) return;

      const item = document.createElement('div');
      item.className = 'item';
      item.innerHTML = `<strong>${nome}</strong><br>${vai === 'sim' ? '✅ Vai com ' + quantidade + ' pessoa(s)' : '❌ Não vai'}${mensagem ? '<br>💬 ' + mensagem : ''}`;
      lista.prepend(item);

      if (vai === 'sim') {
        total += quantidade;
        document.getElementById('total').innerText = total;
      }

      document.getElementById('nome').value = '';
      document.getElementById('quantidade').value = 1;
      document.getElementById('mensagem').value = '';
      document.getElementById('vai').value = 'sim';
    }
  </script></body>
</html>
