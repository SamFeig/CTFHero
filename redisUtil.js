var redis = require('redis');
var client = redis.createClient();
var fs = require('fs')
var unzip = require('unzip')
const { spawn } = require('child_process');
// var client = redis.createClient(port, host); // if we need to use a custom host and port


client.on('connect', function() {
    console.log('Redis client connected');
});

client.on('error', function (err) {
    console.log('Something went wrong ' + err);
});


module.exports = {
    setData: function(key,data,response){
        client.set(key,data,redis.print);
        console.log("inserted data " + data + " at key " + key)
        response.send("data successfully inserted")
    },
    
    getZipFile: function(key,response){
        client.get(key, function (error, result) {
            if (error) {
                console.log(error);
                throw error;
            }
            console.log('Query result ' + result);
            // do something with the resulting data
            var file = fs.readFileSync(result,'binary') // __dirname + '/upload-folder/dramaticpenguin.MOV', 'binary');

            response.setHeader('Content-Length', file.length);
            response.write(file, 'binary');
            response.end();
        });
    },

    getWebChallenge: function(key, response){
        client.get(key, function(error,result){
            if(error){
                console.log(error)
                throw error;
            }
            console.log('Query result ' + result);
            // do something with the resulting data
            const docker = spawn('docker', ['build', key]);

            docker.stdout.on('data', (data) => {
                console.log(`stdout: ${data}`);
            });

            docker.stderr.on('data', (data) => {
                console.log(`stderr: ${data}`);
            });

            docker.on('close', (code) => {
                console.log(`child process exited with code ${code}`);
            });

        })
    }
}
