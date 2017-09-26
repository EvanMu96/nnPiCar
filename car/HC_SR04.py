import RPi.GPIO as GPIO
import time

def DISTANCE():

        GPIO.setmode(GPIO.BCM)
        TRIG = 19
        ECHO = 26
        GPIO.setup(TRIG,GPIO.OUT)
        GPIO.setup(ECHO,GPIO.IN)


        GPIO.output(TRIG,True)
        time.sleep(0.00001)
        GPIO.output(TRIG,False)


        while GPIO.input(ECHO) == 0:
                pass
        pulse_start = time.time()


        while GPIO.input(ECHO) == 1:
                pass
        pulse_end = time.time()


        pulse_duration = pulse_end - pulse_start
		distance = pulse_duration * 17150
        distance = round(distance,2)
        return distance

if __name__=='__main__':
    a=DISTANCE()
    print("Now distance is %s" % a)


