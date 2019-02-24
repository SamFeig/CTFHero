# Forgot Password  #

Forgot Password is a pcap file that contains a SMTP conversation.  The conversation is the transfer of an email.  I have a pcap that contains extra packets (302 total); however, I haven't checked to make sure that data has nothing important in.

# Solution #

The data can be read using a tool such as Wireshark.  In packet number 6 there is a link where a token is passed to a website.  The token (TUNBezU4MDc2MjY2NzZ9) can be decoded (it is in base64) to retrieve the flag MCA{5807626676}.