pactl load-module module-null-sink sink_name=factorio
pactl move-sink-input $INDEX steam
pactl load-module module-loopback latency_msec=1
