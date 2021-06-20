const { toMatchImageSnapshot } = require("jest-image-snapshot");
const puppeteer = require("puppeteer");
expect.extend({ toMatchImageSnapshot });
let browser;
beforeAll(async () => {
  browser = await puppeteer.launch();
});

afterAll(async () => {
  await browser.close();
});

const URLS = [
  "SurfaceBootstrap.Catalogue.Button.Example01?__window_id__=3237424777D8C476F57F732DD3879A68",
  "SurfaceBootstrap.Catalogue.Button.Example02?__window_id__=3237424777D8C476F57F732DD3879A68",
  "SurfaceBootstrap.Catalogue.Button.Example04?__window_id__=3237424777D8C476F57F732DD3879A68",
  "Surface.Components.Form.Example01?__window_id__=5FEDD1772FCF82BECBAAB94928962434",
];
const BASE = "http://localhost:4001/examples/";

const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));
for (const url of URLS) {
  test(url, async () => {
    const page = await browser.newPage();
    await page.goto(BASE + url);
    await sleep(300); // wait for JS to load
    const image = await page.screenshot();
    expect(image).toMatchImageSnapshot();
  });
}
