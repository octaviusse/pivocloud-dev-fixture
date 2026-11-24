// PivoCloud dev fixture — the `web` service of a two-service monorepo.
//
// Sibling of api/server.js. See that file for why the two markers are
// deliberately unrelated.
const http = require('http');

const MARKER = 'PIVOCLOUD-MONOREPO-MARKER-WEB';
const PORT = process.env.PORT || 3002;

http
  .createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
    res.end(
      '<!doctype html><meta charset="utf-8"><title>' +
        MARKER +
        '</title><h1>' +
        MARKER +
        '</h1><p>Built from the <code>web/</code> subdirectory of one repository.</p>\n',
    );
  })
  .listen(PORT, '0.0.0.0', () => {
    console.log(MARKER + ' listening on ' + PORT);
  });
