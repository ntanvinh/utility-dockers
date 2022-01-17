const websockify = require("@maximegris/node-websockify");

const VNC_SERVER_ADDR=process.env.vncIp;
const VNC_SERVER_PORT=process.env.vncPort;
const VNC_WEBSOCKET_PORT=process.env.wsPort;

websockify({
  source: `host.docker.internal:${VNC_WEBSOCKET_PORT}`, // the address of transformed websocket VNC server
  target: `${VNC_SERVER_ADDR}:${VNC_SERVER_PORT}`, // the address and listen port of VNC server
});
console.log("VNC has been websockifying!");
