
class Facebook

  isLoggedIn: no

  constructor: (appId) ->
    @appId = appId
    $(document).on 'click', 'a[href="/login"]', @login
    window.fbAsyncInit = @initFacebook
    Modernizr.load("//connect.facebook.net/en_US/sdk.js")

  initFacebook: =>
    console.log 'initFacbeook'
    FB.init
      appId: @appId
      cookie: yes
      xfbml: yes
      version: 'v2.0'
    FB.getLoginStatus @statusChange

  statusChange: (response) =>
    switch response.status
      when 'connected'
        @updateView()
      when 'not_authorized'
        console.log 'Not authorized'
      else
        console.log 'Not logged in to FB'

  login: (e) =>
    e.preventDefault()
    return unless FB
    FB.login @statusChange

  updateView: =>
    FB.api '/me', (user) =>



