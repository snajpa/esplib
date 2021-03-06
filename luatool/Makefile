BAUD=115200
TERM=miniterm.py
TELNET=telnet
DEVICE=/dev/ttyUSB0
IPADDR=

FILE_LIST = \
	    ap.lua \
	    apclient.lua \
	    blink.lua \
	    init.lua \
	    config.lua \
	    main.lua \
	    pins.lua \
	    wifi_client.lua

FULL_FILE_LIST = \
	    ap.lua \
	    adc.lua \
	    apclient.lua \
	    debounce.lua \
	    debounce2.lua \
	    enduser.lua \
	    init.lua \
	    int.lua \
	    list.lua \
	    blink.lua \
	    config.lua \
	    main.lua \
	    check.lua \
	    pins.lua \
	    pwm.lua \
	    signal.lua \
	    sense.lua \
	    sntp.lua \
	    wait_wifi.lua \
	    wifi_scan.lua \
	    wifi_mon.lua \
	    wifi_client.lua \
	    telnetsrv.lua \
	    bridge.lua \
	    udpsrv.lua \

ifeq ($(IPADDR),)
CMD=./luatool.py --delay 0.1 -b $(BAUD) -p $(DEVICE) -f
else
CMD=./luatool.py --delay 0.1 --ip $(IPADDR) -f
endif

INITLIST=$(FILE_LIST:.lua=.luac)
CLIST=$(FILE_LIST:.lua=.luac)

$(CLIST):
	$(CMD) `echo $@ | sed 's/.luac/.lua/'`

$(INITLIST):
	$(CMD) `echo $@ | sed 's/.luac/.lua/'`

term:
ifeq ($(IPADDR),)
	$(TERM) $(DEVICE) $(BAUD)
else
	$(TELNET) $(IPADDR) 23
endif

killminiterm:
	-/usr/bin/pkill -f '$(TERM) $(DEVICE)'

reset:
	stty -F $(DEVICE) $(BAUD)
	echo -e "\r\n" > $(DEVICE)
	echo -e "node.restart()\r\n" | tee | cat > $(DEVICE)
	echo -e "\r\n" > $(DEVICE)

init: killminiterm $(INITLIST)
all: killminiterm $(CLIST)
# all
slider: 
	$(CMD) main_slider.lua -t main.lua
	$(CMD) pins_slider.lua -t pins.lua

doorbel:
	$(CMD) main_doorbel.lua -t main.lua
	$(CMD) pins_doorbel.lua -t pins.lua

lights:
	$(CMD) main_lights.lua -t main.lua
	$(CMD) pins_lights.lua -t pins.lua

gps:
	$(CMD) main_gps.lua -t main.lua
	$(CMD) config_gps.lua -t config.lua
#	$(CMD) pins_gps.lua -t pins.lua
quad:
	$(CMD) main_quad.lua -t main.lua

ws:
	$(CMD) main_ws.lua -t main.lua
	$(CMD) pins_ws.lua -t pins.lua
	$(CMD) wifi_ws2812.lua
	$(CMD) wait_wifi.lua

vu:
	$(CMD) main_vu.lua -t main.lua
	$(CMD) pins_vu.lua -t pins.lua
	$(CMD) telnetsrv.lua
	$(CMD) udpsrv.lua

vu2:
	$(CMD) main_vu2.lua -t main.lua
	$(CMD) pins_vu.lua -t pins.lua
	$(CMD) udpsrv.lua

wsblink:
	$(CMD) main_wsblink.lua -t main.lua
	$(CMD) pins_ws.lua -t pins.lua
	$(CMD) udpsrv.lua

bridge:
	$(CMD) main_bridge.lua -t main.lua
	$(CMD) bridge.lua

funky_bridge:
	$(CMD) main_funky_bridge.lua -t main.lua
	$(CMD) funky_bridge.lua
	$(CMD) ws2812.lua

plotter:
	$(CMD) main_plotter.lua -t main.lua
	$(CMD) pins_plotter.lua -t pins.lua
	$(CMD) stepper.lua

triac:
	$(CMD) main_triac.lua -t main.lua
	$(CMD) pins_triac.lua -t pins.lua

printroom:
	$(CMD) main_printroom.lua -t main.lua
	$(CMD) pins_printroom.lua -t pins.lua
	$(CMD) ws2812.lua

telnetsrv:
	$(CMD) main_telnetsrv.lua -t main.lua
	$(CMD) telnetsrv.lua

wsleds:
	$(CMD) main_wsleds.lua -t main.lua
	$(CMD) pins_wsleds.lua -t pins.lua
	$(CMD) telnetsrv.lua
	$(CMD) ws2812udp.lua
