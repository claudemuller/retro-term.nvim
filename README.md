# RetroTerm

A theme attempting to mimic the amber monitors of the 80s such as:

![[Dynax Amber Phosphor Monitor](https://henrylowe.net/wp-content/uploads/2024/12/tempimagebiujrh.jpg?w=768)](https://henrylowe.net/2024/12/01/a-1982-usi-pi3-amber-crt-monitor/)
![[IBM P75](https://e3bkpsfzr34.exactdn.com/wp-content/uploads/2020/09/IMG_0767_touched-scaled.jpg?lossy=1&w=755&ssl=1)](https://retropaq.com/the-most-powerful-portable-ibm-p75/)
![[Amdek 310a](https://litendeavor.wordpress.com/wp-content/uploads/2015/02/amber.jpg?w=660)](https://litendeavor.wordpress.com/2015/02/13/love-that-blinking-command-line/)


| Muted | Base (default) | Original |
| -------------------------- | -------------------------- | -------------------------- |
| ![muted](images/muted.png)         | ![base](images/base.png)         | ![original](images/original.png) |


## ⚡️ Requirements

- [Neovim](https://github.com/neovim/neovim) >= [0.8.0](https://github.com/neovim/neovim/releases/tag/v0.8.0)
- [mini.nvim](https://github.com/echasnovski/mini.nvim) (installed automatically with Lazy)

## 📦 Installation

Installation with [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  'claudemuller/retro-term.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'echasnovski/mini.nvim' },
  opts = {},
}
```

## 🚀 Usage

There are a few variants in RetroTerm, namely:

- `original` the closest to the monitors of old
- `base` a more muted version of 'original'
- `muted` an even more muted version of  'original'

Switching palettes can be done with:

```vim
:RetroTermSwitch original
:RetroTermSwitch base
:RetroTermSwitch muted
```

## 🛠️ Configuration

The default palette is `base`. Below is an example on how to specify the palette from config.

```lua
return {
  'claudemuller/retro-term.nvim',
  dependencies = { 'echasnovski/mini.nvim' },
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
     require('retro-term').setup { variant = 'base' } -- "muted" | "original" | "base"
  end,
}
```

