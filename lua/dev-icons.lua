require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  html = {
    icon = "",
    color = "#F2672E",
    name = "Html"
  },
css = {
    icon = "",
    color = "#2DA8DB",
    name = "Css"
  },
js = {
    icon = "",
    color = "#F2BF26",
    name = "JavaScript"
  },
vim = {
    icon = "",
    color = "#18903D",
    name = "Vim"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
