set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
source /usr/share/powerline/bindings/fish/powerline-setup.fish
powerline-setup

fish_ssh_agent

for file in /etc/profile.d/*.sh
        bass source $file
end

