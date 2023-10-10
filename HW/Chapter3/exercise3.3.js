const express = require("express");

const app = express();

const port = 3001;

app.get("/factorial", (req, res) => {
  const { num } = req.query;
  return res.redirect(`/factorial/${num}`);
});

app.get("/factorial/:number", (req, res) => {
  const { number } = req.params;
  const temp = parseInt(number, 10);
  let result = 1;

  for (let i = 0; i < temp; i++) {
    result *= i + 1;
  }

  return res.send(`${temp}! = ${result}`);
});

app.listen(port, () => console.log(`Server listening port : ${port}!`));
