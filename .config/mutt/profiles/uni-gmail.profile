unmailboxes *

set folder = "imaps://krithickumar.ub.2019.cse@rajalakshmi.edu.in@imap.gmail.com:993"
set smtp_url = "smtps://krithickumar.ub.2019.cse@rajalakshmi.edu.in@smtp@gmail.com:587"
set imap_pass = $UNI_GMAIL_PASS
set smtp_pass = $UNI_GMAIL_PASS

set from = "krithickumar.ub.2019.cse@rajalakshmi.edu.in"
set realname = "Krithic Kumar"

set spoolfile = "+INBOX"
set record = "+Sent"
set trash = "+Trash"
set postponed = "+Drafts"
# set spoolfile = "imaps://imap.gmail.com:993/INBOX"
# set record = "imaps://imap.gmail.com:993/Sent"
# set trash = "imaps://imap.gmail.com:993/Trash"
# set postponed = "imaps://imap.gmail.com:993/Drafts"

mailboxes =INBOX =Sent =Trash =Drafts

set header_cache = "~/.cache/mutt/gmail/uni/headers"
set message_cachedir = "~/.cache/mutt/gmail/uni/bodies"
set certificate_file = "~/.cache/mutt/gmail/uni/certificates"
