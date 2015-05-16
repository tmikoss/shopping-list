SL.Lists = new Mongo.Collection 'lists'

SL.Lists.attachSchema new SimpleSchema
  name:
    type: String
    max: 20
  userId:
    type: String
    autoform:
      omit: true
    autoValue: -> if @isInsert then @userId else @unset()
  sharedEmails:
    type: [String]
    label: 'Shared with'
    optional: true
    regEx: SimpleSchema.RegEx.Email

SL.ListItems = new Mongo.Collection 'list_items'
