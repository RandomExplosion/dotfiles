#!/usr/bin/env zsh

wrap() {
    local onclick="\"onclick\":\"$1\""
    local label="\"text\":\"$2\""
    local class="\"class\":\"$3\""
    echo "{$onclick,$label,$class}"
}

pack() {
#    workspaces+=`i3-msg -t get_workspaces | jshon -a -e name -u -p -e focused -u | sed -En -z "s/([^\n]*)\ntrue/$(tput smul)\1$(tput sgr0)\ntrue/pg" | awk 'NR%2==1' | xargs`
#    workspaces+=`i3-msg -t get_workspaces | jshon -a -e name | sed -En -z "s/([^\n]*)\ntrue/$\"\1$\"\,\ntrue/pg" | xargs`
    i3-msg -t get_workspaces
}

pack
i3-msg -t subscribe -m '[ "window" ]' | while read -r _; do
    pack
done

# OLD BSPWM VERSION

# wrap() {
#     local onclick="\"onclick\":\"$1\""
#     local label="\"text\":\"$2\""
#     local class="\"class\":\"$3\""
#     echo "{$onclick,$label,$class}"
# }

# pack() {
#     workspaces=(1 2 3 4 5 6 7)
#     buffer="["
#     for val in "${workspaces[@]}"; do
#         if bspc query -D -d focused --names | grep -q "$val"; then
#             buffer+="$(wrap "bspc desktop -f $val" "" "focused_workspace"),"
#         elif bspc query -D -d .occupied --names | grep -q "$val"; then
#             buffer+="$(wrap "bspc desktop -f $val" "" "occupied_workspace glyph"),"
#         else
#             buffer+="$(wrap "bspc desktop -f $val" "" "empty_workspace glyph"),"
#         fi
#     done

#     buffer="${buffer::-1}]" # strip the trailing comma and terminate
#     echo "$buffer" | awk '{print}'
# }

# pack
# bspc subscribe desktop node_transfer | while read -r _; do
#     pack
# done