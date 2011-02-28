#Router

* This will become a table of contents (this text will be scraped).
{:toc}

All of your app's routing configuration can be found in
<tt>config/routes.rb</tt> and are contained inside of a block:

    Merb::Router.prepare do
      match("/").to(:controller => 'whatever', :action => 'index')
    end
{:lang=ruby html_use_syntax=true}  

## Matching routes
The simplest route matches a path in the requested URl to a controller and action

    match("/hotdogs").to(:controller => 'food', :action => 'index')
{:lang=ruby html_use_syntax=true}

The string inside the <tt>match</tt> method will will send any matching URLs to
the controller and action specified in the <tt>to</tt> method. For example
<tt>http://localhost/hotdogs</tt> will now be sent to the <tt>Food</tt> controller's
<tt>index</tt> method.

match can accept variable and optional parts of a URL:

    match("/hotdogs/:mustard").to(:controller => 'whatever', :action => 'index')
{:lang=ruby html_use_syntax=true}

By adding **:mustard** the URL will now need another segment, such as <tt>http://localhost/hotdogs/yesplease</tt>.
This will still be routed to the <tt>Food</tt> controller's <tt>index</tt> action, with the addition
of the last segment (<tt>yesplease</tt>) being added to the <tt>params[]</tt> hash.

Note that <tt>http://localhost/hotdogs</tt> doesn't work anymore, it doesn't have enough URL segments.
Instead of adding extra routes to handle getting a hotdog with or without a mustard parameter
an optional segment can be used:

    match("/hotdogs(/:mustard)").to(:controller => 'whatever', :action => 'index')
{:lang=ruby html_use_syntax=true}

By putting any part of a match in parenthesis it becomes optional. This works for both
parameters that are passed into the params hash (prefixes with a colon) and for plain
segments.

Optional segments can be nested:

    match("/hotdogs(/:mustard(/:onions))").to(:controller => 'whatever', :action => 'index')
{:lang=ruby html_use_syntax=true}

This would catch such variations as:
- http://localhost/hotdogs, <tt>params[:mustard]</tt> = nil, <tt>params[:onions]</tt> = nil
- http://localhost/hotdogs/yes, <tt>params[:mustard]</tt> = "yes", <tt>params[:onions]</tt> = nil
- http://localhost/hotdogs/yes/hold, <tt>params[:mustard]</tt> = "yes", <tt>params[:onions]</tt> = "hold"

TODO: add more about params using regexs

## To controllers and actions
the <tt>to</tt> method can do more than just decide what controller and action will be used.
You can list any variable you like in the <tt>to</tt> clause and it will be sent as part of
the <tt>params</tt> hash.

    match("/hotdogs").to(:controller => 'food', :action => 'index', :pickles => 'never')
{:lang=ruby html_use_syntax=true}
Now you would have <tt>params[:pickles]</tt> ="never"

TODO: add more about lambdas and other request modifications such as content-type

## Resource routes
    