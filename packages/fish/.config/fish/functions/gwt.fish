function gwt --description 'Switch git worktree using fzf'
    cd (git worktree list | fzf | awk '{print $1}')
end
