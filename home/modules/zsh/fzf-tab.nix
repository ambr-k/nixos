{
  pkgs,
  lib,
  ...
}: {
  home.packages = [pkgs.zsh-fzf-tab];
  programs.zsh.initContent = lib.mkAfter ''
    source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

    # disable sort when completing `git checkout`
    zstyle ':completion:*:git-checkout:*' sort false
    # set descriptions format to enable group support
    # NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
    zstyle ':completion:*:descriptions' format '[%d]'
    # set list-colors to enable filename colorizing
    zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
    # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
    zstyle ':completion:*' menu no

    # preview directories with eza, files with bat
    zstyle ":fzf-tab:complete:*:*" fzf-preview '
      if [[ ! -v realpath ]]; then
        echo ''${desc:s/ -- /\\n} | fold -sw $FZF_PREVIEW_COLUMNS
      elif  [[ -d $realpath ]]; then
        eza -1 --color=always --icons=auto --group-directories-last $realpath
      else
        bat -n --color=always $realpath
      fi
    '
    # don't run preview on dashed options
    zstyle ':fzf-tab:complete:*:options' fzf-preview
    # expand env-var and commands
    zstyle ':fzf-tab:complete:-parameter-:*' fzf-preview 'printenv $word'
    zstyle ':fzf-tab:complete:-command-:*' fzf-preview 'which $word'
    # kill/ps arguments
    zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w | fold -sw $FZF_PREVIEW_COLUMNS'

    # custom fzf flags
    # NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
    zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2
    # To make fzf-tab follow FZF_DEFAULT_OPTS.
    # NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
    zstyle ':fzf-tab:*' use-fzf-default-opts yes
    # switch group using `<` and `>`
    zstyle ':fzf-tab:*' switch-group '<' '>'
  '';
}
