#!/bin/bash

osascript -e '
-- Copy current tab url
tell application "Google Chrome"
  activate
  set theURL to URL of active tab of front window
  set the clipboard to theURL
end tell

-- Close the current tab
tell application "System Events"
  keystroke "w" using command down 
end tell

tell application "Chrome Canary" to activate
tell application "System Events"
  keystroke "t" using command down -- Open a new tab
  keystroke "v" using command down -- Paste the URL
  key code 36 -- Press Return
end tell
'
