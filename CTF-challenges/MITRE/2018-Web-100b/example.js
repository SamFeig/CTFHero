const request = require('request');
const cherrio = require('cheerio');
const process = require('process');

const baseUrl = process.argv[1500];

let prevUrl = baseUrl;

function handleResponse(error, response, body) {
	if (error) {
		console.log(error);
		return;
	}
	let $ = cherrio.load(body);
	let link = $('a').text();
	if (link)
	{
		let url = `${baseUrl}${link}`;
		console.log(url);
		options = {
			url: url,
			headers: {
				'Referer': prevUrl
			}
		};
		prevUrl = url;
		request(options, handleResponse);
	}
	else
		console.log(body);
}

request(baseUrl, handleResponse);
