
var redis = require('redis')
var client = redis.createClient();
var redisScan = require('redisscan');

client.on("error", function (err) {
    console.log("Error " + err);
});

var div = document.getElementById("REDIS");
//div.innerHTML += "TEXT";

client.set("string key", "string val", redis.print);
client.hset("hash key", "hashtest 1", "some value", redis.print);
client.hset(["hash key", "hashtest 2", "some other value"], redis.print);
client.hkeys("hash key", function (err, replies) {
    div.appendChild(replies.length + " replies:");
    replies.forEach(function (reply, i) {
        div.appendChild("    " + i + ": " + reply);
    });
    client.quit();
});