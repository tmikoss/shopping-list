Template.ListShowCreateItem.events
  'submit form': (e) ->
    form = e.target
    name = form.name.value

    if name
      SL.ListItems.insert
        name: name
        listId: @list._id
        done: false
        updatedAt: new Date

      form.name.value = ''

    false

Template.ListShowItem.events
  "click [data-action='mark-as-done']": ->
    SL.ListItems.update @_id, $set: { done: true, updatedAt: new Date }

  "click [data-action='mark-as-not-done']": ->
    SL.ListItems.update @_id, $set: { done: false, updatedAt: new Date }

Template.ListShowItem.onRendered ->
  @autorun =>
    data = Template.currentData()

    @$('.item').hammer().off('swipeleft').on 'swipeleft', ->
      if data.done
        SL.ListItems.remove data._id


Template.ListShow.onRendered ->
  @find('.list-items')._uihooks =
    insertElement: (node, next) ->
      $node = $ node
      $node.css top: '-80px', opacity: 0
      $node.insertBefore next
      $node.addClass 'animate'
      $node.css 'top' # Force reflow
      $node.css top: 0, opacity: 1

    removeElement: (node) ->
      $node = $ node
      $node.css right: 0, opacity: 1
      $node.addClass 'animate'
      $node.css 'top' # Force reflow
      $node.css right: '100%', opacity: 0
      $node.on 'transitionend', -> $(this).remove()
