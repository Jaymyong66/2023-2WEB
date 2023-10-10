const express = require("express");

const app = express();

const port = 3001;

app.use(express.urlencoded({ extended: true }));

const myMiddleWare = (obj) => {
  Object.keys(obj)
    .map((k) => `${k}: ${obj[k]}`)
    .join("\n");
};

app.get("/", (req, res) => res.send(myMiddleWare(req.query)));
app.post("/", (req, res) => res.send(myMiddleWare(req.body)));
app.put("/", (req, res) => res.send(myMiddleWare(req.body)));
app.delete("/", (req, res) => res.send(myMiddleWare(req.body)));

app.listen(port, () => console.log(`Server listening port : ${port}!`));
