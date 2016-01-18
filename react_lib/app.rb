require 'opal'
require 'browser/interval' # optional
require 'browser/delay'    # optional
# you can pull in the jQuery.js file here, or separately
# but in must be loaded BEFORE opal-jquery
require 'opal-jquery'      # optional
require 'reactive-ruby'

class App < React::Component::Base
  param :potato, type: String

  def render
    div do
      params.potato
      Clock()
      Nav()
      Messages()
      InputBox()
    end
  end

end

class Clock < React::Component::Base
  before_mount { @timer = every(1) { force_update! } }
  def render
    "The current time is #{Time.now}"
  end
end

class Clock2 < React::Component::Base
  def render
    div do
      App(potato: "a potato")
    end
  end
end

class Nav < React::Component::Base
  param :login, type: Proc

  before_mount do
    state.current_user_name! nil
    state.user_name_input! ""
  end

  def render
    div do
      input(type: :text, value: state.user_name_input, placeholder: "Enter Your Handle"
      ).on(:change) do |e|
        state.user_name_input! e.target.value
      end
      button(type: :button) { "login!" }.on(:click) do
        login!
      end if valid_new_input?
    end
  end

  def valid_new_input?
    state.user_name.present? && state.user_name_input != state.current_user_name
  end

  def login!
    state.current_user_name! state.user_name_input
    params.login(state.user_name_input)
  end

end

class Messages < React::Component::Base
  def render
    # eventually we will loop and display each message
    # for now we will just display one as an example
    Message()
  end
end

class Message < React::Component::Base

  def render
    FormattedDiv(markdown: "This **Markdown** will eventually be a message")
  end
end

class InputBox < React::Component::Base
  def render
    div do
      "An input box to send new messages will".br
      "go here plus a display of the formatted markdown".br
      FormattedDiv(markdown: "This **Markdown** will get updated as the user types")
    end
  end
end

class FormattedDiv < React::Component::Base

  param :markdown, type: String

  def render
    div do
      params.markdown
    end
  end
end
