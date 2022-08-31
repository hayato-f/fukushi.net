module ApplicationHelper
    # ↓タイトル表示を動的にする
    def full_title(page_title = '')
        default_title = "福祉.net"
        if page_title.empty?
            default_title
        else
            full_title = default_title + " | " + page_title
        end
    end
     

end
