ws_pin = 6   -- Comment: GPIO12

g = 0  
r = 255  
b = 0  
ws_str = string.char(g, r, b)  
ws2812.write(ws_pin, ws_str))
