$(document).ready(function() {

  $('.hero-index').on('click', 'li h3 a', function(event){
    event.preventDefault();
    var url = $(event.target).attr('href');
    $.ajax({
      url: url,
      method: 'get',
      success: function(response){
        $('.hero-index').replaceWith(response);
        console.log(response);}
      });
  });

  $('.rentals').on('click', '.rented .edit-link a', function(event){
    event.preventDefault();
    var url = $(event.target).attr('href');
    $.ajax({
      url: url,
      method: 'get',
      success: function(response){
        $('.rentals').replaceWith(response);
      }
    });
  });

  $('.rentals').on('click', '.rented .delete-link a', function(event){
    event.preventDefault();
    var url = $(event.target).attr('href');
    $.ajax({
      url: url,
      method: 'get',
      success: function(response){
        $('.rentals').replaceWith(response);
      }
    });
  })

  $('body').on('submit', '#delete-form', function(event){
    event.preventDefault();

    var $target = $(event.target)
    $.ajax({url: $target.attr('action'),
      method: 'DELETE',
      data: $target.serialize()
    }).done(function(response){
      location.reload();
    })
  });
})

