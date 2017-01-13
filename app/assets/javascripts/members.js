document.addEventListener('turbolinks:load',function(){
  $('.trigger').click(function(e){
    e.preventDefault();
    var link = $(this).attr('data-link');
    $('#target').load(link)
  });
});
