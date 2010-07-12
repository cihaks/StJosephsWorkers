# Time formats:
# 
#   hh:nn:ss
#   hh-nn-ss
#   h:nn
#   h.nn
#   h nn
#   h-nn
#   h:nn_ampm
#   h.nn_ampm
#   h nn_ampm
#   h-nn_ampm
#   h_ampm
# 
# NOTE: Any time format without a meridian token (the ‘ampm’ token) is considered in 24 hour time.

# Date formats:
# 
#   yyyy/mm/dd
#   yyyy-mm-dd
#   yyyy.mm.dd
#   m/d/yy  OR  d/m/yy
#   m\d\yy  OR  d\m\yy
#   d-m-yy
#   d.m.yy
#   d mmm yy
# 

# Datetime formats:
# 
#   m/d/yy h:nn:ss   OR  d/m/yy hh:nn:ss
#   m/d/yy h:nn      OR  d/m/yy h:nn
#   m/d/yy h:nn_ampm OR  d/m/yy h:nn_ampm
#   yyyy-mm-dd hh:nn:ss
#   yyyy-mm-dd h:nn
#   ddd mmm d hh:nn:ss zo yyyy # Ruby time string
#   yyyy-mm-ddThh:nn:ssZ  # ISO 8601 without zone offset
#   yyyy-mm-ddThh:nn:sszo # ISO 8601 with zone offset
# 

# Here is what each format token means:
# 
#   Format tokens:
#        y = year
#        m = month
#        d = day
#        h = hour
#        n = minute
#        s = second
#        u = micro-seconds
#     ampm = meridian (am or pm) with or without dots (e.g. am, a.m, or a.m.)
#        _ = optional space
#       tz = Timezone abbreviation (e.g. UTC, GMT, PST, EST)
#       zo = Timezone offset (e.g. +10:00, -08:00, +1000)
# 
#   Repeating tokens:
#        x = 1 or 2 digits for unit (e.g. 'h' means an hour can be '9' or '09')
#       xx = 2 digits exactly for unit (e.g. 'hh' means an hour can only be '09')
# 
#   Special Cases:
#       yy = 2 or 4 digit year
#     yyyy = exactly 4 digit year
#      mmm = month long name (e.g. 'Jul' or 'July')
#      ddd = Day name of 3 to 9 letters (e.g. Wed or Wednesday)
#        u = microseconds matches 1 to 3 digits
# 
# All other characters are considered literal. For the technically minded (well you are developers), 
# these formats are compiled into regular expressions at runtime so don’t add any extra overhead 
# than using regular expressions directly. So, no, it won’t make your app slow!

ValidatesTimeliness::Formats.add_formats(:date, "mmddyyyy")
