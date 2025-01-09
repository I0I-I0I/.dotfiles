function vol
    if test -z $argv[1]
        echo "Usage: vol <percentage>"
        return 1
    end

    pactl set-sink-volume @DEFAULT_SINK@ $argv[1]%
end
