const express = require("express");
const app = express();
const port = 3001;

app.set("views", `${__dirname}/views`);
app.set("view engine", "pug");
//controller
app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => res.render("login.pug"));

app.post("/login", (req, res) => {
  const { username, password } = req.body;
  return res.send(`Hello ${username}, your password: ${password}`);
});

app.listen(port, () => console.log(`Server listening port : ${port}!`));
