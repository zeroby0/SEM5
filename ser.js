const fs = require('fs');
const http = require('http');
const querystring = require('querystring'); 



var qs = require('querystring');

function (request, response) {
    if (request.method == 'POST') {
        var body = '';
        request.on('data', function (data) {
            body += data;
            // 1e6 === 1 * Math.pow(10, 6) === 1 * 1000000 ~~~ 1MB
            if (body.length > 1e6) { 
                // FLOOD ATTACK OR FAULTY CLIENT, NUKE REQUEST
                request.connection.destroy();
            }
        });
        request.on('end', function () {

            var POST = qs.parse(body);
            // use POST

        });
    }
}

function writeLog(data) {
    fs.appendFile("./connLog", data, function(err) {
        if(err) {
            return console.log(err);
        }
    })
}
function processPost(request, response, callback) {
    var queryData = "";
    if(typeof callback !== 'function') return null;
    if(request.method == 'POST') {
        request.on('data', function(data) {
            queryData += data;
            if(queryData.length > 1e6) {
                queryData = "";
                response.writeHead(413, {'Content-Type': 'text/plain'}).end();
                request.connection.destroy();
            }
        });
        request.on('end', function() {
            request.post = querystring.parse(queryData);
            callback();
        });
    } else {
        response.writeHead(405, {'Content-Type': 'text/plain'});
        response.end();
    }
}
http.createServer(function(request, response) {
    if(request.method == 'POST') {
        processPost(request, response, function() {
            //console.log(request.post);
            console.log(JSON.stringify(request.post) + '\n');
            writeLog(String(request.post) + '\n');
            // Use request.post here
            response.writeHead(200, "OK", {'Content-Type': 'text/plain'});
            response.end();
        });
    } else {
        response.writeHead(200, "OK", {'Content-Type': 'text/plain'});
        response.end();
    }
}).listen(80);