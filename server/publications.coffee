Meteor.publish 'lists', -> SL.Lists.find { userId: @userId }

Meteor.publish 'list_items', (listId)-> SL.ListItems.find { listId: listId }
