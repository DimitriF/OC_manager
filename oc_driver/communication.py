from printrun import printcore, gcoder

#import time

class Communication:
    def __init__(self, connection_string, baud_rate):
        self.connection_string = connection_string
        self.baud_rate = baud_rate
        self.printcore = printcore.printcore()

    def connect(self):
        self.printcore.connect(self.connection_string, self.baud_rate)
        self.printcore.listen_until_online()
        
    def is_connected(self):
        return self.printcore.online
        
    def disconnect(self):
        self.printcore.disconnect()
        
    def send_from_file(self, path):
        print(gcoder)
        gcode = [i.strip() for i in open(path)]
        self.send(gcode)
        # while (.printcore.printing):
        #    time.sleep(0.1)
    
    
    def send(self, codes):
        gcode = gcoder.LightGCode(codes)    
        is_printing = self.printcore.startprint(gcode)
        if(is_printing):
            print("Start printing...")
        else:
            print("Cannot print...")
            
