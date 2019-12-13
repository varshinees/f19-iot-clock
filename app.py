from flask import Flask, request
import queue
from math import sqrt
app = Flask(__name__)

accelist = queue.Queue(maxsize=60)

#calibration values for X,Y, and Z
calX = 0.0
calY = 0.0
calZ = 0.0
#count of calibration and threshold values
#I hope this works
calCount = 0
threshold = 2000
numCountToReturnAlert = 25
alert = False

@app.route('/')
def server_front_page():
    s = 'Welcome to the Server for the IOT Clock Team. :) The back end members of the team who contributed to building this server are Sindhu, Varshinee, Ameesha, and Santi.'
    global alert
    if alert:
        return "ALERT!!!!"
    return s
    

@app.route('/data')
def process_data():
    args = request.args
    prevData = []
    global calCount
    global calX
    global calY
    global calZ 
    global alert
    prevData.append(int(args['x']))
    prevData.append(int(args['y']))
    prevData.append(int(args['z']))
    #sum up the values for the first 5 seconds to calibrate the sensor
    if (calCount  < 10):
        calX = calX + prevData[0]
        calY = calY + prevData[1]
        calZ = calZ + prevData[2]
        calCount = calCount + 1
        return "calibrating"
    # find the average to obtain the calibrated values for x, y, z
    elif (calCount == 10):
        calX = calX / 10.0
        calY = calY / 10.0
        calZ = calZ / 10.0
        calCount = calCount + 1
        return 'calibrating'
    #
    else:    
        accel = 0
        sum = pow(prevData[0] - calX, 2) + pow(prevData[1] - calY, 2) + pow(prevData[2] - calZ, 2)
        accel = sqrt(sum) 
        if (accelist.full()):
            accelist.get()
        accelist.put(accel)
        
        count = 0
        for elem in list(accelist.queue):
            if (elem > threshold):
                count = count + 1
        if (count > numCountToReturnAlert):
            alert = True
            return 'ALERT'
        else:
            return str(list(accelist.queue))   

if __name__ == '__main__':
    app.debug = True
    app.run()
    
