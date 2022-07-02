 grep -i type config.yml | awk '{ print $2 }' | tr -d '"'
