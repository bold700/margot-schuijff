#!/usr/bin/env python3
"""
Lokale dev-server voor margot-schuijff.

Mimic de TransIP .htaccess rewrite rules zodat clean URLs (zonder .html)
ook lokaal werken. Op productie doet Apache hetzelfde via .htaccess.

Gebruik:
    python3 serve.py            # poort 8000
    python3 serve.py 8123       # eigen poort
"""
import os
import sys
import http.server
import socketserver


class CleanURLHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        path = self.path.split('?', 1)[0].split('#', 1)[0]

        # 1. Strip trailing slash (uitgezonderd root)
        if len(path) > 1 and path.endswith('/'):
            self.send_response(301)
            self.send_header('Location', path.rstrip('/') + self._suffix())
            self.end_headers()
            return

        # 2. /xxx.html → 301 redirect naar /xxx (zoals .htaccess doet)
        if path.endswith('.html') and path != '/index.html':
            clean = path[:-5]
            self.send_response(301)
            self.send_header('Location', clean + self._suffix())
            self.end_headers()
            return

        # 3. /xxx → intern serveren als /xxx.html bestaat
        if path != '/' and not os.path.splitext(path)[1]:
            html_path = path.lstrip('/') + '.html'
            if os.path.isfile(html_path):
                self.path = '/' + html_path + self._suffix()

        super().do_GET()

    # HEAD requests volgen dezelfde rewrite-logica
    do_HEAD = do_GET

    def _suffix(self):
        """Behoud query string en fragment."""
        if '?' in self.path:
            return '?' + self.path.split('?', 1)[1]
        return ''


if __name__ == '__main__':
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 8000
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    with socketserver.TCPServer(('', port), CleanURLHandler) as httpd:
        print(f'Margot dev-server op http://localhost:{port}/')
        print('Clean URLs actief — Ctrl+C om te stoppen')
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print('\nStopped.')
