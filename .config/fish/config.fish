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

function bars
    set -l bar_dir ~/.config/sketchybar/bars
    
    if count $argv > /dev/null
        # Direct mode: use the argument provided
        set -l selected $argv[1]
        if test -f "$bar_dir/$selected"
            # Update the sketchybarrc variable line
            sed -i '' "s/SELECTED_CONFIG=\".*\"/SELECTED_CONFIG=\"$selected\"/" ~/.config/sketchybar/sketchybarrc
            brew services restart sketchybar
            echo "Switched to $selected"
        else
            echo "Error: Bar '$selected' not found in $bar_dir"
        end
    else
        # Interactive mode: use fzf
        set -l selected (ls $bar_dir | fzf --layout=reverse --color=bw --height=40% --border)
        
        if test -n "$selected"
            sed -i '' "s/SELECTED_CONFIG=\".*\"/SELECTED_CONFIG=\"$selected\"/" ~/.config/sketchybar/sketchybarrc
            brew services restart sketchybar
        end
    end
end

if status is-interactive
    set -g fish_greeting ""
    starship init fish | source
end

