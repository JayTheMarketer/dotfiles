
## make hyper default terminal
on alfred_script(q)
  if (text 1 thru 2 of q) is equal to "cd" then
    do shell script "open -a Hyper " & text 4 thru -1 of q
  else
    do shell script "open -a Hyper ~"
      set appOpen to false
      set nbrOfTry to 0
      delay 0.5
      repeat
        try
          tell application "System Events"
            if exists (window 1 of process "Hyper") then
              set appOpen to true
              exit repeat
            end if
          end tell
        end try
        set nbrOfTry to nbrOfTry + 1
        if nbrOfTry = 20 then exit repeat
        delay 0.5
    end repeat
    if appOpen then tell application "System Events" to keystroke q & return
  end if
end alfred_script
