// see types of prompts:
// https://github.com/enquirer/enquirer#built-in-prompts

module.exports = [
	{
		type: "input",
		name: "theme_name",
		message: "What's your theme name?",
	},
	{
		type: "input",
		name: "theme_description",
		message: "Add a description for your theme",
	},
	{
		type: "list",
		name: "theme_colors",
		message:
			"Add theme colors, comma separated (e.g. blue: #978edf, red: #d73b23)",
	},
	{
		type: "input",
		name: "staging_server",
		message:
			"What is the name of the staging server where this will be deployed?",
	},
	{
		type: "input",
		name: "application_name",
		message:
			"What is the name of the project on the server? This may be subtly different than the theme name.",
	},
];
