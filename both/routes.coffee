Router.configure
  layoutTemplate: 'Layout'
  waitOn: -> Meteor.subscribe 'lists'

Router.map ->
  @route 'ListIndex',
    path: '/'
    template: 'ListIndex'
    data: ->
      lists: SL.Lists.find {}

  @route 'ListCreate',
    path: '/new'
    template: 'ListCreate'
    data: ->
      list: {}

  @route 'ListShow',
    path: '/:_id'
    template: 'ListShow'
    waitOn: -> Meteor.subscribe 'list_items'
    data: ->
      list: SL.Lists.findOne @params._id
      listItems: SL.ListItems.find { listId: @params._id }, { sort: { done: 1, updatedAt: -1 } }

  @route 'ListUpdate',
    path: '/:_id/edit'
    template: 'ListUpdate'
    data: ->
      list: SL.Lists.findOne @params._id
