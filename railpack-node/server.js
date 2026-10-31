// Phase 318 sample: a dependency-free HTTP server on PORT. The body names the
// command that started it: a second argument is the railpack.json marker, none
// means the Procfile line (`node server.js`) did.
const http = require('http');

const port = process.env.PORT || '8080';
const start = process.argv[2] || 'procfile';

http
  .createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end(`ok node start=${start}`);
  })
  .listen(Number(port), '0.0.0.0');
