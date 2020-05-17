json.text @comment.text
json.user_name @comment.user.name
json.date @comment.created_at.to_s(:datetime)