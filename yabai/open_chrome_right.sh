#!/bin/bash

osascript <<EOF
tell application "Google Chrome" 
    activate 
    repeat with w in windows 
        if (name of w contains "right") then 
            set index of w to 1 
            return 
        end if 
    end repeat 
end tell 
EOF
