Router.configure
  layoutTemplate: 'Layout'

Router.map ->
  @route 'ListIndex',
    path: '/'
    template: 'ListIndex'
    onBeforeAction: ->
      Session.set 'sidebar.selected', 'all'
      @next()
    data: ->
      lists: SL.Lists.find {}
      listItems: SL.ListItems.find {}, { sort: { done: 1, updatedAt: -1 } }

  @route 'ListCreate',
    path: '/lists/new'
    template: 'ListCreate'
    onBeforeAction: ->
      Session.set 'sidebar.selected', 'new'
      @next()
    data: ->
      list: {}

  @route 'ListShow',
    path: '/lists/:_id'
    template: 'ListShow'
    onBeforeAction: ->
      Session.set 'sidebar.selected', @params._id
      @next()
    data: ->
      list: SL.Lists.findOne @params._id
      listItems: SL.ListItems.find { listId: @params._id }, { sort: { done: 1, updatedAt: -1 } }

  @route 'ListUpdate',
    path: '/lists/:_id/edit'
    template: 'ListUpdate'
    onBeforeAction: ->
      Session.set 'sidebar.selected', @params._id
      @next()
    data: ->
      list: SL.Lists.findOne @params._id

  @route 'Logout',
    path: '/logout'
    onBeforeAction: ->
      Meteor.logout()
      Router.go '/'

Router.onBeforeAction ->
  if Meteor.userId()
    @next()
  else
    @render 'LoginShow', layoutTemplate: 'LayoutBlank'
