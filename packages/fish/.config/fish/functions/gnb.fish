function gnb --description 'Create new branch from latest origin/main'
    if test (count $argv) -eq 0
        echo "Usage: gnb <branch-name>"
        return 1
    end
    git fetch origin main
    and git checkout -b $argv[1] origin/main
    and git push -u origin $argv[1]
end
