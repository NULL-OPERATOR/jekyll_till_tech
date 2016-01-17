require 'opal'
require 'browser/interval' # optional
require 'browser/delay'    # optional
# you can pull in the jQuery.js file here, or separately
# but in must be loaded BEFORE opal-jquery
require 'opal-jquery'      # optional
require 'reactive-ruby'
# here you can require other files, do a require_tree, or
# just add some components inline right here...
class Clock < React::Component::Base

  after_mount do
    every(1) { force_update! }
  end

  def render
    "Hello there - Its #{Time.now}"
  end
end

Document.ready? do
  Element['#content'].render{ Clock() }
end
