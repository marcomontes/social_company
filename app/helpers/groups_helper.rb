module GroupsHelper

  def users_sentence(group)
    group.users.collect{|user| user.name}.to_sentence
  end

end
