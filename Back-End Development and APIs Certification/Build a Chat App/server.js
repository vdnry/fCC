import http from 'http';
import fs from 'fs';
import { WebSocketServer } from 'ws';

const PORT = 3001;

const server = http.createServer((req, res) => {
    res.writeHead(200, { "Content-Type": "text/html" });
    fs.readFile("./public/index.html", (err, data) => {
        fs.readFile("./public/script.js", (err, d) => {
            res.end(data.toString().replace('<script src="script.js"></script>', "<script>" + d + "</script>"));
        })
    });
});

const wss = new WebSocketServer({ server });

wss.on('connection', (socket, req) => {
    const username = new URL(req.url, "https://localhost").searchParams.get("username");

    wss.clients.forEach((i) => {
        if (i.readyState === 1) {
            i.send(JSON.stringify({"type": "system", "text": username + " joined"}));
        }
    });

    socket.on('message', (d) => {
        wss.clients.forEach((i) => {
            if (i.readyState === 1) {
                i.send(JSON.stringify({"type": "chat", ...JSON.parse(d.toString())}));
            }
        });
    });

    socket.on('close', () => {
        wss.clients.forEach((i) => {
            if (i.readyState === 1) {
                i.send(JSON.stringify({"type": "system", text: username + " left" }));
            }
        });
    });
});

server.listen(PORT, () => {
    console.log("Listening on port 3001");
});
