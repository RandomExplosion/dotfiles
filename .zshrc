# Alias Helix to hx for my sanity
alias hx=helix

# Alias to get ip of dns record
alias resolve-hostname='(){ host $1 | awk "/has address/ { print $4 }"}'

# Aliases for 2h30m Exam
#                                  # Set Floating   # Set Window Dimensions # Bind to Output # Move to TR (4K Screen)  # Start Reading Time "respawn noise" - suppress stdout and fork             # Reading time timer                        # End Reading Time "Begin" - suppress stdout and fork to background         # Writing Time Timer                          # End Writing "Overtime" - suppress stdout and fork to background              # Overtime Timer
alias termdown-exam-2h30m='swaymsg floating enable, resize set 500px 250px, sticky enable,   move position 1396px 0px; pw-cat -p /home/${USER}/Audio/Timers/tf2_respawn.wav > /dev/null & disown; termdown -f banner3 -T Reading\ Time 15m && pw-cat -p /home/${HOME}/Audio/Timers/Helen_Begin.wav > /dev/null & disown; termdown -f banner3 -T Writing\ Time 2h30m && pw-cat -p /home/${HOME}/Audio/Timers/Helen_Overtime.wav > /dev/null & disown; termdown -f banner3 -T OverTime' 

# Aliases for 2h30m Exam
#                                  # Set Floating   # Set Window Dimensions # Bind to Output # Move to TR (4K Screen)  # Start Reading Time "respawn noise" - suppress stdout and fork             # Reading time timer                        # End Reading Time "Begin" - suppress stdout and fork to background         # Writing Time Timer                          # Begin Extra Time - suppress stdout and fork to background                      # Extra Time Timer                      # End Writing "Overtime" - suppress stdout and fork to background              # Overtime Timer
alias termdown-exam-2h30m='swaymsg floating enable, resize set 500px 250px, sticky enable,   move position 1396px 0px; pw-cat -p /home/${HOME}/Audio/Timers/tf2_respawn.wav > /dev/null & disown; termdown -f banner3 -T Reading\ Time 15m && pw-cat -p /home/${HOME}/Audio/Timers/Helen_Begin.wav > /dev/null & disown; termdown -f banner3 -T Writing\ Time 2h30m && pw-cat -p /home/${HOME}/Audio/Timers/Helen_time_added.wav > /dev/null & disown; termdown -f banner3 -T Extra\ Time 25m; pw-cat -p /home/${HOME}/Audio/Timers/Helen_Overtime.wav > /dev/null & disown; termdown -f banner3 -T OverTime' 
# Alias for 2h
#                                  # Set Floating   # Set Window Dimensions # Bind to Output # Move to TR (4K Screen)  # Start Reading Time "respawn noise" - suppress stdout and fork             # Reading time timer                        # End Reading Time "Begin" - suppress stdout and fork to background         # Writing Time Timer                          # Begin Extra Time - suppress stdout and fork to background                      # Extra Time Timer                      # End Writing "Overtime" - suppress stdout and fork to background              # Overtime Timer
alias termdown-exam-2h='swaymsg floating enable, resize set 500px 250px, sticky enable,   move position 1396px 0px; pw-cat -p /home/${HOME}/Audio/Timers/tf2_respawn.wav > /dev/null & disown; termdown -f banner3 -T Reading\ Time 15m && pw-cat -p /home/${HOME}/Audio/Timers/Helen_Begin.wav > /dev/null & disown; termdown -f banner3 -T Writing\ Time 2h    && pw-cat -p /home/${HOME}/Audio/Timers/Helen_time_added.wav > /dev/null & disown; termdown -f banner3 -T Extra\ Time 20m; pw-cat -p /home/${HOME}/Audio/Timers/Helen_Overtime.wav > /dev/null & disown; termdown -f banner3 -T OverTime' 

# Termdown break
alias termdown-break-10m='(){}'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)
#
# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/${HOME}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/dotfiles/.p10k.zsh.
[[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh

# Start Sway
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec sway --unsupported-gpu
#fi