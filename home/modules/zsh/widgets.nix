{lib, ...}: {
  imports = (
    map (
      widget: {...}: {programs.zsh.initContent = lib.mkAfter widget;}
    )
    [
      ''
        # Resume on Ctrl-Z
        function Resume {
          zle push-input
          fg
          zle get-line
          zle redisplay
        }
        zle -N Resume
        bindkey "^Z" Resume
      ''

      ''
        # Open buffer in editor on Ctrl-X Ctrl-E
        autoload -Uz edit-command-line
        zle -N edit-command-line
        bindkey '^x^e' edit-command-line
      ''

      ''
        # Space to expand historical placeholders
        bindkey ' ' magic-space
      ''

      ''
        # NE, DN, NUL redirects
        alias -g NE='2>/dev/null'
        alias -g DN='>/dev/null'
        alias -g NUL='>/dev/null 2>&1'
        alias -g B='| bat'
      ''
    ]
  );
}
