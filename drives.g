; drives.g
; Configures motor driver settings.


M569 P0 S1                           ; Physical drive 0 (X) goes forwards using default driver timings
M569 P1 S1                           ; Physical drive 1 (Y) goes forwards using default driver timings
M569 P2 S1                           ; Physical drive 2 (Z) goes forwards using default driver timings

M584 X0 Y1 Z2                        ; Set drive mapping

; Configure microstepping with interpolation
M350 X{global.motorMicroSteps} Y{global.motorMicroSteps} Z{global.motorMicroSteps} I1

; Calculate steps-per-mm based on microstep setting
; Milo lead-screws are 8mm pitch, with 1.8 degree motors or 200 steps per revolution
; Z axis is geared 2-1

var stepsPerMM = {((360 / global.motorStepDegrees) / global.leadScrewPitch) * global.motorMicroSteps}

; Set steps per mm. Z is geared 2:1
M92 X{var.stepsPerMM} Y{var.stepsPerMM} Z{var.stepsPerMM * 2}

M906 X{global.motorCurrentLimitX} Y{global.motorCurrentLimitY} Z{global.motorCurrentLimitZ} ; Set motor currents (mA)

M84                                  ; Disable motor idle current reduction
