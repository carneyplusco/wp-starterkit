// see types of prompts:
// https://github.com/enquirer/enquirer#built-in-prompts

module.exports = [
  {
    type: 'input',
    name: 'theme_name',
    message: "What's your theme name?"
  },
  {
    type: 'input',
    name: 'theme_description',
    message: "Add a description for your theme"
  },
  {
    type: 'list',
    name: 'theme_colors',
    message: 'Add theme colors, comma separated (e.g. blue: #978edf, red: #d73b23)'
  }
]
