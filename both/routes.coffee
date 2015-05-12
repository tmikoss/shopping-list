Router.configure
  layoutTemplate: 'Layout'
  waitOn: -> Meteor.subscribe 'lists'

Router.map ->
  @route 'ListsIndex',
    path: '/'
    template: 'ListsIndex'
    data: ->
      lists: SL.Lists.find {}

  @route 'ListsShow',
    path: '/:_id'
    template: 'ListsShow'
    waitOn: -> Meteor.subscribe 'list_items'
    data: ->
      list: SL.Lists.findOne @params._id
      listItems: SL.ListItems.find { listId: @params._id }, { sort: { done: 1, updatedAt: -1 } }
