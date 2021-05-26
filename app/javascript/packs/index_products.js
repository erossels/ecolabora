document.addEventListener("turbolinks:load", function() {
    $('[data-toggle="tooltip"]').tooltip()

    $('.fa-bell').on('click', function(){
      $('#AlertModal').modal('show') 
    }) 
        
    $('.btn-close-modal').on('click',function(){
      $('.modal').modal('hide')
    })
});

