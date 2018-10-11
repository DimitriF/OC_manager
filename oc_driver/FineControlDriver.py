import gcodes as GCODES 


class FineControlDriver:

    def __init__(self, printcore):
        self.printcore = printcore 

    def send(self, code):
        self.printcore.send(code)

    def goXLeft(self):
        self.send(GCODES.SET_REFERENCE)
        self.send(GCODES.goXMinus(5))
        self.printcore.Print()

    def goXRight(self):
        pass

    def customCommand(self):
        pass

    def xHome(self):
        pass

    def goYUp(self):
        pass

    def yHome(self):
        pass
        
    def goYDown(self):
        pass

    def stop(self):
        pass

    def applyCommands(self):
        pass 
        

    
   #  self.printer = printer 
    
    # structure( class = "FineControlDriver",
              
    #           list (
    #               send = function(code) {
    #                   printer$send(code)
                      
    #               },

    #               goXLeft = function() {
    #                   send(gcodeCommands$setReference())
    #                   send(gcodeCommands$goXMinus())
    #                   printer$Print()
    #               },
                  
    #               goXRight = function() {
    #                   send(gcodeCommands$setReference())
    #                   send(gcodeCommands$goXPlus())
    #                   printer$Print()
    #               },
                  
                  
    #               customCommand = function(code) {
    #                   send(gcodeCommands.customGCode(code))
    #                   printer$Print()
    #               },
                  
                  
    #               xHome = function(){
    #                   send(gcodeCommands$home())
    #                   send(gcodeCommands$goXRight("0"))
    #                   send(gcodeCommands$setAbsolutePos())
    #                   printer$Print()
    #               },
                  
                  
                  
    #               goYUp = function () {
    #                   send(gcodeCommands$setReference())
    #                   send(gcodeCommands$goPlus())
    #                   printer$Print()
    #               },
                  
    #               yHome = function () {
    #                   send(gcodeCommands$home())
    #                   send(printer$send("G28 Y0\nG90"))
    #                   printer$Print()
    #               },
    #               goYDown = function () {
    #                   send(gcodeCommands$setReference())
    #                   send(gcodeCommands$goYMinus())
    #                   printer$Print()
    #               },
    #               stop = function () {
    #                   send(printer$send("M18"))
    #                   printer$Print()
    #               },
                  
    #               applyCommands = function(commandList) {
                      
    #                   concatCommands = ommandList.map(command){
    #                       return pacte0(send(command), '\n')
    #                   }
    #                   send(printer$Print)
    #               }
    



