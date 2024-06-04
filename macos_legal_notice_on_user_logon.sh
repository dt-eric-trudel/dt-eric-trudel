loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
LastLog=$(last -n 5 $loggedInUser | grep 'ttys000'| grep --line-buffered 2)
osascript -e 'tell app "System Events" to display dialog "This system is restricted to DiliTrust authorized users. Unauthorized access is a violation of company policy and the law.

Last login data and time : '$LastLog'"'