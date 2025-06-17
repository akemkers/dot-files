function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l normal (set_color normal)
    set -l status_color (set_color brgreen)
    set -l cwd_color (set_color $fish_color_cwd)
    set -l vcs_color (set_color brpurple)
    set -l prompt_status ""

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    # Color the prompt differently when we're root
    set -l suffix '❯'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root)
        end
        set suffix '#'
    end

    # Color the prompt in red on error
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error)
        set prompt_status $status_color "[" $last_status "]" $normal
    end

    # Git status only if inside a Git repo
    set -l vcs_output (fish_vcs_prompt)
    if test -n "$vcs_output"
        set vcs_output ' '$vcs_output
    end

    echo -s $cwd_color (prompt_pwd) $vcs_color $vcs_output $normal ' ' 
    echo -n -s $status_color $suffix ' ' $normal
end

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color $fish_color_command
      echo 'N '
    case insert
      set_color --bold green
      echo 'I '
    case replace_one
      set_color --bold green
      echo 'R '
    case visual
      set_color --bold brmagenta
      echo 'V '
    case '* '
      set_color --bold red
      echo '? '
  end
  set_color normal
end
