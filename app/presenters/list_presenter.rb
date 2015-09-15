class ApplicationPresenter
  attr_reader :current_user

  def initialize(options = {} )
    @current_user = options[:user]
    @tag = options[:tag]
  end

  def today
    Entry.today_for_user(current_user.id)
  end

  def tagged_entries
    tag = Tag.where(title: "#" + @tag).first.id
    Entry.where(tag_id: tag, user_id: current_user.id)
  end
end
