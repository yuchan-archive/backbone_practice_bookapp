app = app or {}
app.Book = Backbone.Model.extend(defaults:
  coverImage: "img/placeholder.png"
  title: "No title"
  author: "Unknown"
  releaseDate: "Unknown"
  keywords: "None"
)
app.Library = Backbone.Collection.extend(model: app.Book)
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
  initialize: (initialBooks) ->
    @collection = new app.Library(initialBooks)
    @render()
    this.listenTo( this.collection, 'add', this.renderBook );
    return

  
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
            formData[ el.id ] = $(el).val()
      )

      @collection.add new app.Book(formData)
)

$ ->
  books = [
    {
      title: "JavaScript: The Good Parts"
      author: "Douglas Crockford"
      releaseDate: "2008"
      keywords: "JavaScript Programming"
    }
    {
      title: "The Little Book on CoffeeScript"
      author: "Alex MacCaw"
      releaseDate: "2012"
      keywords: "CoffeeScript Programming"
    }
    {
      title: "Scala for the Impatient"
      author: "Cay S. Horstmann"
      releaseDate: "2012"
      keywords: "Scala Programming"
    }
    {
      title: "American Psycho"
      author: "Bret Easton Ellis"
      releaseDate: "1991"
      keywords: "Novel Splatter"
    }
    {
      title: "Eloquent JavaScript"
      author: "Marijn Haverbeke"
      releaseDate: "2011"
      keywords: "JavaScript Programming"
    }
  ]
  new app.LibraryView(books)
  
  jQuery.get('/api/books', (data, textStatus, jqXHR) ->
      console.log 'Post response:'
      console.dir data
      console.log textStatus
      console.dir jqXHR
  )
  return