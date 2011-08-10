module NavigationHelpers
  def path_to(page_name)
      case page_name
      when /home/
        ENV['CUCUMBER_HOST']
      when /accueil/
        '/accueil'
      when /login/
        '/identification'
      else
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
end

World(NavigationHelpers)