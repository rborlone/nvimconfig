# nvim config

Configuración personal de Neovim basada en [LazyVim](https://github.com/LazyVim/LazyVim).

## Instalación en un equipo nuevo

```sh
git clone git@github.com:rborlone/nvimconfig.git ~/.config/nvim
nvim
```

Al abrir `nvim` por primera vez, Lazy instala automáticamente todos los plugins
usando las versiones fijadas en `lazy-lock.json`.

## Notas

- No se versiona `~/.local/share/nvim` (plugins instalados) ni
  `~/.local/state/nvim` (cache/logs) — se regeneran solos.
- Después de instalar plugins nuevos o actualizarlos, hacer commit de
  `lazy-lock.json` para mantener las mismas versiones en todos los equipos.
