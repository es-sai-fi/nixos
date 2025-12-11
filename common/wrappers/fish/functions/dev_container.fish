function dev_container
    set port 5173
    if test (count $argv) -ge 1
        set port $argv[1]
    end

    podman run \
        --userns=keep-id \
        -it \
        --rm \
        -v (pwd):/home/devuser/workspace \
        -w /home/devuser/workspace \
        -p $port:$port \
        ghcr.io/es-sai-fi/dev:latest
end
