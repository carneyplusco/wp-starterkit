---
to: blocks/<%= title.toLowerCase().replace(' ', '-') %>/<%= title.toLowerCase().replace(' ', '-') %>.js
---
<% functionName = 'init' + title.replace(/(?:^\w|[A-Z]|\b\w)/g, (ltr, idx) => ltr.toUpperCase()).replace(/\s+/g, ''); %>
window.addEventListener('DOMContentLoaded', () => {
	const isAdmin = window.acf !== undefined;

	if (document.readyState == 'interactive' || document.readystate == 'complete') {
			<%= functionName %>(isAdmin);
	}
})

function <%= functionName %>(isAdmin) {
	// add block code here
	if (isAdmin) {
		console.log("new-block block ready in editor");
	} else {
		console.log("new-block block ready in front end");
	}
}