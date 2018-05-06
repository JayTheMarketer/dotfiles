function fish_user_key_bindings



    ### sudo ###
    bind -M insert \es 'prepend_command sudo'
    ### sudo ###

    ### thefuck ###
    bind -M insert \ef 'thefuck-command-line'
    ### thefuck ###

    ### fzf ###
    if test "$FZF_LEGACY_KEYBINDINGS" -eq 1
        bind \ct '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \ec '__fzf_cd'
        bind \eC '__fzf_cd_with_hidden'
        if bind -M insert >/dev/null 2>/dev/null
            bind -M insert \ct '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \ec '__fzf_cd'
            bind -M insert \eC '__fzf_cd --hidden'
        end
    else
        bind \cf '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \eo '__fzf_cd'
        bind \eO '__fzf_cd --hidden'
        if bind -M insert >/dev/null 2>/dev/null
            bind -M insert \cf '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \eo '__fzf_cd'
            bind -M insert \eO '__fzf_cd --hidden'
        end
    end
    if set -q FZF_COMPLETE
        bind \t '__fzf_complete'
    end
    ### fzf ###
    ### pisces ###
    set -l _pisces_bind_mode default
    switch $fish_key_bindings
        case 'fish_vi_key_bindings' 'fish_hybrid_key_bindings'
            set _pisces_bind_mode insert
    end
    set -q pisces_pairs
    or set -U pisces_pairs '(,)' '[,]' '{,}' '","' "','"
    for pair in $pisces_pairs
        _pisces_bind_pair $_pisces_bind_mode (string split -- ',' $pair)
    end
    bind -M $_pisces_bind_mode \b _pisces_backspace
    bind -M $_pisces_bind_mode \177 _pisces_backspace
    bind -M $_pisces_bind_mode \t _pisces_complete
    ### pisces ###
end
