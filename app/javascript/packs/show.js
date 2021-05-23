document.addEventListener("turbolinks:load", function() {
  $('.btn-modal').on('click', function(){
    $('#PhotosModal').modal('show');
  })  

  $('.btn-close-modal').on('click',function(){
    $('.modal').modal('hide');
  })

});

