
function __complete_terraform
    set -lx COMP_LINE (string join ' ' (commandline -o))
    test (commandline -ct) = ""
    and set COMP_LINE "$COMP_LINE "
    /var/lib/tfenv/versions/0.12.28/terraform
end
complete -c terraform -a "(__complete_terraform)"

