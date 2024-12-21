# resize-font.nvim

## Install

Using LazyVim:

```lua
{
    "fambalaya/resize-font.nvim",
    opts = {},
    keys = { "<C-->", "<C-=>", "C-ScroolWheelUp>", "C-ScroolWheelDown" }
}
```

## Config

Default:

```lua
{
    min = 1,
    max = 50,
    keymaps = {
        zoom_in = { "<C-=>", "<C-ScroolWheelUp>" },
        zoom_out = { "<C-->", "<C-ScroolWheelDown>" },
    },
}
```
