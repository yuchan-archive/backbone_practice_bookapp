app = app or {}
app.Book = Backbone.Model.extend(
  defaults:
    coverImage: "img/placeholder.png"
    title: "No title"
    author: "Unknown"
    releasedate: "Unknown"
    keywords: "None"
  idAttribute: "id"
)
app.Library = Backbone.Collection.extend(
  model: app.Book
  url: '/api/books'
)
app.BookView = Backbone.View.extend(
  tagName: "div"
  className: "bookContainer"
  template: _.template($("#bookTemplate").html())
  render: ->
    
    #this.el is what we defined in tagName. use $el to get access to jQuery html() function
    @$el.html @template(@model.attributes)
    this
  events:
    'click .delete': 'deleteBook'  
  deleteBook: ->
    @model.destroy();
    @remove();
)

app.LibraryView = Backbone.View.extend(
  el: "#books"
  initialize: () ->
      @collection = new app.Library()
      @collection.fetch({reset:true})
      @render()

      @listenTo( @collection, 'add', @renderBook )
      @listenTo( @collection, 'reset', @render )

  # render library by rendering each book in its collection
  render: ->
    @collection.each ((item) ->
      @renderBook item
      return
    ), this
    return

  
  # render a book by creating a BookView and appending the
  # element it renders to the library's element
  renderBook: (item) ->
    bookView = new app.BookView(model: item)
    @$el.append bookView.render().el
    return
    
  events:
    'click #add':'addBook'

  addBook: (e) ->
      e.preventDefault()

      formData = {};

      $('#addBook div').children('input').each((i, el) ->
          if $(el).val() != ''
            if el.id is 'keywords'
              formData[ el.id ] = []
              if $(el).val().length > 0
                _.each( $(el).val().split(' '), (keyword) ->
                  formData[el.id].push(keyword))
            else if el.id is 'releasedate'
              formData[ el.id ] = $('#releasedate').datepicker('getDate').toUTCString()
            else
              formData[ el.id ] = $(el).val()
          $(el).val('')
      )

      @collection.create(formData)
)

$ ->
  $( '#releasedate' ).datepicker();
  new app.LibraryView();
  return