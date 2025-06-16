# loads ~/.zsh_secrets if it exists
if not test -f ~/.zsh_secrets
    echo "Secrets file not found"
else
    source ~/.zsh_secrets
end
