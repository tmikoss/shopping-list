ownedByCurrentUser = (userId, document) -> document.userId is userId

SL.Lists.allow
  insert: ownedByCurrentUser
  update: ownedByCurrentUser
  remove: ownedByCurrentUser

SL.ListItems.allow
  insert: -> true
  update: -> true
  remove: -> true
