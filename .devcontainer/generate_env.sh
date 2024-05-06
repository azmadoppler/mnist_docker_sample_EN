cat <<EOF > $(cd $(dirname $0)/..;pwd)/.env
USER_NAME=$(id -un)
USER_UID=$(id -u)
USER_GID=$(id -g)
EOF
