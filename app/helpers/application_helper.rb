module ApplicationHelper
    def user_avatar (user)
        if user.avatar.attached?
            user.avatar
        else
            'gotham.jpg'
        end
    end
end
