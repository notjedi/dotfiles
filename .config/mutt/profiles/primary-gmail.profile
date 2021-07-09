unmailboxes *

set folder = "imaps://krithickumarub@gmail.com@imap.gmail.com:993"
set smtp_url = "smtps://krithickumarub@gmail.com@smtp@gmail.com:587"
set imap_pass = $PRIMARY_GMAIL_PASS
set smtp_pass = $PRIMARY_GMAIL_PASS

set from = "krithickumarub@gmail.com"
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

set header_cache = "~/.cache/mutt/gmail/primary/headers"
set message_cachedir = "~/.cache/mutt/gmail/primary/bodies"
set certificate_file = "~/.cache/mutt/gmail/primary/certificates"
# set imap_authenticators = "login"
# set imap_passive = "no"
# set imap_check_subscribed = "yes"
# set imap_list_subscribed = "yes"
# set mail_check = 60
