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

## Comparar commits (diffview.nvim)

Se agregó [diffview.nvim](https://github.com/sindrets/diffview.nvim)
(`lua/plugins/diffview.lua`) para comparar commits, branches y ver el
historial de un archivo directamente en Neovim.

| Comando | Acción |
|---|---|
| `:DiffviewOpen` | Muestra los cambios sin commitear (working tree vs HEAD) |
| `:DiffviewOpen <commit1>..<commit2>` | Compara dos commits/branches específicos |
| `:DiffviewOpen HEAD~3` | Compara contra un commit relativo (3 commits atrás) |
| `:DiffviewFileHistory %` | Historial de cambios del archivo actual |
| `:DiffviewFileHistory` | Historial de cambios de todo el repo |
| `:DiffviewClose` | Cierra la vista de diff |

Dentro de la vista de diff:

- El panel izquierdo lista los archivos cambiados; `Enter` o `<CR>` abre el
  diff del archivo seleccionado.
- `]c` / `[c` — saltar al siguiente/anterior cambio dentro del archivo.
- `<leader>e` — alternar el panel de archivos.

En el panel de archivos (izquierda), con el cursor sobre un archivo:

| Tecla | Acción |
|---|---|
| `-` | Stage / unstage el archivo seleccionado |
| `S` | Stage todos los archivos |
| `U` | Unstage todos los archivos |
| `X` | Descartar cambios del archivo seleccionado (restore) |

## Notas

- No se versiona `~/.local/share/nvim` (plugins instalados) ni
  `~/.local/state/nvim` (cache/logs) — se regeneran solos.
- Después de instalar plugins nuevos o actualizarlos, hacer commit de
  `lazy-lock.json` para mantener las mismas versiones en todos los equipos.
