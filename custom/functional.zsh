# the functionals

is_option_set() {
    if [[ -o $1 ]]; then
        print "set"
    else
        print "not set"
    fi
}

switch_locale_zh() {
    export LANG=zh_CN.UTF-8
    export LANGUAGE=zh_CN.UTF-8
    export LC_ALL=zh_CN.UTF-8
    export LC_CTYPE=zh_CN.UTF-8
}

switch_locale_en() {
    export LANG=en_US.UTF-8
    export LANGUAGE=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    export LC_CTYPE=en_US.UTF-8
}
