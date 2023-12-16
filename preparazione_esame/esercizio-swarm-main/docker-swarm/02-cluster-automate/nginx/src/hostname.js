const express = require("express");
const app = express();
const os = require("os");

app.get("/", (req, res) => {
  // Ottieni l'hostname locale
  const hostname = os.hostname();
  const dockerHost = process.env.HOST_HOSTNAME

  // Ritorna l'hostname
  res.send("container name:"+hostname+" on "+dockerHost);
});

app.listen(3000, () => console.log("Servizio in esecuzione su http://localhost:3000"));