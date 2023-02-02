
window.addEventListener('DOMContentLoaded', () => {
	const isAdmin = window.acf !== undefined;

	if (document.readyState == 'interactive' || document.readystate == 'complete') {
			initExampleBlock(isAdmin);
	}
})

function initExampleBlock(isAdmin) {
	// add block code here
	if (isAdmin) {
		console.log("new-block block ready in editor");
	} else {
		console.log("new-block block ready in front end");
	}
}