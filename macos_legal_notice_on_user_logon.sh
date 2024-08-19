username="$(stat -f%Su /dev/console)"
realname="$(dscl . -read /Users/$username RealName | cut -d: -f2 | sed -e 's/^[ \t]*//' | grep -v "^$")"
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
LastLog=$(last -n 5 $loggedInUser | grep 'ttys000'| grep --line-buffered 2 | cut -d' ' -f30,31,32,33)
osascript -e 'tell app "System Events" to display dialog "This system is restricted to DiliTrust authorized users. Unauthorized access is a violation of company policy and the law.

Last login data and time : '$realname' - '$LastLog'"'
