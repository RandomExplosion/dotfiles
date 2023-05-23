#!/usr/bin/env zsh

mic_source=$(pactl info | grep "Default Source" | awk '{print$3}')

case "$1" in
    -v | --volume)
        function volume() {
            # Get the initial volume of the default sink
            wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed s/"Volume: "// | sed s/"\ \[MUTED\]"//
            # Listen for changes in pipewire (no way to subscribe to wireplumber yet)
            pw-mon |
            # TODO: Find a better string to search for
            grep --line-buffered "changed:" |
            while read -r _; do
                wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed s/"Volume: "// | sed s/"\ \[MUTED\]"//
            done
        }
        volume | stdbuf -oL -eL uniq | cat
        ;;
    -s | --state)
        function state() {
            # Get and return mute state for defualt sink
            if [[ $( wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep "\ \[MUTED\]") ]]; then
                echo true
            else
                echo false
            fi
            
            # Listen for changes in pipewire (no way to subscribe to wireplumber yet)
            pw-mon |
            # TODO: Find a better string to search for
            grep --line-buffered "changed:" |
            while read -r _; do
                # Get and return mute state for defualt sink
                if [[ $( wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep "\ \[MUTED\]") ]]; then
                    echo true
                else
                    echo false
                fi
            done
        }
        state | stdbuf -oL -eL uniq | cat
        ;;
    -mc|--mic_check)
        function mic_state(){
            # Get and return mute state for defualt source
            if [[ $( wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep "\ \[MUTED\]") ]]; then
                echo true
            else
                echo false
            fi

            # Listen for changes in pipewire (no way to subscribe to wireplumber yet)
            pw-mon |
            # TODO: Find a better string to search for
            grep --line-buffered "changed: " |
            while read -r _; do
                # Get and return mute state for defualt source
                if [[ $( wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep "\ \[MUTED\]") ]]; then
                    echo true
                else
                    echo false
                fi
            done
        }
        mic_state
        ;;
    -mt|--mic_toggle)
        function mic_toggle() {
            wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        }
        mic_toggle
        ;;
    -mic_up)
        wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+
        ;;
    -mic_down)
        wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-
        ;;
    -mic_vol)
        function mic_volume (){
            # Get the initial volume of the default source
            wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | sed s/"Volume: "// | sed s/"\ \[MUTED\]"//
            # Listen for changes in pipewire (no way to subscribe to wireplumber yet)
            pw-mon |
            # TODO: Find a better string to search for
            grep --line-buffered "changed:" |
            while read -r _; do
                wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | sed s/"Volume: "// | sed s/"\ \[MUTED\]"//
            done
        }
        mic_volume | stdbuf -oL -eL uniq | cat
        ;;
esac