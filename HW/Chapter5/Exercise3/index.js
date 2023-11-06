const { runQuery } = require("./database");

const getScoreByIdName = async (id, name) => {
  const sql = "SELECT * FROM scores WHERE id = ? AND student = ?";
  const results = await runQuery(sql, [id, name]);
  return results[0];
};
// const createScore = async (name, course, midterm, final) => {
//   const sql = "INSERT INTO scores VALUES (DEFAULT, ?, ?, ?, ?)";
//   const result = await runQuery(sql, [name, course, midterm, final]);
//   return result;
// };

getScoreByIdName(1, "Joe");
