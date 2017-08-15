const elmStaticHtml = require('elm-static-html-lib').default;
const fs = require('fs');

const model = { name: 'Elliot', greeting: 'Hello', repeat: 3 };

const options = {
  model,
  decoder: 'Main.decodeModel',
};

const generateHtml = opts =>
  elmStaticHtml(process.cwd(), 'Main.view', opts).then(html =>
    fs.writeFileSync('dist/output.html', html)
  );

generateHtml(options);
