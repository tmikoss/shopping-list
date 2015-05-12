Meteor.publish 'lists', -> SL.Lists.find {}

Meteor.publish 'list_items', -> SL.ListItems.find {}
