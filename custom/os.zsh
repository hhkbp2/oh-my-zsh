
## Linux
os_type=$(uname -s)
if [[ "${os_type}" = "Linux" ]]; then
    source /etc/os-release
    case $ID in
        debian)
            http_proxy_on() {
                export http_proxy=http://192.168.56.1:7890
                export https_proxy=http://192.168.56.1:7890
            }

            http_proxy_off() {
                unset http_proxy
                unset https_proxy
            }

            # texlive
            if [[ -d "${MY_DIR}/local/opt/texlive/bin/x86_64-linux" ]]; then
                export PATH="${MY_DIR}/local/opt/texlive/bin/x86_64-linux:$PATH"
            fi
            ;;
        arch)
            http_proxy_on() {
                export http_proxy=http://192.168.229.1:7890
                export https_proxy=http://192.168.229.1:7890
            }

            http_proxy_off() {
                unset http_proxy
                unset https_proxy
            }

            # texlive
            if [[ -d "${MY_DIR}/local/opt/texlive/bin/x86_64-linux" ]]; then
                export PATH="${MY_DIR}/local/opt/texlive/bin/x86_64-linux:$PATH"
            fi
            ;;
        centos)
            http_proxy_on() {
                export http_proxy=http://192.168.56.1:7890
                export https_proxy=http://192.168.56.1:7890
            }

            http_proxy_off() {
                unset http_proxy
                unset https_proxy
            }

            # pkg-config
            if [[ -d /usr/lib64/pkgconfig ]]; then
                if [[ -z "${PKG_CONFIG_PATH}" ]]; then
                    export PKG_CONFIG_PATH=/usr/lib64/pkgconfig
                else
                    export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:$PKG_CONFIG_PATH
                fi
            fi
            if [[ -d /usr/local/lib/pkgconfig/ ]]; then
                export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
            fi

            # tiup
            if [[ -d "${HOME}/.tiup/bin" ]]; then
                export PATH="${HOME}/.tiup/bin":$PATH
            fi
            ;;
        *)
            ;;
    esac
fi

## macOS
if [[ "${os_type}" = "Darwin" ]]; then
    # for Mac OS X
    # Mountain Lion (version 10.8)
    # Lion (version 10.7)
    # and Sierra (version 10.12) above
    function clean-dns {
        sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder
    }

    # for Mac OS X
    # El Capitan (version 10.11)
    # Mavericks (version 10.9)
    # function clean-dns {
    #     sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder
    # }
fi
