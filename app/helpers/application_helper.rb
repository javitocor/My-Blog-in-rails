module ApplicationHelper
    def user_avatar (user)
        if user.avatar.attached?
            user.avatar
        else
            'gotham.jpg'
        end
    end
    def full_title(page_title='')
        base_title = "Gotham Blog"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end
end
