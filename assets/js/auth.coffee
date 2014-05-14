
class Facebook

  constructor: (@appId, @scope, load) ->
    load
      .loadScript "//connect.facebook.net/en_US/sdk.js"
      .then @initFacebook
    @scope.$on 'login', @login

  initFacebook: =>
    FB.init
      appId: @appId
      cookie: yes
      xfbml: yes
      version: 'v2.0'
    FB.getLoginStatus @statusChange

  statusChange: (response) =>
    switch response.status
      when 'connected'
        @loadUser()
        @authUser = response.authResponse
      when 'not_authorized'
        # user not authorized
      else
        console.log 'Not logged in to FB'
        # not logged into Facebook

  loadUser: =>
    FB.api '/me', (@user) =>
      @scope.user = @user
      @scope.$apply()

  login: =>
    FB.login @statusChange if FB

angular.module 'auth', ['urish.load']

  .factory 'facebook_app_id', ($window) -> $window.locals.FB_APP_ID

  .service 'Facebook', ['facebook_app_id', '$rootScope', 'angularLoad', Facebook]

