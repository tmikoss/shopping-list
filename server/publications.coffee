Meteor.publishComposite 'lists',
  find: -> SL.Lists.find { userId: @userId }
  children: [
    find: (list) -> SL.ListItems.find { listId: list._id }
  ]
