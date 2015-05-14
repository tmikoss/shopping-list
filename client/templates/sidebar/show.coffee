Template.SidebarShow.helpers
  lists: ->
    SL.Lists.find {}, { sort: { name: 1 } }

  selectedClass: (path, fallbackClass) ->
    if Session.get('sidebar.selected') is path then 'item-positive' else fallbackClass
