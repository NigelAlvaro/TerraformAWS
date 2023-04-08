from http.server import HTTPServer, BaseHTTPRequestHandler

HOST = 'localhost'
PORT = 8989


class MyPython(BaseHTTPRequestHandler):

    def do_GET(self):
        if self.path == '/landing':
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(bytes("<html><body><h1>Hello World!</h1></body></html>","utf-8"))
        else:
            self.send_response(404)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(bytes("<html><body>", "utf-8"))
            self.wfile.write(bytes("<h1>404 Not Found</h1>", "utf-8"))
            self.wfile.write(bytes("</body></html>", "utf-8"))

server = HTTPServer((HOST, PORT), MyPython)
print ("Server Running....")
server.serve_forever()
server.server_close()