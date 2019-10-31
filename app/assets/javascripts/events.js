$(document).ready(function() {
  $('#myModal').on('shown.bs.modal', function () {
    $('#myInput').focus()
  })

  $('.edit').on('click', function(event) {
    event.preventDefault();
    $.ajax({
      url: '/events/' + this.id + '/edit',
      type: 'GET',
      dataType: 'script'
    })
    .done(function() {
      console.log("success");
    })
    .fail(function() {
      console.log("error");
    })
  });

  $('.new').on('click', function(event) {
    event.preventDefault();
    $.ajax({
      url: '/events/new',
      type: 'GET',
      dataType: 'script'
    })
    .done(function() {
      console.log("success");
    })
    .fail(function() {
      console.log("error");
    })
  });
  
});
