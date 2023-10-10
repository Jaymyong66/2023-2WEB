const fs = require("fs");
const path = require("path");
const util = require("util");

const directoryNames = util.promisify(fs.readdir);
const fileNames = util.promisify(fs.stat);

const getD = async (dict) => {
  const files = await directoryNames(dict);
  files.forEach(async (file) => {
    const filePath = path.join(dict, file);
    // const filePath = dict + file;
    const stat = await fileNames(filePath);

    if (stat.isDirectory()) await getD(filePath);
    else if (path.extname(filePath) === ".js") console.log(filePath);
  });
};

(async () => {
  try {
    await getD("./test");
  } catch (err) {
    console.error(err);
  }
})();
