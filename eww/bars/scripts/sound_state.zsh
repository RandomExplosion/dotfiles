#!/usr/bin/env zsh

# mic_source=$(pactl info | grep "Default Source" | awk '{print$3}')

# TODO: Accept sink/source id from $2? (Handling of nondefault sources and sinks can then be handled in eww?) 

case "$1" in
    siv | sink-volume)
        function sink_volume() {
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
        sink_volume | stdbuf -oL -eL uniq | cat
        ;;
    sims | sink-mute-state)
        function sink_mute_state() {
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
        sink_mute_state | stdbuf -oL -eL uniq | cat
        ;;
    sov | source-vol )
        function source_volume (){
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
        source_volume | stdbuf -oL -eL uniq | cat
        ;;
    soms | source-mute-state)
        function source_mute_state() {
            # Get and return mute state for default source
            if [[ $( wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep "\ \[MUTED\]") ]]; then
                echo true
            else
                echo false
            fi
            
            # Listen for changes in pipewire (no way to subscribe to wireplumber yet)
            pw-mon |
            # TODO: Find a better string to search for
            grep --line-buffered "changed:" |
            while read -r _; do
                # Get and return mute state for defualt source
                if [[ $( wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep "\ \[MUTED\]") ]]; then
                    echo true
                else
                    echo false
                fi
            done
        }
        source_mute_state | stdbuf -oL -eL uniq | cat
        ;;
esac