module ApplicationHelper

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
        when :message then "alert alert-info"
    end
  end

  def groups_sentence(user)
    user.groups.collect{|group| group.name}.to_sentence
  end

  def groups_select
    Group.all.collect{ |g| [g.name, g.id] }
  end

end
