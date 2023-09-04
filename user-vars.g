; Features
; Note we have to SET features, to override
; the defaults (all features disabled)
set global.featureLeds=true
set global.featureCasa=false
set global.featureScreen=true
set global.featureToolSetter=true
set global.featureTouchProbe=true

; Machine Name
global machineName="Milo V1.5 M016"

; Web UI Password
global dwcPassword="rrf"

; Logging settings
global logFilePath="/sys/log"
global logFileNum=3
global logFileName="rrf.log"

; Axis Settings
; Min:  Axis Minimum
; Max:  Axis Maximum
; Home: Direction and distance to move towards endstops
; Repeat: Direction and distance to move away from endstops when repeating probe
; Home and Repeat MUST be in opposite directions otherwise you will crash into
; your endstops.

global xMin=0
global xMax=335
global xHome=-345
global xHomeRepeat=5
global yMin=0
global yMax=209
global yHome=215
global yHomeRepeat=-5
global zMin=-120
global zMax=0
global zHome=125
global zHomeRepeat=-5

; Parking settings
global parkX={(global.xMax - global.xMin)/2} ; Park with the "bed" approximately in the middle
global parkY=global.yMax                     ; and at the front for operator ease-of-use.
global parkZ=global.zMax                     ; Think VERY hard before parking this anywhere else
                                             ; except Z=0 (zMax)

; Motor Current Overrides
; Note we have to SET these, to override
; the MCU default settings
set global.motorCurrentLimitX=2500
set global.motorCurrentLimitY=2500
set global.motorCurrentLimitZ=2500

; NOTE: The touch probe and toolsetter work in tandem.
; When probing a surface, we don't know (and can't know)
; the probe stickout. But if we probe a reference surface
; (the X gantry face) and we know the absolute height 
; of the toolsetter switch from the reference surface
; when activated, we can calculate the offset between
; the height of the toolsetter switch where we expect it
; to be activated, and where it is actually activated
; and this is our tool offset. 

; Used for both toolsetter and touch probe
global confirmUnsafeMove=true     ; Set this to false to move automatically to
                                  ; calculated probe locations. ONLY DO THIS WHEN
                                  ; YOU ARE CERTAIN THAT THE PROBING MACROS WORK
                                  ; PERFECTLY FOR YOUR SETUP.

global workZeroSafeHeight=20      ; Height above WCS Zero to confirm positioning
                                  ; with user. Set this high if you're not certain
                                  ; of the accuracy of your tool offset, as it avoids
                                  ; the possibility of ramming the tool into the work
                                  ; piece.

global confirmToolChange=true     ; Set this to false to disable requiring user
                                  ; confirmation after the tool change procedure
                                  ; before continuing. The tool will very likely be
                                  ; spun up instantly when confirming here so be
                                  ; very careful before you proceed!
; Toolsetter measurements

global toolSetterHeight=42.5         ; Height of toolsetter sexbolt surface when activated.
                                     ; from touchprobe reference surface
global toolSetterX=0                 ; X position of center of toolsetter
global toolSetterY=113               ; Y position of center of toolsetter
global toolSetterDistanceZ=5         ; Re-probing distance
global toolSetterJogDistanceZ=10     ; Once rough position of tool is found, back off
                                     ; to allow operator to jog tool over sexbolt.
                                       
global toolSetterNumProbes=5         ; Number of times to activate the toolsetter
                                     ; to calculate an average.
global toolSetterProbeSpeed=50       ; Feed rate to probe at in the Z direction.
global toolSetterProbeRoughSpeed=300 ; Feed rate to detect initial tool position


; Touch probe measurements
global touchProbeNumProbes=5
global touchProbeRadius=1         ; Radius of ball head on probe. Compensates for
                                  ; the direction in which the probe touches the surface
                                  ; when probing in X/Y directions.
global touchProbeDistanceXY=2     ; Distances that probe will be driven
global touchProbeDistanceZ=2      ; towards X, Y and Z faces of work piece.
                                  ; These values should be _lower_ than the
                                  ; over-travel protection of the touch probe
                                  ; being used, so as not to cause damage to
                                  ; the probe in the event of a failure to
                                  ; trigger.
global touchProbeSafeDistanceZ=10 ; Safe distance above probed work surface for
                                  ; non-probing X/Y moves.
global touchProbeReferenceX=0     ; X,Y co-ordinates of the reference surface to
global touchProbeReferenceY=65    ; use. The reference surface is a known surface
                                  ; from which offsets can be calculated. The distance
                                  ; in Z from the reference surface to the touch-
                                  ; probe activation point allows us to compensate for
                                  ; the length of the touch probe and tools. 

global touchProbeProbeSpeed=25    ; Speed to probe at in mm/min when calculating surface
                                  ; offsets.
global touchProbeRoughSpeed=300   ; Initial probe towards a surface is performed at this
                                  ; speed in mm/min
global touchProbeDwellTime=200    ; Time to pause after backing away from a surface
                                  ; before repeating a probe, to allow the machine
                                  ; to settle. Especially important if your machine limits
                                  ; are high or your machine is not particularly rigid.



; LED settings
global ledUpdates=true   ; Auto-update led colours based on printer and
                         ; network status.
global ledUpdateRate=500 ; Update led colours every 500 milliseconds


; Colours needed for spider king which flips green and red
global ledColourWarning={255, 255, 0, 255}    ; Yellow
global ledColourCancelling={165, 255, 0, 255} ; Yellow
global ledColourError={0, 255, 0, 255}        ; Red
global ledColourStartup={255, 255, 255, 255}  ; White
global ledColourReady={255, 0, 0, 255}        ; Green
global ledColourBusy={0, 0, 255, 255}         ; Blue
global ledColourPaused={255, 0, 255, 255}     ; Cyan

; For non-broken boards
; Note R and G channels are flipped
; global ledColourWarning={255, 255, 0, 255}    ; Yellow
; global ledColourCancelling={255, 165, 0, 255} ; Yellow
; global ledColourError={255, 0, 0, 255}        ; Red
; global ledColourStartup={255, 255, 255, 255}  ; White
; global ledColourReady={0, 255, 0, 255}        ; Green
; global ledColourBusy={0, 0, 255, 255}         ; Blue
; global ledColourPaused={0, 255, 255, 255}     ; Cyan