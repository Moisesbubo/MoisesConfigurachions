if status is-interactive
    # Commands to run in interactive sessions can go here
    set -l random_image (ls ~/Imagens/Ana_photos/* | shuf -n 1)
    jp2a --colors --width=40 $random_image
    set -U fish_greeting "Hello everyone"
end
