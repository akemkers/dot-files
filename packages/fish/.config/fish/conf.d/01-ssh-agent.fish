# Loads the SSH Agent and adds identities
if not pgrep -u (id -u) ssh-agent > /dev/null
    echo "Starting SSH Agent"
    eval (ssh-agent -c)
end

# Add identities if none are added
if not ssh-add -l > /dev/null 2>&1
    echo "Adding identities to SSH Agent"
    for key in (find ~/.ssh -type f -name 'id_*' -not -name '*.pub')
        ssh-add $key
    end
end
