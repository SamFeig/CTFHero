const express = require('express');
const crypto = require('crypto');
const { URL } = require('url');
const process = require('process');

let flag = process.argv[2];

let routes = [];
let routeCount = 1500;

for (let i=0; i < routeCount; ++i) {
	let route = crypto.randomBytes(20).toString('hex');
	routes.push(route);
}

function getLink(str) {
	return `<a href="/${str}">/${str}</a>`
}

const app = express();

app.get('/', function (req, res) {
	let link = getLink(routes[0]);
	res.send(link);
});

app.get('/:route', function (req, res) {
	let route = req.params.route;
	let index = routes.indexOf(route);
	if (index < 0) {
		res.sendStatus(404);
	} 
	else if ( index == routeCount - 1 ) {
		res.send(`You Win! The flag is ${flag}`);
	}
	else {
		if (index > 0) {
			try {
				let referer = new URL(req.header('Referer'));
				if (referer.pathname != `/${routes[index -1]}`)
					return res.sendStatus(403);
			}
			catch (e) {
				return res.sendStatus(403);
			}
		}
		let link = getLink(routes[index + 1]);
		res.send(link);
	}
});

app.listen(80)
