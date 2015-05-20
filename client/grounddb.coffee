Meteor.startup ->
  Ground.Collection SL.Lists
  Ground.Collection SL.ListItems

subscribed = false
Tracker.autorun ->
  if Meteor.user()
    unless subscribed
      Meteor.subscribe 'lists'
      subscribed = true
  else
    subscribed = false
