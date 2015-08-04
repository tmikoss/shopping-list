Template.ListUpdate.events
  'click [data-action="delete"]': (e) ->
    IonPopup.confirm
      title: TAPi18n.__ 'list.confirmDelete.title'
      template: TAPi18n.__ 'list.confirmDelete.content'
      onOk: => SL.Lists.remove @list._id, -> Router.go 'ListIndex'
      okType: 'button-assertive'
