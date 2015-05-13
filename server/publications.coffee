Meteor.publish 'lists', -> SL.Lists.find {}

Meteor.publish 'list_items', (listId)-> SL.ListItems.find { listId: listId }
