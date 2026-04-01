fish_add_path /Users/imjamnotjelly/.spicetify

function walls
    set -l wall_dir ~/Pictures/Wallpapers 
    
    ls $wall_dir | fzf \
        --layout=reverse \
        --color=bw \
        --preview-window="right:80%:border-left" \
        --preview="kitten icat --clear --silent --transfer-mode file --stdin no --place 150x150@85x2 $wall_dir/{}" \
        --bind "enter:execute(osascript -e 'tell application \"System Events\" to tell every desktop to set picture to \"$wall_dir/{}\"')+abort"
end

if status is-interactive
    set -g fish_greeting ""
    starship init fish | source
end

