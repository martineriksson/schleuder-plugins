# This plugin is inspired by the following quote by Richard Stallman:
#
# "For personal reasons, I do not browse the web from my computer.  (I
# also have not net connection much of the time.)  To look at page I
# send mail to a demon which runs wget and mails the page back to me.
# It is very efficient use of my time, but it is slow in real time."
#
# http://lwn.net/Articles/262570/
#
# Usage: Send mail to list-request with the following command:
#
#     X-CURL: www.example.org
#
# Dependencies:
# * curl for fetching URLs
# * Lynx for extracting text content and links
#
module Schleuder
  class StallmanBrowserPlugin < Plugin
    def initialize
      @plugin_type = :request
    end

    def curl mail, url
      `curl #{url} | lynx -stdin -dump -force_html`
    end
  end
end
