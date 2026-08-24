// PivoCloud dev fixture — the `api` service of a two-service monorepo.
//
// Exists for Phase 77.1: two PivoCloud apps are created from THIS ONE
// repository, differing only in root_directory (`api` vs `web`), and each must
// answer at its own public hostname with its own marker. If both hostnames
// served the same string the test would pass while the build settings did
// nothing, so the two markers are deliberately unrelated.
const http = require('http');

const MARKER = 'PIVOCLOUD-MONOREPO-MARKER-API';
const PORT = process.env.PORT || 3001;

http
  .createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
    res.end(
      '<!doctype html><meta charset="utf-8"><title>' +
        MARKER +
        '</title><h1>' +
        MARKER +
        '</h1><p>Built from the <code>api/</code> subdirectory of one repository.</p>\n',
    );
  })
  .listen(PORT, '0.0.0.0', () => {
    console.log(MARKER + ' listening on ' + PORT);
  });
