#!/bin/sh
#
# Quick script to enable call duration for phones on Sprint
# See http://predev.wikidot.com/hidden-features

# Set the default going forward
luna-send -n 1 palm://com.palm.systemservice/setPreferences '{"phoneAppHideCallDuration": false}'

# Set the right bit inside cookies.db
sqlite3 /var/palm/data/cookies.db "update Cookies set value = '%220%22' where domain_head = '.usr.palm.applications.com.palm.' and domain_tail = 'app.phone' and path = '/usr/palm/applications/com.palm.app.phone' and name = 'mojo_cookie_hidecalllogduration';"

# Now check if the bit was set correctly. The answer should be 0.
# sqlite3 /var/palm/data/cookies.db "select * from Cookies where domain_tail = 'app.phone';" | awk -F\| '{print $5}' | sed -e 's/%22//g'

