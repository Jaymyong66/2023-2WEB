const express = require("express");

const app = express();

const port = 3001;

app.get("/board/page/:page", (req, res) => {
  const { page } = req.params;
  res.send(`page number is ${page}! `);
});

app.listen(port, () => console.log(`Server listening port : ${port}!`));
