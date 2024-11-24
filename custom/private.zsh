
os_type=$(uname -s)
if [[ "${os_type}" = "Linux" ]]; then
    source /etc/os-release
    case $ID in
        arch | endeavouros)
            # Intellij IDEs
            ___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"
            if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then
                . "${___MY_VMOPTIONS_SHELL_FILE}"
            fi
            ;;
        *)
            ;;
    esac
fi
