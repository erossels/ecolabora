$(document).ready(function() {
  $('.btn-modal').on('click', function(){
    $('#ProductModal').modal('show') 
  })  

  $('.btn-close-modal').on('click',function(){
    $('.modal').modal('hide')
  })
});

