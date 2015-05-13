Template.ListCreate.events
  'submit form': (e) ->
    form = e.target

    name = form.name.value

    if name
      listId = SL.Lists.insert name: name

      Router.go 'ListShow', _id: listId

    false
