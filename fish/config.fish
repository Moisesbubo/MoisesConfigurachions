#ASCII Image of Ana
set -l random_image (ls ~/Imagens/Ana_photos/* | shuf -n 1)
jp2a --colors --width=40 $random_image

function fish_user_key_bindings
#Set Vi Keybindings 
    fish_vi_key_bindings
#Set ctrl f to complete 
    bind -M insert \cf forward-char 
end
