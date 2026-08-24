# nvim config

Configuración personal de Neovim basada en [LazyVim](https://github.com/LazyVim/LazyVim).

## Instalación en un equipo nuevo

```sh
git clone git@github.com:rborlone/nvimconfig.git ~/.config/nvim
nvim
```

Al abrir `nvim` por primera vez, Lazy instala automáticamente todos los plugins
usando las versiones fijadas en `lazy-lock.json`.

## Atajos estilo VSCode

Además de los mapeos `<leader>...` por defecto de LazyVim, en
`lua/config/keymaps.lua` se agregaron atajos estilo VSCode para navegar el
código (no reemplazan los de LazyVim, son adicionales):

| Tecla | Acción |
|---|---|
| `Ctrl+P` | Quick Open (buscar archivo por nombre) |
| `Ctrl+Shift+P` | Command Palette |
| `Ctrl+Shift+F` | Search in Files (grep en todo el proyecto) |
| `Ctrl+B` / `Ctrl+Shift+E` | Toggle Explorer (sidebar de archivos) |
| `Ctrl+Shift+O` | Go to Symbol in File |
| `Ctrl+T` | Go to Symbol in Workspace |
| `F12` | Go to Definition |
| `Shift+F12` | Go to References |
| `Ctrl+F12` | Go to Implementation |
| `F2` | Rename Symbol |
| `Ctrl+G` | Go to Line |
| `Alt+Left` | Go Back (jumplist) |
| `Alt+Right` | Go Forward (jumplist) |
| `Ctrl+Tab` | Next editor tab (buffer) |
| `Ctrl+Shift+Tab` | Previous editor tab (buffer) |

Atajos que ya existían por defecto en LazyVim y no se tocaron:

- `Ctrl+S` — guardar archivo.
- `Ctrl+/` — abrir/enfocar terminal flotante.

El explorador de archivos (`Ctrl+B`) requiere el extra
`lazyvim.plugins.extras.editor.snacks_explorer` (ya habilitado en
`lazyvim.json`); si `nvim` pide sincronizar plugins nuevos, correr `:Lazy sync`.

## Notas

- No se versiona `~/.local/share/nvim` (plugins instalados) ni
  `~/.local/state/nvim` (cache/logs) — se regeneran solos.
- Después de instalar plugins nuevos o actualizarlos, hacer commit de
  `lazy-lock.json` para mantener las mismas versiones en todos los equipos.
