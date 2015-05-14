isSelected = (path, fallbackClass) ->
  if Session.get('sidebar.selected') is path then 'item-positive' else fallbackClass

Template.SidebarShow.helpers
  lists: ->
    SL.Lists.find {}, { sort: { name: 1 } }

Template.SidebarAllItems.helpers
  badgeCount: ->
    count = _.reduce SL.Lists.find({}).fetch(), ( (memo, list) -> memo + list.undoneItemCount ), 0
    if count > 0 then count else null

  selectedClass: -> isSelected 'all'

Template.SidebarList.helpers
  selectedClass: -> isSelected @_id
  badgeCount: -> if (@undoneItemCount and @undoneItemCount > 0) then @undoneItemCount else null

Template.SidebarNewList.helpers
  selectedClass: -> isSelected 'new', 'item-dark'
