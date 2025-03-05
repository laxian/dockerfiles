

linux-run:
	docker run -itd --privileged -p 2222:22 -p 5902:5902 -p 5901:5901 -v ~/docker:/docker --device=/dev/bus/usb/002/017 -v /var/run/dbus:/var/run/dbus -e DBUS_SESSION_BUS_ADDRESS=/var/run/dbus/session-bus -e XDG_RUNTIME_DIR=/tmp/xdg_runtime_dir rust-vnc-image:v4
	
	docker run -itd 
	--privileged 
	-p 2222:22 -p 5902:5902 -p 5901:5901 
	-v ~/docker:/docker 
	-v /var/run/dbus:/var/run/dbus 
	-e DBUS_SESSION_BUS_ADDRESS=/var/run/dbus/session-bus 
	-e XDG_RUNTIME_DIR=/tmp/xdg_runtime_dir 
	634797810193


	docker run -itd \
	--privileged \
	-p 2222:22 -p 5902:5902 -p 5901:5901 \
	-v ~/docker:/docker \
	-v /dev:/dev \
	-v /var/run/dbus:/var/run/dbus \
	-v /run/user/1000/bus:/run/user/1000/bus \
	-e DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus \
	-e XDG_RUNTIME_DIR=/tmp/xdg_runtime_dir \
	634797810193

