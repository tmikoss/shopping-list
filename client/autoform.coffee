AutoForm.setDefaultTemplate 'ionic'

AutoForm.hooks
  list:
    onSuccess: -> Router.go 'ListShow', _id: @docId
