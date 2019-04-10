const { execSync } = require("child_process");
const gm = require("gm");
const puppeteer = require("puppeteer");

(async () => {
  console.log("Building Jekyll site...");
  const output = execSync("bundle exec jekyll build");
  console.log(output.toString("utf8"));

  console.log("Taking screenshot...");
  const browser = await puppeteer.launch();
  try {
    const page = await browser.newPage();
    await page.goto(`file://${__dirname}/_site/logo.html`);
    const img = await page.screenshot({
      omitBackground: true
    });

    console.log("Trimming screenshot...");
    const output = "logo.png";
    const imageMagick = gm.subClass({ imageMagick: true });
    imageMagick(img)
      .trim()
      .write(output, err => {
        if (err) {
          throw err;
        }
      });

    console.log(`Done! Written to ${output}.`);
  } finally {
    await browser.close();
  }
})();
