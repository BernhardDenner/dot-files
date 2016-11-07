# common functions to shell scripts


function bailout() {
	echo $@
	exit 1
}

# requires $ENV_DIR and $TARGET_DIR
# 
function install_env_link() {
	local source="${ENV_DIR}/$1"
	local target="${TARGET_DIR}/$2"

	# if target exists and is a link, remove it
	[ -L "${target}" ] && rm -f "${target}"
	# if target exists and is a file, backupit
	[ -e "${target}" ] && mv "${target}" "${target}.env-bak"
	ln -sfv "$source" "$target"
}


