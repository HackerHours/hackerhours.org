const { execSync } = require("child_process");
const puppeteer = require("puppeteer");
const sharp = require("sharp");

(async () => {
  console.log("Building Jekyll site...");
  const output = execSync("bundle exec jekyll build");
  console.log(output.toString("utf8"));

  console.log("Taking screenshot...");
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto(`file://${__dirname}/_site/logo.html`);
  const img = await page.screenshot({
    omitBackground: true
  });

  console.log("Trimming screenshot...");
  sharp(img)
    .trim()
    .toFile("logo.png", err => {
      if (err) {
        console.error(err);
      }
    });

  await browser.close();
  console.log("Done!");
})();
