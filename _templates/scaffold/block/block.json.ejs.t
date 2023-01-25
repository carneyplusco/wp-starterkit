---
to: blocks/<%= name %>/block.json
---
{
	"apiVersion": 2,
	"name": "<%= name %>",
	"title": "<%= title %>",
	"description": "<%= description %>",
	"category": "",
	"acf": {
        "mode": "preview",
        "renderTemplate": "<%= name %>.php"
    },
	"script": "<%= name %>",
	"style": "<%= name %>"
}
