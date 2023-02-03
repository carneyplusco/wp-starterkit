---
to: blocks/<%= title.toLowerCase().replace(' ', '-') %>/block.json
---
{
	"apiVersion": 2,
	"name": "<%= title.toLowerCase().replace(' ', '-') %>",
	"title": "<%= title %>",
	"description": "<%= description %>",
	"category": "",
	"icon": "",
	"acf": {
			"mode": "preview",
			"renderTemplate": "<%= title.toLowerCase().replace(' ', '-') %>.php"
	},
	"supports": {
		"color" : {
			"text" : true,
			"background" : true,
			"gradients" : true
		},
		"background" : true,
		"anchor": true
	},
	"script": "<%= title.toLowerCase().replace(' ', '-') %>",
	"style": "<%= title.toLowerCase().replace(' ', '-') %>"
}
