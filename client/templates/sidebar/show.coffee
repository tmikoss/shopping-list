isSelected = (path, fallbackClass) ->
  if Session.get('sidebar.selected') is path then 'item-positive' else fallbackClass

Template.SidebarShow.helpers
  lists: ->
    SL.Lists.find {}, { sort: { name: 1 } }

Template.SidebarAllItems.helpers
  selectedClass: -> isSelected 'all'
  badgeCount: ->
    count = SL.ListItems.find(done: { $ne: true }).count()
    if count > 0 then count else null

Template.SidebarList.helpers
  selectedClass: -> isSelected @_id
  badgeCount: ->
    count = SL.ListItems.find(listId: @_id, done: { $ne: true }).count()
    if count > 0 then count else null
  shared: -> @sharedEmails?.length > 0

Template.SidebarNewList.helpers
  selectedClass: -> isSelected 'new', 'item-dark'
