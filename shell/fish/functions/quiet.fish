# Defined in /var/folders/z7/n40sfdt53cd8d_130wz7s79h0000gp/T//fish.txR6Uo/quiet.fish @ line 2
function quiet
	if not count $argv > /dev/null
        return 0
    end

    # quote every argument so spacing is preserved
    set evalstr (string escape -- $argv)
    # eval the command with output silenced
    eval "$evalstr 2>&1 > /dev/null" 2>&1 > /dev/null; and return 0; or return 1
end
