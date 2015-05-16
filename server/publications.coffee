Meteor.publishComposite 'lists',
  find: ->
    queries = [{ userId: @userId }]
    user = Meteor.users.findOne @userId
    if user?.services?.google?.email
      queries.push { sharedEmails: user.services.google.email }

    SL.Lists.find $or: queries
  children: [
    find: (list) -> SL.ListItems.find { listId: list._id }
  ]
