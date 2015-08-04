SL.Lists = new Mongo.Collection 'lists'

SL.Lists.attachSchema new SimpleSchema
  name:
    type: String
    label: -> TAPi18n.__ 'list.name'
    max: 20
  userId:
    type: String
    autoform:
      omit: true
    autoValue: -> if @isInsert then @userId else @unset()
  sharedEmails:
    type: [String]
    label: -> TAPi18n.__ 'list.sharedEmails'
    autoform:
      type: 'tags'
    optional: true
    regEx: SimpleSchema.RegEx.Email

if Meteor.isServer
  SL.Lists._ensureIndex { userId: 1 }
  SL.Lists._ensureIndex { sharedEmails: 1 }
