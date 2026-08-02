// PivoCloud dev fixture — prints its own environment variables.
//
// This exists so "did my env var actually reach the running container?" is a
// question you answer by loading a page, instead of by running `docker exec`.
// Set a variable in the PivoCloud dashboard, redeploy, reload: it shows here.
//
// Values are rendered as-is. This is a TEST FIXTURE — never put a real secret
// in an app running this image.
const http = require('http');

// Docker/orchestrator noise that says nothing about what the user set.
const HIDE = new Set(['PATH', 'HOSTNAME', 'HOME', 'NODE_VERSION', 'YARN_VERSION', 'PWD', 'SHLVL', '_']);

const esc = (s) =>
  String(s).replace(/[&<>"']/g, (c) =>
    ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));

http
  .createServer((req, res) => {
    if (req.url === '/healthz') {
      res.writeHead(200, { 'Content-Type': 'text/plain' });
      return res.end('ok');
    }

    const rows = Object.entries(process.env)
      .filter(([k]) => !HIDE.has(k))
      .sort(([a], [b]) => a.localeCompare(b))
      .map(
        ([k, v]) =>
          `<tr><th>${esc(k)}</th><td><pre>${esc(v)}</pre></td></tr>`,
      )
      .join('\n');

    res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
    res.end(`<!doctype html>
<meta charset="utf-8">
<title>PivoCloud dev fixture</title>
<style>
  body { font: 14px/1.5 system-ui, sans-serif; margin: 2rem auto; max-width: 60rem; padding: 0 1rem; }
  table { border-collapse: collapse; width: 100%; }
  th, td { border-bottom: 1px solid #ddd; padding: .5rem; text-align: left; vertical-align: top; }
  th { width: 16rem; font-family: ui-monospace, monospace; font-weight: 600; }
  pre { margin: 0; white-space: pre-wrap; word-break: break-all; font-family: ui-monospace, monospace; }
  .note { color: #666; }
</style>
<h1>PivoCloud dev fixture</h1>
<p class="note">Environment variables visible to this container, at
<code>${esc(new Date().toISOString())}</code>. Test fixture — not for real secrets.</p>
<table>${rows}</table>`);
  })
  .listen(process.env.PORT || 3000);
