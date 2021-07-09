unmailboxes *

set folder = "imaps://krithickumar26@gmail.com@imap.gmail.com:993"
set smtp_url = "smtps://krithickumar26@gmail.com@smtp@gmail.com:587"
set imap_pass = $WORK_GMAIL_PASS
set smtp_pass = $WORK_GMAIL_PASS

set from = "krithickumar26@gmail.com"
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

set header_cache = "~/.cache/mutt/gmail/work/headers"
set message_cachedir = "~/.cache/mutt/gmail/work/bodies"
set certificate_file = "~/.cache/mutt/gmail/work/certificates"
