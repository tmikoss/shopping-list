Router.configure
  layoutTemplate: 'Layout'

Router.map ->
  @route 'Root',
    path: '/'
    template: 'ListsIndex'
    waitOn: -> [
      Meteor.subscribe 'lists'
      Meteor.subscribe 'list_items'
    ]
    data: ->
      lists: SL.Lists.find {}
