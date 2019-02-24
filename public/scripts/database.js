var redisScan = require('redisscan');
var redis     = require('redis').createClient();

client.on("error", function (err) {
    console.log("Error " + err);
});

var div = document.getElementById("REDIS");
div.innerHTML += "TEXT";

client.hgetall("*", function (err, replies) {
    div.appendChild(replies.length + " replies:");
    replies.forEach(function (reply, i) {
        div.appendChild("    " + i + ": " + reply);
    });
    client.quit();
});