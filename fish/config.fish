set -l random_image (ls ~/Imagens/Ana_photos/* | shuf -n 1)
jp2a --colors --width=40 $random_image

function fish_user_key_bindings
    fish_vi_key_bindings

    # complete
    bind -M insert \cf forward-char 
end
